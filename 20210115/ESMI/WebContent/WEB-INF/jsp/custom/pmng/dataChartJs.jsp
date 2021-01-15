<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
//차트 x축 datazoom binding 처리를 위한 array
var syncChart = [];

//데이트피커 설정
var now = new Date();
ClKendo.fnCreateDatePicker({selector : "#sdate", value: now, min: null}); 
ClKendo.fnCreateDatePicker({selector : "#edate", value: now, min: null});
ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: now});
now.setMinutes(now.getMinutes()-60);
ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: now});

var colorArray = ['#ff0000','#00cc00', '#0099ff', '#ffff00'];

//날짜세팅
function setDate(){
	var sdate;
	var edate;
	
	sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '') + '000';
	edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '') + '999';
	
	return {
		"sdate" : sdate,
		"edate" : edate
	}
}

//기본 실행 함수들
fnTreeIt();

//조회
function search(){
	var sdate = setDate().sdate;
	var edate = setDate().edate;
	var diff = (sttParse(edate) - sttParse(sdate))/1000/60/60;
	
	if(sdate >= edate){
		alert("Please set the search period accurately.");
		return;
	}

	if(diff > 1){
		alert("You can search within 1 hour.");
		return;
	}
	
	var unit = fnGetChckItms();
	
	if(!unit[0]){
		alert("Please select a unit");
		return;
	}
	
	kendo.ui.progress($('body'), true);
	fnChartData(unit);
}


//차트 데이터
function fnChartData(unit){
	var d_id = unit[0].dvc_id;
	d_id = d_id.substring(4);
	var sdate = setDate().sdate;
	var edate = setDate().edate;
	
	ClAjax.fnCallAjax({
		url : '/pmng/cylinderChartAjax.do',
		paramJsn : {
			dvc_id : d_id,
			sdate : sdate,
			edate : edate,
		},
		errHandle : true,
		sucFn: function(data){
			syncChart = [];
			var _list = data.data.list;
			var threhold = data.data.th_list;
			var damage;
			var warning;
			
			if(threhold.length > 0) {
				damage = threhold[0];
				warning = threhold[1];
			}
			
			// data가 있을때만 그린다.
			if(_list.length > 0){
				$("#no_crt1").html("");
				$("#no_crt2").html("");
				
				var dataList = ClArray._groupBy(_list, ["var_id"]);
				var varGrArr = Object.keys(dataList);
				
				for(var i=0; i<varGrArr.length; i++){
					if(varGrArr[i] == "RMS"){
						fnDrawChart(dataList[varGrArr[i]], '1', damage);
						
					}else{
						fnDrawChart(dataList[varGrArr[i]], '2', warning);
						
					} 
				}
				
				var crt1 = echarts.init(document.getElementById('chart1'));
		      	var crt2 = echarts.init(document.getElementById('chart2'));
			    syncChart.push(crt1);
			    syncChart.push(crt2);
			    
			    bindAction(syncChart);
			} else {
				// 차트 데이터가 없을경우 이전차트 지우기
				var crt1 = echarts.getInstanceByDom(document.getElementById('chart1'));
				var crt2 = echarts.getInstanceByDom(document.getElementById('chart2'));
				
				if(crt1) crt1.dispose();
				if(crt2) crt2.dispose();
				
				$("#no_crt1").html("NO RECORD FOUND");
				$("#no_crt2").html("NO RECORD FOUND");
			}
		},
		compltFn: function(){
			kendo.ui.progress($('body'), false);
		}
	});
}

