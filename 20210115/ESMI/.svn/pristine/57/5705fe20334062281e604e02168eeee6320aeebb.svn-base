<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript">
//***********************************************************************************************

//공통
var commonJsn = {
	search_limit: 3, // 기간 검색 제한 (시 단위)
}


var var_arr = [];

//화면에 있는 var_id 조회 후 배열 만들기
// t_vision_raw 에 usl,lsl 추가로 로직 변경 (20.09.02)
// var classList = document.getElementsByClassName('var_id');
// for (var i = 0; i < classList.length; i++) {
// 	var_arr.push(classList[i].classList[4]);
// }

//데이트피커 설정
//var now = new Date();
//임시 데이터 있는 날짜로 변경
// ClKendo.fnCreateDatePicker({selector : "#edate", value: '2020-06-21', min: null
// 	, change: function() { fnGetLotList()}
// });
// ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: '15:05:00', change: function() { fnGetLotList()}});

// now.setMinutes(now.getMinutes()-10);
// ClKendo.fnCreateDatePicker({selector : "#sdate", value: '2020-06-21', min: null, change: function() { fnGetLotList()}}); 
// ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '15:00:00', change: function() { fnGetLotList()}});
ClKendo.fnCreateDatePicker({selector : "#edate", value: '${edate}', min: null
	, change: function() { fnGetLotList()}
});
ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value:'${etime}', change: function() { fnGetLotList()}});

ClKendo.fnCreateDatePicker({selector : "#sdate", value: '${sdate}', min: null, change: function() { fnGetLotList()}}); 
ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '${stime}', change: function() { fnGetLotList()}});

//차트 개수 지정
$("#make_num").change( function() {
	num = $("#make_num").val();
	fnMakeChart(num);
});
var chartParamJsn;
//기본으로 설정되어 있는 chartParamJsn
<c:if test="${empty chart_jsn}">
	chartParamJsn = [{"id":"chart1","title":"A1U/A2U","var_arr":["A1U","A2U"]},{"id":"chart2","title":"A2U/A3U","var_arr":["A2U","A3U"]},{"id":"chart3","title":"A4U/TS_U","var_arr":["A4U","TS_U"]},{"id":"chart4","title":"A5U/A6U","var_arr":["A5U","A6U"]},{"id":"chart5","title":"A2L/A3L/A4L/TS_U","var_arr":["A2L","A3L","A4L","TS_U"]},{"id":"chart6","title":"TW_I/TW/A5L/A6L","var_arr":["TW_I","TW","A5L","A6L"]},{"id":"chart7","title":"A5L/A6L/TH_A/TW","var_arr":["A5L","A6L","TH_A","TW"]},{"id":"chart8","title":"A6L/TH_A","var_arr":["A6L","TH_A"]},{"id":"9","title":"SM2/SM3/SM4","var_arr":["SM2","SM3","SM4"]}];
</c:if>

//아이디별로 설정되어 있는 chartParamJsn
<c:if test="${!empty chart_jsn}">
	var chartParamJsn = ${chart_jsn[0].chart_jsn};
</c:if>

//차트 공통 옵션
var comOpt = {
		animation: false,
		title: {
// 			triggerEvent: true,
			show: false,
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
			width : '350px',
			pageIconColor : '#fff',
			pageIconInactiveColor : '#87878f'
		},
		toolbox: {
	        show: true,
	        feature: {
	            saveAsImage: {
	            	title : 'Save as image',
	            }
	        }
	    },
		tooltip:{
			show: true,
			trigger: 'axis',
// 			axisPointer: {
//                 type: 'cross',
//                 label: {
//                     backgroundColor: '#777'
//                 }
//             },
			position: function (pos, params, el, elRect, size) {
                var obj = {top: 0};
                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                return obj;
            },
		},
		xAxis: {
	        type: 'category',
			show: false,
			triggerEvent: true
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
				showMinLabel: false,
				showMaxLabel: false,
			},
			axisLine:{
	            show : false
	        },
	        axisTick:{
	            show : false
	        },
	        splitLine:{
	            show : false
	        }
	    },
		series:[ 
			{
				type: 'line',
				markLine: {
					symbol: false,
					silent: true,
	                label: {
	                    show: false,
	                },
	                lineStyle: {
	                    color: "#FF0000",
	                    type: 'solid'
	                },
            	},
            	symbolSize: 7
			},{
				type: 'line',
				symbolSize: 7
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
			bottom: '50',
			right: '40',
			left: '40',
			triggerEvent: true,
		},
		backgroundColor: '#32323d',
}

