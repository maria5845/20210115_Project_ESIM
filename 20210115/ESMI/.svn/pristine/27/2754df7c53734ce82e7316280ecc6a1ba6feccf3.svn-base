<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
//***********************************************************************************************

//데이트피커 설정
//임시 데이터 있는 날짜로 변경
// var now = new Date();
// ClKendo.fnCreateDatePicker({selector : "#edate", value: '2020-06-21', min: null
// 	, change: function() { fnGetLotList()}
// });
// ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: '15:05:00', change: function() { fnGetLotList()}});
// now.setMinutes(now.getMinutes()-10);
// ClKendo.fnCreateDatePicker({selector : "#sdate", value: '2020-06-21', min: null, change: function() { fnGetLotList()}}); 
// ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '15:00:00', change: function() { fnGetLotList()}});
// now.setDate(new Date().getDate()-1);

ClKendo.fnCreateDatePicker({selector : "#edate", value: '${edate}', min: null, change: function() { fnGetLotList()}});
ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: '${etime}', change: function() { fnGetLotList()}});
ClKendo.fnCreateDatePicker({selector : "#sdate", value: '${sdate}', min: null, change: function() { fnGetLotList()}}); 
ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '${stime}', change: function() { fnGetLotList()}});

var comOpt = {
		animation: false,
		title: {
			textStyle:{
				color: '#b9b7b7',
				fontSize : 15,
				fontFamily: 'LGSmHaR'
			},
			top : 7,
			left: 35
		},
		legend:{
			show: true,
			type: 'scroll',
			width : '1200px',
			pageIconColor : '#fff',
			pageIconInactiveColor : '#87878f'
		},
		toolbox: {
	        show: true,
	        feature: {
// 	            dataView: {
// 			        title : 'data view',
// 	            	readOnly: false,
// 	            	lang : ['data view', 'Close', 'Refresh']
// 	            },
	            saveAsImage: {
	            	title : 'Save as image',
	            }
	        }
	    },
		tooltip:{
// 			triggerEvent: true
			trigger: 'axis',
			axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#777'
                }
            },
            position: function (pos, params, el, elRect, size) {
                var obj = {top: 10};
                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                return obj;
            },
		},
		xAxis: {
	        type: 'category',
			show: true,
			axisLabel: {
				showMinLabel: false,
				showMaxLabel: false,
			}
	    },
	    yAxis: {
	        type: 'value'
	    },
		series:[ 
			{
				type: 'line',
// 				symbolSize: 10,
			},{
				type: 'line',
// 				symbolSize: 10,
			}
		],
		dataZoom:[
			{
				show: true
			},{
				show: false
			}
		],
		grid:{
			show: true,
			backgroundColor: '#32323d',
			top: '40',
			bottom: '70',
			right: '20',
			left: '6%',
			triggerEvent: true,
		},
		backgroundColor: '#32323d',
}

$(document).ready(function(){
	getTree('/pmng/paraTreeAjax.do', '.var_tree');
	getTree('/pmng/ctqTreeAjax.do', '.ctq_tree');
	fnGetLotList();//lot 조회
})

var chart1, chart2, chart3;
//***********************************************************************************************


//차트 크기 변경
function ontoggleSize(_class){
	
	$("." + _class + " i").toggleClass('fa-expand');
	$("." + _class + " i").toggleClass('fa-compress');
	
	switch (_class) {
	case 'ctq':
		$(".para i").toggle();
		$(".chart_group .ctq").toggleClass('big');
		$(".chart_group .para").toggleClass('big');
		$(".chart_group .alarm").toggle();
		break;
	case 'para':
		$(".chart_group .ctq").toggle();
		$(".chart_group .para").toggleClass('big');
		$(".chart_group .alarm").toggleClass('big');
		break;
	default:
		$(".chart_group .chart_box").removeClass('big');
		break;
	}
	
	for (var i = 1; i <= 3; i++) {
		var _dom = document.getElementById('chart' + i);
	    var chart = echarts.getInstanceByDom(_dom);
		chart.resize();
	}
}