//차트 생성
function fnDrawChart(_arr, _idx, _th){
	var _dom = document.getElementById('chart' + _idx);
	var chart = null;

	var xAxisData = [];
	var series = [];
	var dataZoom = [];
	var customOption = {};
	
	// 기존 생성된 차트가 있을 경우
	if( _dom.hasChildNodes() ){
		chart = echarts.getInstanceByDom(_dom);
		var chart_opt = chart.getOption();// 차트옵션
		
		// 차트 Series 데이터 초기화
		chart_opt.xAxis[0].data = new Array();
		chart_opt.series = new Array();
		
		// Data_val
		var varNm = null;
		var arrSeries = [];
		_arr.forEach(function(item, idx){
			if(idx ==0)varNm = item.var_id;
			arrSeries.push(item.data_val);
			xAxisData.push(item.data_tm);
		});
		
		if(_th != undefined) {
			series.push(
				{
					type: 'line',
					name: varNm,
					color: colorArray[_idx],
					data: arrSeries,
					label:{
						color:'rgb(255, 255, 255)'
					},
					showSymbol: false,
			        hoverAnimation: false,
			        lineStyle: {
			        	width: 1
			        }
				},
				//markLine 생성(범례 추가)
				{
					name: 'Damaged',
					type: 'line',
					color: colorArray[0],
					markLine:{
						data:[
							{
								name:'Damaged',
								yAxis: _th['th1'],
								lineStyle:{color:colorArray[0], type:'solid'}
							},
							{
								name: 'Damaged', 
								yAxis: _th['th4'],
								lineStyle:{color:colorArray[0], type:'solid'}
							}
						],
						label: {show: false},
				 		symbol: 'none'
					},
					label:{
						color:'rgb(255, 255, 255)'
					},
				},
				{
					name: 'Warning',
					type: 'line',
					color: colorArray[3],
					markLine:{
						data:[
							{
								name:'Warning',
								yAxis: _th['th2'],
								lineStyle:{color:colorArray[3], type:'solid'}
							},
							{
								name: 'Warning', 
								yAxis: _th['th3'],
								lineStyle:{color:colorArray[3], type:'solid'}
							}
						],
						label: {show: false},
				 		symbol: 'none'
					},
					label:{
						color:'rgb(255, 255, 255)'
					}
				}
			);
		} else {
			series.push(
					{
						type: 'line',
						name: varNm,
						color: colorArray[_idx],
						data: arrSeries,
						label:{
							color:'rgb(255, 255, 255)'
						},
						showSymbol: false,
				        hoverAnimation: false,
				        lineStyle: {
				        	width: 1
				        }
					},
				);
		}
		
		xAxisData = Array.from(new Set(xAxisData)).sort();
		chart_opt.xAxis[0].data = xAxisData;
		chart_opt.series = series; 
		customOption = $.extend(true, {}, chart_opt, {series: chart_opt.series, xAxis: chart_opt.xAxis})
	}else{
		// chart 신규 생성
		chart = echarts.init(_dom);
		// Data_val
		var varNm = null;
		var arrSeries = [];
		_arr.forEach(function(item, idx){
			if(idx ==0)varNm = item.var_id;
			arrSeries.push(item.data_val);
			xAxisData.push(item.data_tm);
		});
		
		if(_th != undefined) {
			series.push(
				{
					name: varNm,
					type: 'line',
					color: colorArray[_idx],
					data: arrSeries,
					label:{
						color:'rgb(255, 255, 255)'
					},
					showSymbol: false,
			        hoverAnimation: false,
			        lineStyle: {
			        	width: 1
			        }
				},
				//markLine 생성(범례 추가)
				{
					name: 'Damaged',
					type: 'line',
					color: colorArray[0],
					markLine:{
						data:[
							{
								name:'Damaged',
								yAxis: _th['th1'],
								lineStyle:{color:colorArray[0], type:'solid'}
							},
							{
								name: 'Damaged', 
								yAxis: _th['th4'],
								lineStyle:{color:colorArray[0], type:'solid'}
							}
						],
						label: {show: false},
				 		symbol: 'none'
					},
					label:{
						color:'rgb(255, 255, 255)'
					},
				},
				{
					name: 'Warning',
					type: 'line',
					color: colorArray[3],
					markLine:{
						data:[
							{
								name:'Warning',
								yAxis: _th['th2'],
								lineStyle:{color:colorArray[3], type:'solid'}
							},
							{
								name: 'Warning', 
								yAxis: _th['th3'],
								lineStyle:{color:colorArray[3], type:'solid'}
							}
						],
						label: {show: false},
				 		symbol: 'none'
					},
					label:{
						color:'rgb(255, 255, 255)'
					}
				}
			);
		} else {
			series.push(
				{
					name: varNm,
					type: 'line',
					color: colorArray[_idx],
					data: arrSeries,
					label:{
						color:'rgb(255, 255, 255)'
					},
					showSymbol: false,
			        hoverAnimation: false,
			        lineStyle: {
			        	width: 1
			        }
				},
			);
		}
		
		dataZoom.push(
	        {
	        	id: 'dataZoomX',
	            type: 'slider',
	            xAxisIndex: 0,
	            filterMode: 'empty',
	        }
		);
		xAxisData = Array.from(new Set(xAxisData)).sort();
		
		customOption = {
			grid:{
				top: '10%',
				bottom: '20%',
				right: '2%',
				left: '3%',
			},
			tooltip: {
				trigger: 'axis',
				axisPointer: {
		            type: 'cross',
		            label: {
		                backgroundColor: '#6a7985'
		            }
		        },
		        textStyle: {
		        	fontSize: 12,
		        	fontWeight: 'lighter'
		        }
			},
			xAxis: {
		        data: xAxisData,
		        boundaryGap: true,
		        axisLabel: {
		        	interval: 'auto',
		        	showMinLabel: false,
		        	align: 'center',
		        }
		    },
		    yAxis: [
		    	{
					type: 'value',
					axisLine:{
		            	show: true,
			        	lineStyle:{
			        		color: '#fff'
			        	}
			        },
			        splitLine : {
						show : true,
						lineStyle: {
							type: 'dashed'
						},
					},
				},
			],
			dataZoom: dataZoom,
			series: series
		};
		
		customOption = $.extend(true, {}, defChartOpt, customOption);
	}
	
	// 차트 옵션 설정
	chart.setOption(customOption, {
	    notMerge: true,
	});
}