$(document).ready(function(){
	fnMakeChart(4); //2x2로 차트 만듬
	fnGetLotList();//lot 조회
 	search();
})
//***********************************************************************************************

//조회
function search(){
	
	sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '') + '000';
	edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '') + '999';
	
	var diff = (sttParse(edate) - sttParse(sdate))/1000/60/60;
	
	if(sdate >= edate){
		alert("The time range is set incorrectly.");
		return;
	}

	//너무 많은 데이터로 ctq 차트 그리지 못함
	if(diff > commonJsn.search_limit){
		alert("Search within "+commonJsn.search_limit+" hours.");
		return;
	}
	
	fnGetCTQList(); //상단의 ctq 값 조회
	fnCheckCTQAlert(); //sv값 변경시에 경고문 
}


/**
 * CTQ 데이터 조회 
 */
function fnGetCTQList(){
	var sdate = $('#sdate').val().replaceAll('-', '');
	var edate = $('#edate').val().replaceAll('-', '');
	var stime = $('#stime').val().replaceAll(':', '');
	var etime = $('#etime').val().replaceAll(':', '');
	
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url: "/pmng/errTrackCTQAjax.do",
		paramJsn : {
			stime : sdate+stime,
			etime : edate+etime,
			lot_id : $('#lot_id').val()
		},
		sucFn: function(data){
			var l = data.data.list;
			
			if(l.length > 0){
				$.each(l, function(idx, item) {
					$('.ctq_list.'+item.var_id+'.'+item.gubun).text(item.data_val);		
				});
			}
			
		},
		errHandle: true,
		compltFn: function(data){
			fnGetChartJsn(); //차트 정보 
		}
	});
}

/**
 * CTQ SV 값 등이 중간에 변경될 경우 경고창
 */
function fnCheckCTQAlert(){
	if(undefined == $('#lot_id').val()) {
		return;
	}
	
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');
	
	ClAjax.fnCallAjax({
		url: "/pmng/getCheckCtqAlert.do",
		paramJsn : {
			sdate : sdate,
			edate : edate,
		},
		sucFn: function(data){
			if(data.data.list != null){
				l = data.data.list;
				if(l.length > 0){
					if(l[0].is_alert_cnt > 0){
						alert("The value has been changed within the search period\n"
							+ "Change time :" + l[0].change_time);
					}
				}
			}
		},
		errHandle: true,
		compltFn: function(data){
		}
	});
	
}
/*
 * 차트 영역그리기
 */
function fnMakeChart(num){
	if(num == 1) {
		$(".chart_box1")
			.css("display", "block").css("width", "100%").css("height", "98%");	
		
		$(".chart_box2, .chart_box3, .chart_box4, .chart_box5, .chart_box6, .chart_box7, .chart_box8, .chart_box9")
			.css("display", "none");
	}
	if(num == 2) {
		$(".chart_box1, .chart_box2")
			.css("display", "block").css("width", "98%").css("height", "49%");	
		
		$(".chart_box3, .chart_box4, .chart_box5, .chart_box6, .chart_box7, .chart_box8, .chart_box9")
			.css("display", "none");
	}
	if(num == 4) {
		$(".chart_box1, .chart_box2, .chart_box3, .chart_box4")
			.css("display", "block").css("width", "49%").css("height", "50%");	
		
		$(".chart_box5, .chart_box6, .chart_box7, .chart_box8, .chart_box9")
			.css("display", "none");
	}
	if(num == 6) {
		$(".chart_box1, .chart_box2, .chart_box3, .chart_box4, .chart_box5, .chart_box6")
			.css("display", "block").css("width", "49%").css("height", "33%");	
		
		$(".chart_box7, .chart_box8, .chart_box9")
			.css("display", "none");
	}
	if(num == 9) {
		
		$(".chart_box1, .chart_box2, .chart_box3, .chart_box4, .chart_box5, .chart_box6, .chart_box7, .chart_box8, .chart_box9")
			.css("display", "block").css("width", "33%").css("height", "32%");	
	}
	
	//차트 리사이징
	for (var i = 1; i <= num; i++) {
		var _dom = document.getElementById('err_chart' + i);
	    var chart = echarts.getInstanceByDom(_dom);
	    
	    if(chart != null && undefined != chart ){
	    	var grid_top, grid_bottom, grid_right, grid_left;
			if(num == 1) {
				grid_top = '10%', grid_bottom = '10%', grid_right = '2%', grid_left = '4%';
			} else if (num == 2){
				grid_top = '17%', grid_bottom = '20%', grid_right = '1%', grid_left = '4%';
			} else if (num == 4){
				grid_top = '17%', grid_bottom = '20%', grid_right = '2%', grid_left = '6%';
			} else if (num == 6){
				grid_top = '24%', grid_bottom = '30%', grid_right = '2%', grid_left = '5%';		
			} else if (num == 9){
				grid_top = '24%', grid_bottom = '30%', grid_right = '5%', grid_left = '5%';		
			}
			
			var customOption = {
					grid:{
						top: grid_top,
						bottom: grid_bottom,
						right: grid_right,
						left: grid_left,
					},
			}
			chart.setOption(customOption);
			chart.resize();
	    }
	}
}