//Lot 정보 조회
function fnGetLotList(){
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');
	
	ClAjax.fnCallAjax({
		url: "/pmng/getLotList.do",
		paramJsn : {
			sdate : sdate,
			edate : edate,
		},
		sucFn: function(data){
			if(data.data.list != null){
				l = data.data.list;
				
				var lotDrop = $("#lot_id").data("kendoDropDownList");
				
				if(undefined != lotDrop){
					lotDrop.destroy(); //기존 lot 삭제
				}
				
				lotDrop = $("#lot_id").kendoDropDownList({
					optionLabel: "Lot_id",
					noDataTemplate: $("#noDataTemplate").html(),
					height: '116px',
				    dataTextField: "lot_id",
				    dataValueField: "lot_id",
				    dataSource: l
				});
				
			}
		},
		errHandle: true,
		compltFn: function(data){
		}
	});
}


//조회
function search(){
	//알람 존에 툴팁 제거
	$('.tooltip').remove();
	
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');

	var sel_list = fnGetChckItms('.ctq_tree');
	var ctq_var_arr = [];
	
	sel_list.forEach(function(i, idx){
		var val = i.text;
		ctq_var_arr.push(val);
	})
	
    if(ctq_var_arr.length <= 0){
    	alert("Please select CTQ variables.");
    	return;
    }
    if(ctq_var_arr.length > 5){
    	alert("You can select up to 5 CTQ variables.");
    	return;
    }
	
	drawCTQChart(ctq_var_arr);
 	
 	
	var sel_list = fnGetChckItms('.var_tree');
	var var_arr = [];
	
	sel_list.forEach(function(i, idx){
		var val = i.tree_desc;
		var_arr.push(val);
	})
	
    if(var_arr.length <= 0){
    	alert("Please select Parameter variables.");
    	return;
    }
	
	drawParaChart(sdate, edate, var_arr);
	drawAlarmChart(sdate, edate);
}

//트리 조회
function getTree(_url, _class){
	ClAjax.fnCallAjax({
		url : _url,
		sucFn: function(data){
			var l = eval(data.data.list);
// 		     console.log(l);
			$(_class).kendoTreeView({
				checkboxes: {
					checkChildren: true,
				},
				select: function(e){
					// 모든 Tree 노드 중 텍스트가 들어간 노드(.k-in)의 포커스 class 제거
					$("span.k-in").removeClass("k-state-focused");
					e.preventDefault();
// 					_node.childNodes[0].childNodes[1].setAttribute("class", "k-in");
				},
				check: function(e){
					if(typeof fnLnbChkBx == 'function') fnLnbChkBx();
				},
				dataSource: l,
			});
			
			$(_class).on("click", ".k-in", function(e){
			    e.stopPropagation();
			    $(this).parent().find(".k-checkbox-wrapper:first input").click();
			});
			
			var treeview = $(_class).data("kendoTreeView");
			// 2번째 tree 까지만 보여진다.
			treeview.collapse(".k-item .k-item");
		},
		compltFn: function(){
		},
		errHandle: true,
	});
}