$(window).on('resize', function(){
	for (var i = 1; i < 3; i++) {
		var chart = echarts.getInstanceByDom(document.getElementById('chart' + i));
		
	    if(chart != null && chart != undefined){
	        chart.resize();
	    }
	}
});

//차트 기본옵션
var defChartOpt = {
		legend: {
			type : 'scroll',
			itemGap : 20,
			itemHeight: 12,
			textStyle:{
				fontSize: 12,
				color: '#fff'
			},
			pageIconColor : '#C40452'
		},
		textStyle: {
			fontFamily: 'LGSmHaR',
		},
		grid: {
		    left: 50,
		    top: 70,
		    right: 50,
		    bottom: 40
		},
		xAxis: {
			axisTick:{
	            alignWithLabel: true,
	            length:5
	        },
	        axisLine:{
	        	lineStyle:{
	        		color: '#fff'
	        	}
	        }
		},
		backgroundColor: '#32323D',
		yAxis: {
            min: function(item){
                var diff = item.max-item.min;
                if(diff == 0) {diff = 1}
                return (item.min - ((diff) * 0.2)).toFixed(2);
            },
            max: function(item){
                var diff = item.max-item.min;
                if(diff == 0) {diff = 1}
                return (item.max + ((diff) * 0.2)).toFixed(2);
            },
		}
}

/**
 * 좌측트리 그리기
 */
function fnTreeIt() {
	$('#rfrshIcon').removeClass('display-none');
	ClAjax.fnCallAjax({
		url : '/pmng/cylinderTreeAjax.do',
		sucFn: function(data){
			var treeList = data.data.tree_list;
			
			//HierarchicalDataSource Data 세팅
			var total_code = [];
			var code_type = {
				dvc_id: 'CYLINDER',
				expanded: true,
				items : treeList
			}
			total_code.push(code_type);
		    var treeDataSource = new kendo.data.HierarchicalDataSource({
		    	data: total_code
		    });
		    
		    $("#treeDiv").remove();
			$(".tree").append("<div id='treeDiv'></div>");
			$("#treeDiv").kendoTreeView({
				select: function(e){
					//전체 라디오 리스트
					var radio_list = $("#treeDiv").data('kendoTreeView').dataSource.view();
					
					//속성 checked 해제 (초기화)
					for (var i = 0; i < radio_list[0].items.length; i++) {
						radio_list[0].items[i].checked = false;	
					}
					
					// 선택시 라디오 버튼 체크(화면)
					var i = $("#treeDiv").data('kendoTreeView').dataItem(e.node).index;
					$("input:radio").eq(i).prop( "checked", true );
					
					//checked 속성 부여
					radio_list[0].items[i].checked = true;
					
					e.preventDefault();
					search();
				},
				dataSource: treeDataSource,
				dataValueField: ["dvc_id"],
				dataTextField: ["dvc_id"],
				template: kendo.template($("#radio-treeview").html()),
			});
			
			//처음 0번 index checked
			var radio_list = $("#treeDiv").data('kendoTreeView').dataSource.view();
			radio_list[0].items[0].checked = true;
			$("input:radio").eq(0).prop( "checked", true );
			
			//0번 index 검색(처음)
			search(); 
		},
 		compltFn: function(){
			kendo.ui.progress($('.tree'), false);
		},
		errHandle: true,
	});
	
}

/**
 * Tree 관련 
 * 선택된 체크박스의 객체 array를 가져오는 function
 */