/*
 * Lot 정보 조회
 */
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


//차트 json 정보 가져옴
function fnGetChartJsn(){
	
	ClAjax.fnCallAjax({
		url: "/pmng/errTrackChartJsnAjax.do",
		sucFn: function(data){
			if(data.data.chart_jsn != null){
				chartParamJsn = data.data.chart_jsn[0].chart_jsn;
				chartParamJsn = JSON.parse(chartParamJsn);
			}
		},
		errHandle: true,
		compltFn: function(data){
			isProcessing = false;
			callChartAjax(1);
		}
	});
}


function callChartAjax(j){
    
//  for(var i = 1; i <= chartParamJsn.length; i++){
//      var chart = null;
//      //각 차트별로 Ajax 호출
//      drawChart(i);
//  }

    var sdate = $('#sdate').val().replaceAll('-', '');
    var edate = $('#edate').val().replaceAll('-', '');
    var stime = $('#stime').val().replaceAll(':', '');
    var etime = $('#etime').val().replaceAll(':', '');
    kendo.ui.progress($('body'), true);
    var varIdQuery = '';
    
    var defaultQuery =', |varId|_nm, |varId|_position, |varId|_result, coalesce(|varId|_data_val, 0) as |varId|_data_val'
    
    for(var i = 0; i < chartParamJsn[j-1].var_arr.length; i++){
        var varid = chartParamJsn[j-1].var_arr[i];
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
            
            var _dom = document.getElementById('err_chart' + j);
            var c = echarts.getInstanceByDom(_dom);
            if (c) c.dispose();
            
            var l = data.data.list;
            drawChart(j, l);
            
        },
        errHandle : true,
        errFn: true,
        compltFn : function() {
            if(j+1 <= chartParamJsn.length){
                callChartAjax(j+1);
            }else {
                kendo.ui.progress($('body'), false);
            }
        },
    }); 
    
}