//차트 그리기
function drawCTQChart(_var_arr){
	var sdate = $('#sdate').val().replaceAll('-', '');
	var edate = $('#edate').val().replaceAll('-', '');
	var stime = $('#stime').val().replaceAll(':', '');
	var etime = $('#etime').val().replaceAll(':', '');
	
	var varIdQuery = '';
    
    var defaultQuery =', |varId|_nm, |varId|_position, |varId|_result, coalesce(|varId|_data_val, 0) as |varId|_data_val'
    
    for(var i = 0; i < _var_arr.length; i++){
        var varid = _var_arr[i];
        varIdQuery += defaultQuery.replaceAll('|varId|', varid);
    }
	
	ClAjax.fnCallAjax({
		url : '/pmng/getCtqRawList.do',
		paramJsn : {
			sdate : sdate,
			edate : edate,
			stime : stime,
			etime : etime,
			lot_id : $('#lot_id').val(),
			varIdQuery : varIdQuery
		},
		sucFn : function(data) {
			var l = data.data.list;
			
			if(l.length > 0){
					// data가 있을때만 그린다.
		            
		            var _xAxis = []; // x축 시간 데이터
		            var _series = []; // 전체 데이터 취합용
		            var _series0 = []; // Series Object
		            var _series1 = []; // Series Object
		            var _series2 = []; // Series Object
		            var _series3 = []; // Series Object
		            var _series4 = []; // Series Object
			            
					var tmp =[];
			            	
					$.each(l, function(idx, item){
// 						console.log(l);
// 						console.log(_var_arr);
						
						if(_var_arr.length >= 1 ){
							_xAxis.push(item.data_tm);
							var tm_val1 = eval('"'+_var_arr[0]+'"').toLowerCase();
// 							console.log(tm_val1);
// 							console.log(eval("item."+tm_val1+"_data_val"));
							_series0.push([item.data_tm, eval("item."+tm_val1+"_data_val")]);
						}
						if(_var_arr.length >= 2 ){
							var tm_val2 = eval('"'+_var_arr[1]+'"').toLowerCase();
							_series1.push([item.data_tm, eval("item."+tm_val2+"_data_val")]);
						}
						if(_var_arr.length >= 3 ){
							var tm_val3 = eval('"'+_var_arr[2]+'"').toLowerCase();
							_series2.push([item.data_tm, eval("item."+tm_val3+"_data_val")]);
						}
						if(_var_arr.length >= 4 ){
							var tm_val4 = eval('"'+_var_arr[3]+'"').toLowerCase();
							_series3.push([item.data_tm, eval("item."+tm_val4+"_data_val")]);
						}
						if(_var_arr.length >= 5 ){
							var tm_val5 = eval('"'+_var_arr[4]+'"').toLowerCase();
							_series4.push([item.data_tm, eval("item."+tm_val4+"_data_val")]);
						}
					})
							
					for(var i = 0; i < _var_arr.length; i++){
						_series.push({
							type      : 'line',
							name      : _var_arr[i],
							data      : eval("_series" + i), 
						});
					}
					
					//중복 시간 제거
					_xAxis = Array.from(new Set(_xAxis));
					
					// 차트 옵션
					var customOption = {
						legend: {
						   data: _var_arr,
						},
						xAxis: {
						   data: _xAxis,
						},
						series: _series,
					};
		            
		            // 차트 옵션 설정
		            customOption = $.extend(true, {}, comOpt, customOption);
					
		            var _dom = document.getElementById('chart1');
		            var c = echarts.getInstanceByDom(_dom);
					if(c != null){
						c.dispose();
						c = null;
					}
		            
					chart1 = echarts.init(_dom, 'dark');
					
					chart1.setOption(customOption);
					//3개의 차트 그룹
					chart1.group = 'group1';
			}
				
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
		},
	}); 
}


//차트 그리기
function drawParaChart(sdate, edate, var_arr){
    
	ClAjax.fnCallAjax({
		url : '/pmng/zsRawAjax.do',
		paramJsn : {
			st_md : $('#sdate').val().replaceAll('-', '').substring(4),
			et_md : $('#edate').val().replaceAll('-', '').substring(4),
			sdate : sdate,
			edate : edate,
			var_arr : var_arr,
		},
		sucFn : function(data) {
			var l = data.data.list;
			if(l){
					// data가 있을때만 그린다.
		            var varNmArr = Object.keys(ClArray._groupBy(l, ["var_id"]));
		            var arr = ClArray._groupBy(l, ["var_id"]);
		            
		            var _xAxis = []; // x축 시간 데이터
		            var _series = []; // Series Object
		            for(var i=0; i<varNmArr.length; i++){
						var tmp = [];
		            	$.each(arr[varNmArr[i]], function(idx, item){
						   if(i==0)_xAxis.push(item.data_tm);
						   
					 		tmp.push([item.data_tm, item.data_val]);
// 					 	 	tmp.push(Math.round(Math.random()*100, 2));
						})
						
						_series.push({
							type      : 'line',
							name      : varNmArr[i],
							data      : tmp, 
						});
// 						console.log(tmp)
					}
// 		            console.log(_series);

		            //중복 시간 제거
					_xAxis = Array.from(new Set(_xAxis));
		            
					// 차트 옵션
					var customOption = {
					      legend: {
					         data: varNmArr,
					      },
					      xAxis: {
					         data: _xAxis,
					      },
					      series: _series,
					};
		            
// 					console.log(customOption);
		            // 차트 옵션 설정
		            customOption = $.extend(true, {}, comOpt, customOption);
		            
		            var _dom = document.getElementById('chart2');
		            var c = echarts.getInstanceByDom(_dom);
					if(c != null){
						c.dispose();
						c = null;
					}
					chart2 = echarts.init(_dom, 'dark');
					chart2.setOption(customOption);
					//3개의 차트 그룹
					chart2.group = 'group1';
					echarts.connect('group1');
			}
			
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
		},
	}); 	
}