function fnGetChckItms(){
	if($("#treeDiv").length > 0){
		return fnGetChckNds($("#treeDiv").data('kendoTreeView').dataSource.view());
	}else{
		return null;
	}
}


/**
 * Recursive 함수. 체크박스 선택값 가져오기
 */
function fnGetChckNds(nodes){
	var node, childCheckedNodes;
	var checkedNodes = [];
	
	for (var i = 0; i < nodes.length; i++) {
		node = nodes[i];
		if (node.checked) {
			// json 객체가 아닌, 특정값을 넣고싶다면 이부분을 수정
			checkedNodes.push(node);
		}
			
		if (node.hasChildren) {
			childCheckedNodes = fnGetChckNds(node.children.view());
			if (childCheckedNodes.length > 0){
				checkedNodes = checkedNodes.concat(childCheckedNodes);
			}
		}
	}
	return checkedNodes;
}

/**
 * 글씨 선택시, check 액션(부모)
 */
function fnActChckNdsParent(_node, _checked){
	if(_node == null) return false;
	
	_node.checked = _checked;
	if(_node.checked){
		delete _node.dirty;
	}else{
		_node.dirty = true;
	}
}

/**
 * 글씨 선택시, check 액션(자식)
 */
function fnActChckNdsChild(_node, _checked){
	if(_node == null) return false;
	
	var n = _node.items;
	
	for(var index in n){
		n[index].checked = _checked;
		
		fnActChckNdsChild(n[index], _checked);
	}
}

/**
 * dataZoom, tooltip 같이 움직이는 함수
 */

function bindAction(chartList) {
    echarts.util.each(chartList, function(fromChart) {
        echarts.util.each(chartList, function(toChart) {
            if (fromChart === toChart) {
                return;
            }

            fromChart.on('updateAxisPointer', function(params) {
                var payload = toChart.makeActionFromEvent(params);

                // Remove y info from payload.axesInfo.
                var axesInfo = payload.axesInfo || [];
                for (var i = axesInfo.length - 1; i >= 0; i--) {
                    if (axesInfo[i].axisDim === 'y') {
                        axesInfo.splice(i, 1);
                    }
                }

                toChart.dispatchAction(payload, true);
            });

            fromChart.on('dataZoom', function (params) {
             if(typeof params.batch != "undefined"){
                 //Chart 내부 Zoom 동시 적용
                   toChart.dispatchAction({
                      type: 'dataZoom',
                       dataZoomId: 'dataZoomX',
                       dataZoomIndex: params.batch[0].dataZoomIndex,
                       start: params.batch[0].start,
                       end: params.batch[0].end
                   }, true);
             } else {
                 //handle 컨트롤시 동시 적용
                toChart.dispatchAction({
                       type: 'dataZoom',
                       dataZoomId: 'dataZoomX',
                       dataZoomIndex: params.dataZoomIndex,
                       start: params.start,
                       end: params.end
                   }, true);
             }
            });
        });
    });
}

/**
 * Excel 다운로드 데이터 setting
 */
function fnExportExcel(var_id){
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '') + '000';
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '') + '999';
	var unit = fnGetChckItms();
	var d_id = unit[0].dvc_id;
	d_id = d_id.substring(4);
	var var_id2 = 'RMS';
		
	if (var_id == 'MinPlusMax'){
		var_id2 = 'PEAK';
	}
	
	//차트쪽 데이터
	var _param = {
			actionUrl: '/pmng/getCylinderExcelAjax.do',
			data: {
				dvc_id : d_id,
				var_id : var_id,
				sdate : sdate,
				edate : edate,
				excelFileName: 'Cylinder_Monitoring' + '_' + var_id2 +  '_' + now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2)
	    	}
	}
	ClExcel.fnCommonExcelDown(_param);
}

/**
 * 실린더 차트 이미지 다운로드
 */
function getChartImg(var_id){
	var idx = var_id == 'RMS' ? 0 : 1;
	let canvas = document.getElementsByTagName("canvas");
	
    if(canvas&&canvas.length>0){
        // create label
        let tempA = document.createElement("a");
        // Set download name
        tempA.download = "echarts_" + var_id + "_" + now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2) +".png";
        // Set address and file type
        tempA.href = canvas[idx].toDataURL("image/png");
        document.body.appendChild(tempA);
        // Trigger download event
        tempA.click();
        // Remove Tag
        tempA.remove();
     }else{
    	 alert("There is no data to save.");
     }
} 

</script>