function drawChart(_i, _l){
	
            var l = _l;
            
//          console.log(l);
            
            if(l.length > 0){
                    // data가 있을때만 그린다.
                    
                    var _xAxis = []; // x축 시간 데이터
                    var _series = []; // 전체 데이터 취합용
                    var _series0 = []; // Series Object
                    var _series1 = []; // Series Object
                    var _series2 = []; // Series Object
                    var _series3 = []; // Series Object
                    var _series_lsl = []; // 상한 
    	            var _series_usl = []; // 하한
    	          	//lsl과 usl 값 저장
    				var lsl_arr = []; //규격 하한
    				var usl_arr = []; //규격 상한
                    
    				
                    if(chartParamJsn[_i-1].var_arr.length >= 1 ){
                        lsl_arr.push($(".ctq_list.lsl."+chartParamJsn[_i-1].var_arr[0]).html());
                        usl_arr.push($(".ctq_list.usl."+chartParamJsn[_i-1].var_arr[0]).html());
                     
                    }
                    if(chartParamJsn[_i-1].var_arr.length >= 2 ){
                        lsl_arr.push($(".ctq_list.lsl."+chartParamJsn[_i-1].var_arr[1]).html());
                        usl_arr.push($(".ctq_list.usl."+chartParamJsn[_i-1].var_arr[1]).html());
                        
                    }
                    if(chartParamJsn[_i-1].var_arr.length >= 3 ){
                        lsl_arr.push($(".ctq_list.lsl."+chartParamJsn[_i-1].var_arr[2]).html());
                        usl_arr.push($(".ctq_list.usl."+chartParamJsn[_i-1].var_arr[2]).html());
                        
                    }
                    if(chartParamJsn[_i-1].var_arr.length >= 4 ){
                        lsl_arr.push($(".ctq_list.lsl."+chartParamJsn[_i-1].var_arr[3]).html());
                        usl_arr.push($(".ctq_list.usl."+chartParamJsn[_i-1].var_arr[3]).html());
                        
                    }
                    
                    var min = lsl_arr.reduce(function(a, b) {
                        return Math.min(a, b);
                    });
                    var max = usl_arr.reduce(function(a, b) {
                        return Math.max(a, b);
                    });
                    
                    var tmp =[];
                        
                    //차트의 타입을 actual 과 normalized로 구분하여 그림
                    //normalized일 경우 실제 측정값을 (측정값 – 기준값)으로 하여 계산
                    var chart_type = $('#chart_type').val() == 'actual' ?  'actual' : 'normalized';

                    var legend_data = chartParamJsn[_i-1].var_arr;
                   
                    
                    if(chart_type == 'actual'){
                        $.each(l, function(idx, item){
                            
                            if(chartParamJsn[_i-1].var_arr.length >= 1 ){
                                _xAxis.push(item.data_tm);
                                _series_lsl.push(max+1);
    							_series_usl.push(min-1);
                                
                                var tm_val1 = eval('"'+chartParamJsn[_i-1].var_arr[0]+'"').toLowerCase();
                                _series0.push([item.data_tm, eval("item."+tm_val1+"_data_val")]);
                                
                            }
                            if(chartParamJsn[_i-1].var_arr.length >= 2 ){
                                var tm_val2 = eval('"'+chartParamJsn[_i-1].var_arr[1]+'"').toLowerCase();
                                _series1.push([item.data_tm, eval("item."+tm_val2+"_data_val")]);
                                
                            }
                            if(chartParamJsn[_i-1].var_arr.length >= 3 ){
                                var tm_val3 = eval('"'+chartParamJsn[_i-1].var_arr[2]+'"').toLowerCase();
                                _series2.push([item.data_tm, eval("item."+tm_val3+"_data_val")]);
                                
                            }
                            if(chartParamJsn[_i-1].var_arr.length >= 4 ){
                                var tm_val4 = eval('"'+chartParamJsn[_i-1].var_arr[3]+'"').toLowerCase();
                                _series3.push([item.data_tm, eval("item."+tm_val4+"_data_val")]);
                              
                            }
                            
                        })
                        
                        
                        for(var i = 0; i < chartParamJsn[_i-1].var_arr.length; i++){
                            _series.push({
                                type      : 'line',
                                name      : chartParamJsn[_i-1].var_arr[i],
                                data      : eval("_series" + i), 
                                //마크라인 lsl, usl 
                                //여러 개일 경우 usl 중 최대값+1, lsl중 최대값-1
                                markLine: {
                                    data: [{
                                        yAxis: min -1,
                                    },{
                                        yAxis: max +1,
                                    }]
                                }
                            });
                        }
                        
                      	//마크라인 lsl, usl 
    					//여러 개일 경우 usl 중 최대값+1, lsl중 최대값-1
    					_series.push({
    						type      : 'line',
    						name      : 'LSL',
    						data      : _series_lsl, 
    					});
    					_series.push({
    						type      : 'line',
    						name      : 'USL',
    						data      : _series_usl, 
    					});
    					
    					//범례에 lsl, usl 추가
    					legend_data.push('LSL');
    					legend_data.push('USL');
                        
                    }else{
//                      console.log('normalized');
                        //normalized일 경우 실제 측정값을 (측정값 – 기준값)으로 하여 계산
                        //기준값을 target 이라 가정하여 계산함
                        
                        $.each(l, function(idx, item){
                            
                            if(chartParamJsn[_i-1].var_arr.length >= 1 ){
                                _xAxis.push(item.data_tm);
//                              console.log( $(".ctq_list.target."+chartParamJsn[_i-1].var_arr[0]).html());
                                var tm_val1 = eval('"'+chartParamJsn[_i-1].var_arr[0]+'"').toLowerCase();
                                _series0.push([item.data_tm, eval("item."+tm_val1+"_data_val") - $(".ctq_list.target."+chartParamJsn[_i-1].var_arr[0]).html()]);
                                
                            }
                            if(chartParamJsn[_i-1].var_arr.length >= 2 ){
                                var tm_val2 = eval('"'+chartParamJsn[_i-1].var_arr[1]+'"').toLowerCase();
                                _series1.push([item.data_tm, eval("item."+tm_val2+"_data_val") - $(".ctq_list.target."+chartParamJsn[_i-1].var_arr[1]).html()]);
                                
                            }
                            if(chartParamJsn[_i-1].var_arr.length >= 3 ){
                                var tm_val3 = eval('"'+chartParamJsn[_i-1].var_arr[2]+'"').toLowerCase();
                                _series2.push([item.data_tm, eval("item."+tm_val3+"_data_val") - $(".ctq_list.target."+chartParamJsn[_i-1].var_arr[2]).html()]);
                                
                            }
                            if(chartParamJsn[_i-1].var_arr.length >= 4 ){
                                var tm_val4 = eval('"'+chartParamJsn[_i-1].var_arr[3]+'"').toLowerCase();
                                _series3.push([item.data_tm, eval("item."+tm_val4+"_data_val") - $(".ctq_list.target."+chartParamJsn[_i-1].var_arr[3]).html()]);
                                
                            }
                            
                        })
                        
                        
                        for(var i = 0; i < chartParamJsn[_i-1].var_arr.length; i++){
                            _series.push({
                                type      : 'line',
                                name      : chartParamJsn[_i-1].var_arr[i],
                                data      : eval("_series" + i), 
                            });
                        }
                    }
                    
                    // 차트 옵션
                    var customOption = {
                        title: {
                            text: chartParamJsn[_i-1].title,
                        },
                        legend: {
                           data: legend_data,
                        },
                        xAxis: {
                           data: _xAxis,
                        },
                        series: _series,
                    };
                    
                    // 차트 옵션 설정
                    customOption = $.extend(true, {}, comOpt, customOption);
                    
                    var _dom = document.getElementById('err_chart' + _i);
                    var c = echarts.getInstanceByDom(_dom);
                    if(c != null){
                        c.dispose();
                        c = null;
                    }
                    
                    var chart = echarts.init(_dom, 'dark');
                    
                    chart.setOption(customOption);
                    
                    //차트 클릭 이벤트
                    chart.on('click', function (params) {
                        if(params.componentType == "series") {
//                          	console.log(params);
                            
                            var clickTime = params.name;
                            
                            var seriesNm = params.seriesName + '_position';
//                          var seriesNm = 'A1U';
                            
                            var sdate = clickTime.substr(0,10).replaceAll('-','');
                            var stime = clickTime.substr(11).replaceAll(':','');
                            
                            //var folder_nm = visionUpDown[seriesNm];
                            
                            ClPopup.fnOnClickModalOpen('/pmng/visionImg.do?sdate=' + sdate + '&stime=' + stime+ '&folder_nm=' + seriesNm
                                    + '&edate=' + sdate+ '&etime=' + stime, '', 1270);
                        }
                    });
            }
            
}