function drawAlarmChart(sdate, edate){
	
	ClAjax.fnCallAjax({
		url : '/pmng/trendAlarmAjax.do',
		paramJsn : {
			st_md : $('#sdate').val().replaceAll('-', '').substring(4),
			et_md : $('#edate').val().replaceAll('-', '').substring(4),
			sdate : sdate,
			edate : edate,
// 			var_id : var_id,
		},
		sucFn : function(data) {
			var l = data.data.list;
			
			var xAxis = [];
			var xAxisData = [];
			var yAxisData = [];
			var seriesData1 = [];
		
			var customOption = {};
			//수집항목 그룹 리스트
			var varNmArr = Object.keys(ClArray._groupBy(l, ["var_gr"]));
// 			//수집항목 그룹 하위 리스트
		    var arr = ClArray._groupBy(l, ["var_gr"]);
		    yAxisData = varNmArr;
// 			yAxisData = ['BM', 'PD', 'No Buffer', 'Material \n replace', 'User Stop'];
			
			for(var i=0; i<varNmArr.length; i++){
				
				$.each(arr[varNmArr[i]], function(idx, item){
					if(i==0)xAxisData.push(item.data_tm);
					
					//heatmap 시간이 중복되어도 가장 마지막 값만 표현
					seriesData1.push([item.data_tm, item.var_gr , item.data_val]);
				})
			}
			
			customOption = {
				backgroundColor: '#32323d',
				dataZoom:[
					{
						show: true
					},{
						show: false
					}
				],
				tooltip:{
					show: false
				},
			    animation: false,
			    grid: {
			        top: '5%',
			        left: '6%',
			        right: '20',
			        bottom: '27%'
			    },
			    xAxis: {
			        type: 'category',
			        data: xAxisData,
			        show: true,
			    },
			    yAxis: {
			        type: 'category',
			        data: yAxisData,
			        show: true,
			        axisLabel: {
			            interval: 0,
			            formatter: function (value, index) {
				            if(value == 'Material Replacement'){
				            	return 'Material\nReplacement'
				            }else{
				            	return value;
				            }
				        },
					},
			    },
			    visualMap: {
			        show: false,
			        min: 0,
			        max: 10,
			        calculable: true,
			        orient: 'horizontal',
			        left: 'center',
			        bottom: '15%',
			        type: 'piecewise',
			        pieces: [
			            {value: 0, label: '0 (custom special color) ', color: 'grey'},
			            {value: 1, label: '1 (custom special color) ', color: 'red'},
			            {value: 3, label: '3 (custom special color) ', color: '#FFCC00'},
			        ]
			    },
			    series: [
			    	{
				        name: 'BM',
				        type: 'heatmap',
				        data: seriesData1,
				        emphasis: {
				            itemStyle: {
				                shadowBlur: 10,
				                shadowColor: 'rgba(0, 0, 0, 0.5)'
				            }
				        }
			    	},
	    	   ]
			};
				
// 			chart3 = echarts.init(document.getElementById('chart3'), 'dark');
			
			// 차트 옵션 설정
			var _dom = document.getElementById('chart3');
            var c = echarts.getInstanceByDom(_dom);
			if(c != null){
				c.dispose();
				c = null;
			}
			chart3 = echarts.init(_dom, 'dark');
			
			chart3.setOption(customOption);
			
			//3개의 차트 그룹
// 			chart3.group = 'group1';
// 			echarts.connect('group1');
				
			chart3.on('click', function (params) {
				if(params.componentType == "series") {
// 					console.log(params);
					
	 				var clickTime = params.name;
		 			var seriesNm = params.data[1]; //y축 값
		 			
	 				var sdate = clickTime.substr(0,10).replaceAll('-','');
	 				var stime = clickTime.substr(11).replaceAll(':','');
					
// 	 				console.log(clickTime);
// 	 				console.log(seriesNm);
// 	 				console.log(params.dataIndex);
// 	 				2020-07-13 17:07:38
// 	 				trendMoni.do:725 BM
// 	 				trendMoni.do:726 3455
	 				
	 				//이미 생성된 tooltip 제거
	 				$('.tooltip').remove();
	 				
	 				ClAjax.fnCallAjax({
	 					url : '/pmng/trendAlarmClickAjax.do',
	 					paramJsn : {
	 						sdate : clickTime,
	 						var_gr : seriesNm
	 					},
	 					sucFn : function(data) {
	 						var l = data.data.list;
	 						
	 						if('undefined' != l && l.length > 0){
	 							
								var alarm_detail = '<div class="tooltip">';
								alarm_detail += '<button type="button" class="close-pop">팝업 닫기</button>';
								for(var i = 0; i < l.length; i++){
									if(0 != i) alarm_detail += '<br>';
									alarm_detail += 'Trouble Code : '+ l[i].trouble_cd+'<br>';								
									alarm_detail += 'Start / End: '+ l[i].start_dt+' / '+ l[i].end_dt+'<br>';
// 									alarm_detail += 'Trouble Code : '+ l[i].trouble_cd+'<br>';								
									alarm_detail += 'Loss Detail Code : '+ l[i].loss_detail_cd+'<br>';								
									alarm_detail += 'Diff Time '+ l[i].diff_days+'<br>';
								}
								alarm_detail += '</div>';
								
								$('.chart_title.alarm').append(alarm_detail);
								
								//x버튼 클릭시 툴팁 제거
								$('.close-pop').on('click', function (){
									$('.tooltip').remove();
								})
	 						}
							
	 					},
	 					errHandle : true,
	 					errFn: true,
	 					compltFn : function() {
	 					},
	 				})
	 				
				}
			});	
			
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
		},
	}); 	
}