function fnCreateExcel(_var_arr){
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');
	
// 	console.log('fnCreateExcel called');
	
	ClAjax.fnCallAjax({
		url : '/pmng/chartCVSDownload.do',
		paramJsn : {
			sdate : sdate,
			edate : edate,
			var_arr: _var_arr,
			set_type: 'raw'
		},
		sucFn : function(data) {
			
// 			console.log('fnCreateExcel suc');
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
		},
	}); 
	
}

/**
 * 엑셀 만들기
 * type : 'raw', 'ctq'
 */
function fnCreateExcel(_id){
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');
	
	var _var_arr = [];
	
    var chart = echarts.getInstanceByDom(document.getElementById(_id));
    var opt = chart.getOption();
    var tmp_arr = opt.legend[0].data;
	
	var f = document.createElement('form');
	
	//값에 _data_val 붙임
	if(tmp_arr.length > 0){
		tmp_arr.forEach(function(i, idx){
			_var_arr.push(i.toLowerCase() + '_data_val');
		})
	}
	
	//usl, lsl  제거
	_var_arr.splice(_var_arr.indexOf("lsl_data_val"),1); 
	_var_arr.splice(_var_arr.indexOf("usl_data_val"),1); 
	
	var _data = {
		sdate : sdate,
		edate : edate,
		var_arr: _var_arr,
		set_type: 'ctq'
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