/**
 * 선택된 체크박스의 객체 array를 가져오는 function
 */
function fnGetChckItms(_class){
	if($(_class).length > 0){
		return fnGetChckNds($(_class).data('kendoTreeView').dataSource.view());
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
		
		//가장 마지막 node만 가져감
		if (node.checked && !node.hasChildren) {
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
		
		fnActChckNdsChild(n[index], _checked)
	}
}

/**
 * 엑셀 만들기
 * type : 'raw', 'ctq'
 */
function fnCreateExcel(_type){
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');
	
	var sel_list = [];
	var _var_arr = [];
	if('raw' != _type){
		sel_list = fnGetChckItms('.ctq_tree');
		
		sel_list.forEach(function(i, idx){
			var val = i.tree_desc.toLowerCase();
			if("" != val && undefined != val){
				_var_arr.push(val+"_data_val");
			}
		})
		
	}else{
		sel_list = fnGetChckItms('.var_tree');

		sel_list.forEach(function(i, idx){
			var val = i.tree_desc;
			_var_arr.push(val);
		})
		
	}
	
	//빈 arr 항목 제거
	if(_var_arr.length > 0){
		_var_arr = _var_arr.filter(function(item) {
		  return item !== null && item !== undefined && item !== '';
		});
	}
	
	var f = document.createElement('form');
	
	var _data = {
			sdate : sdate,
			edate : edate,
			var_arr: _var_arr,
			set_type: _type
	};
	
	f.method = "POST";
	f.action = "/pmng/chartCVSDownload.do";
	f.target = "winExcelFrame";
	
	$.fileDownload(f.action,{
	    httpMethod: "POST",
	    data:_data,
	    successCallback: function(data){
	 		kendo.ui.progress($('body'), false);
	    },
	    failCallback: function(){
	    	kendo.ui.progress($('body'), false);
	    }
	});
	
	
}



</script>
