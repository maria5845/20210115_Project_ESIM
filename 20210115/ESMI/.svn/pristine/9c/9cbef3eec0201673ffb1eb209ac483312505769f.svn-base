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
// ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: '15:59:00', change: function() { fnGetLotList()}});

// now.setMinutes(now.getMinutes()-10);
// ClKendo.fnCreateDatePicker({selector : "#sdate", value: '2020-06-21', min: null, change: function() { fnGetLotList()}}); 
// ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '15:00:00', change: function() { fnGetLotList()}});

//실제 사용될 날짜
ClKendo.fnCreateDatePicker({selector : "#edate", value: '${edate}', min: null
	, change: function() { fnGetLotList()}
});
ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: '${etime}', change: function() { fnGetLotList()}});
ClKendo.fnCreateDatePicker({selector : "#sdate", value: '${sdate}', min: null, change: function() { fnGetLotList()}}); 
ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '${stime}', change: function() { fnGetLotList()}});


<c:if test="${!empty sample_size}">
//t_cm_cd의 cat_cd ='SAMPLE_SIZE'의 값을 기준으로 설정
var sample_size_min = ${sample_size.cd_attr_1},
sample_size_max = ${sample_size.cd_attr_2};
</c:if>


chartParamJsn = [
   {
      "id":"chart1",
      "title":"A1U/A2U",
      "var_arr":[
         "A1U",
         "A2U"
      ]
   },
   {
      "id":"chart2",
      "title":"A1L/A2L",
      "var_arr":[
         "A1L",
         "A2L"
      ]
   },
   {
      "id":"chart3",
      "title":"TS_U/TS_A",
      "var_arr":[
         "TS_U",
		 "TS_A"
      ]
   },
   {
      "id":"chart4",
      "title":"A3U/A4U",
      "var_arr":[
         "A3U",
         "A4U"
      ]
   },
   {
      "id":"chart5",
      "title":"A3L/A4L",
      "var_arr":[
         "A3L",
         "A4L"
      ]
   },
   {
      "id":"chart6",
      "title":"TH_A",
      "var_arr":[
         "TH_A"
      ]
   },
   {
      "id":"chart7",
      "title":"A5U/A6U",
      "var_arr":[
         "A5U",
         "A6U"
      ]
   },
   {
      "id":"chart8",
      "title":"A5L/A6L",
      "var_arr":[
         "A5L",
         "A6L"
      ]
   },
   {
      "id":"chart9",
      "title":"TW/TW_I",
      "var_arr":[
         "TW",
         "TW_I"
      ]
   },
   {
      "id":"chart10",
      "title":"SM1/SM2",
      "var_arr":[
         "SM1",
         "SM2"
      ]
   },
   {
      "id":"chart11",
      "title":"SM3/SM4",
      "var_arr":[
         "SM3",
         "SM4"
      ]
   }
];

//라인차트 옵션
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
			show: false
		},
		tooltip:{
			trigger: 'axis',
			axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#777'
                }
            },
            position: function (pos, params, el, elRect, size) {
//                 var obj = {top: 0};
//                 obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                var obj = {};
                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                return obj;
            },
		},
		xAxis: {
	        type: 'category',
			show: false,
	    },
	    yAxis: {
	        type: 'value',
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
		dataZoom:[
			{
				show: false
			},{
				show: false
			}
		],
		grid:{
			show: true,
			backgroundColor: '#32323d',
			top: '30',
			bottom: '20',
			right: '20',
			left: '40',
			triggerEvent: true,
		},
		backgroundColor: '#32323d',
}

//박스 플롯차트 옵션
var comBoxOpt = {
		animation: false,
		backgroundColor: '#32323d',
		tooltip:{
            position: function (pos, params, el, elRect, size) {
                var obj = {};
                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                return obj;
            },
		},
		dataZoom:[
			{
				show: false
			},{
				show: false
			}
		],
		grid:{
			show: true,
			backgroundColor: '#32323d',
			top: '30',
			bottom: '20',
			right: '20',
			left: '40',
			triggerEvent: true,
		},
}
//***********************************************************************************************


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

//조회
function search(){
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '') + '000';
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '') + '999';
	
	fnGetSummary(sdate, edate);
}

/*
 * 샘플 사이즈를 기준하여 Summary 테이블 데이터 조회
 */
function fnGetSummary(_sdate, _edate){
	var sample_size = $('#sample_size').val();
	
	if("" == sample_size || sample_size == null || sample_size == undefined){
		alert('Please input the Sample Size.');
		return;
	}
	
	// t_cm_cd의 cat_cd ='SAMPLE_SIZE'의 값을 기준으로 설정
	if(sample_size < sample_size_min || sample_size > sample_size_max){
		alert('Please input the Sample Size between '+sample_size_min+' and '+sample_size_max+' again.');
		return;
	}
	
	
	kendo.ui.progress($('body'), true);
	ClAjax.fnCallAjax({
		url: "/pmng/errAnalysisSummaryAjax.do",
		paramJsn : {
			sdate : _sdate,
			edate : _edate,
			lot_id : $('#lot_id').val(),
			sample_size : $('#sample_size').val(),
		},
		sucFn: function(data){
			//total 값 
			var tot = data.data.tot_list;
			
			$('.sval.tot_input_cnt').html(tot[0].tot_input_cnt);
			$('.sval.tot_ng_cnt').html(tot[0].tot_ng_cnt);
			$('.sval.ng_rate').html(tot[0].ng_rate);
			
			//테이블 값
			var l = data.data.list;
			
			fnMakeSumTable(l);			
			
		},
		errHandle: true,
		compltFn: function(data){
// 			fnGetChartJsn(); //차트 정보 
			kendo.ui.progress($('body'), false);
		}
	});
	
}

/*
 * 오른쪽 하단에 Summary 테이블 생성 후 append
 */
function fnMakeSumTable(_data){
	var html_tbl;
	
	$('.summary_tbody').children().not('.no_data').remove();
	if(_data.length > 0){
		$('.summary_tbody .no_data').css('display', 'none');
		
		$.each(_data, function(idx, item) {
			//NG RATE 2% 에 가까울수록 붉은 배경색
			var ng_color = null;
			if(item.ng_rate > 2.0){
				ng_color = 'red !important';
			}else{
				ng_color = 'rgba(255, 0, 0, '+item.ng_rate+') !important;';
			}
			
			//non oper time 1시간이면 전체 색칠 hover 시간 데이터 보임
			var non_width = hmsToSecondsOnly(item.non_operation_time);
			if(non_width > 3600){
				non_width = '100';
			}else{
				non_width = non_width/3600 * 100;
			}
			
			html_tbl += "<tr>"
					+'<td>'+item.rn+'</td>'
					+'<td style="background-color:'+ng_color+'">'+fnCheckUndefined(item.ng_rate)+'</td>'
					+'<td>'+fnCheckUndefined(item.alarm_cnt)+'</td>'
					+'<td>'+fnCheckUndefined(item.mate_repl_cnt)+'</td>'
					+'<td>'
						+'<div class="tooltip" style="width: 100%;position: relative;">'
							+'<div style="width:'+non_width+'%;background-color: #C40452;height: 20px;">'
								  +'<span class="tooltiptext">'+item.non_operation_time+'</span>'
							+'</div>'
						+'</div>'
					+'</td>'
					+'<td class="start_dt" style="display:none;">'+item.start_dt+'</td>'
					+'<td class="end_dt" style="display:none;">'+item.end_dt+'</td>'
				+'</tr>'
		});
		$('.summary_tbody').append(html_tbl);
		
	}else{
		$('.summary_tbody .no_data').css('display', '');
	}
	
	$(".summary_tbl tbody tr").click(function(){ 	
		var selected = $(this).children().hasClass("highlight");
	    $(".summary_tbl tr td").removeClass("highlight");
	    if(!selected){
            $(this).children().addClass("highlight");
	    }
	    
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
// 		20200621150000000
		
		var stime = td.eq(5).text().substr(0,14);
		var etime = td.eq(6).text().substr(0,14);
		
		var chart_type = $('#chart_type').val();
		
		callChartAjax(stime, etime, chart_type);
		fnGetAlarmList(stime, etime);
	});
}






/**
 * 차트 그리기
 */
function callChartAjax(_sdate, _edate, _type){
	
	for(var i = 1; i <= chartParamJsn.length; i++){
		var chart = null;
		//각 차트별로 Ajax 호출
		drawChart(i, _sdate, _edate, _type);
	}
}

function drawChart(_i, _sdate, _edate, _type){
	
	kendo.ui.progress($('body'), true);
	
// 	sdate: 20200621
// 	edate: 20200621
// 	stime: 150000
// 	etime: 150500
	
	//차트 타입 (total, rightLeft, box)
	var type = _type;
	
	var varIdQuery = '';
    
    var defaultQuery =', |varId|_nm, |varId|_position, |varId|_result, coalesce(|varId|_data_val, 0) as |varId|_data_val'
    
    for(var i = 0; i < chartParamJsn[_i-1].var_arr.length; i++){
        var varid = chartParamJsn[_i-1].var_arr[i];
        varIdQuery += defaultQuery.replaceAll('|varId|', varid);
    }
	
	ClAjax.fnCallAjax({
		url : '/pmng/getCtqRawList.do',
		paramJsn : {
			sdate: _sdate.substr(0,8),
			edate: _edate.substr(0,8),
			stime: _sdate.substr(8,8),
			etime: _edate.substr(8,8),
			lot_id : $('#lot_id').val(),
			varIdQuery : varIdQuery
		},
		sucFn : function(data) {
			var l = data.data.list;
			
			// data가 있을때만 그린다.
			if(l.length > 0){
				var _xAxis = []; // x축 시간 데이터
	            var _series = []; // 전체 데이터 취합용
	            var _series0 = []; // Series Object
	            var _series1 = []; // Series Object
	            var _series2 = []; // Series Object
	            var _series3 = []; // Series Object
	            var _series4 = []; // Series Object
	            var _series5 = []; // Series Object
	            var _series6 = []; // Series Object
	            var _series7 = []; // Series Object
				
	            //차트 데이터 Start ---------------------------------------------------- 
	            //차트 타입 (total, rightLeft, box)
				if('total' == type || null == type){
					var tmp =[];
	            	
					$.each(l, function(idx, item){
						if(chartParamJsn[_i-1].var_arr.length >= 1 ){
							_xAxis.push(item.data_tm);
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
						});
		            }
				}else if('rightLeft' == type){
					var tmp =[];
	            	
					$.each(l, function(idx, item){
						if(chartParamJsn[_i-1].var_arr.length >= 1 ){
							_xAxis.push(item.data_tm);
							var tm_val1 = eval('"'+chartParamJsn[_i-1].var_arr[0]+'"').toLowerCase();
							
// 							position_rf
// 							0 = Rear
// 							1 = Front
							if(item.position_rf == 0){
								_series0.push([item.data_tm, eval("item."+tm_val1+"_data_val")]);
							}else{
								_series1.push([item.data_tm, eval("item."+tm_val1+"_data_val")]);
							}
						}
						if(chartParamJsn[_i-1].var_arr.length >= 2 ){
							var tm_val2 = eval('"'+chartParamJsn[_i-1].var_arr[1]+'"').toLowerCase();
							if(item.position_rf == 0){
								_series2.push([item.data_tm, eval("item."+tm_val2+"_data_val")]);
							}else{
								_series3.push([item.data_tm, eval("item."+tm_val2+"_data_val")]);
							}
						}
						if(chartParamJsn[_i-1].var_arr.length >= 3 ){
							var tm_val3 = eval('"'+chartParamJsn[_i-1].var_arr[2]+'"').toLowerCase();
							if(item.position_rf == 0){
								_series4.push([item.data_tm, eval("item."+tm_val3+"_data_val")]);
							}else{
								_series5.push([item.data_tm, eval("item."+tm_val3+"_data_val")]);
							}
						}
						if(chartParamJsn[_i-1].var_arr.length >= 4 ){
							var tm_val4 = eval('"'+chartParamJsn[_i-1].var_arr[3]+'"').toLowerCase();
							if(item.position_rf == 0){
								_series6.push([item.data_tm, eval("item."+tm_val4+"_data_val")]);
							}else{
								_series7.push([item.data_tm, eval("item."+tm_val4+"_data_val")]);
							}
						}
					})
					
					for(var i = 0; i < chartParamJsn[_i-1].var_arr.length * 2; i++){
// 						0 ~ 7 시리즈
						var tmpSerise = i + i;
						_series.push({
							type      : 'line',
							name      : chartParamJsn[_i-1].var_arr[i]+' Rear',
							data      : eval("_series" + tmpSerise), 
						});
						_series.push({
							type      : 'line',
							name      : chartParamJsn[_i-1].var_arr[i]+' Front',
							data      : eval("_series" +(tmpSerise + 1)), 
						});
						
		            }
				}else if('box' == type ){
					
					$.each(l, function(idx, item){
						if(chartParamJsn[_i-1].var_arr.length >= 1 ){
							_xAxis.push(item.data_tm);
							var tm_val1 = eval('"'+chartParamJsn[_i-1].var_arr[0]+'"').toLowerCase();
							
// 							position_rf
// 							0 = Rear
// 							1 = Front
							if(item.position_rf == 0){
								_series0.push( eval("item."+tm_val1+"_data_val"));
							}else{
								_series1.push( eval("item."+tm_val1+"_data_val"));
							}
						}
						if(chartParamJsn[_i-1].var_arr.length >= 2 ){
							var tm_val2 = eval('"'+chartParamJsn[_i-1].var_arr[1]+'"').toLowerCase();
							if(item.position_rf == 0){
								_series2.push( eval("item."+tm_val2+"_data_val"));
							}else{
								_series3.push( eval("item."+tm_val2+"_data_val"));
							}
						}
						if(chartParamJsn[_i-1].var_arr.length >= 3 ){
							var tm_val3 = eval('"'+chartParamJsn[_i-1].var_arr[2]+'"').toLowerCase();
							if(item.position_rf == 0){
								_series4.push( eval("item."+tm_val3+"_data_val"));
							}else{
								_series5.push( eval("item."+tm_val3+"_data_val"));
							}
						}
						if(chartParamJsn[_i-1].var_arr.length >= 4 ){
							var tm_val4 = eval('"'+chartParamJsn[_i-1].var_arr[3]+'"').toLowerCase();
							if(item.position_rf == 0){
								_series6.push( eval("item."+tm_val4+"_data_val"));
							}else{
								_series7.push( eval("item."+tm_val4+"_data_val"));
							}
						}
					})
						
					var tmp_arr = [];
					var xAxisLabel = [];
					for(var i = 0; i < chartParamJsn[_i-1].var_arr.length * 2; i++){
						tmp_arr.push( eval("_series" + i));
		            }
					
					for(var i = 0; i < chartParamJsn[_i-1].var_arr.length; i++){
						xAxisLabel.push(chartParamJsn[_i-1].var_arr[i]+' Rear');
						xAxisLabel.push(chartParamJsn[_i-1].var_arr[i]+' Front');
		            }
					
					//echarts를 사용해 boxplot 데이터 생성 
					var data = echarts.dataTool.prepareBoxplotData(tmp_arr);
					
					_series.push({
			            name: 'boxplot',
			            type: 'boxplot',
			            data: data.boxData,
			            tooltip: {
			                formatter: function (param) {
			                    return [
			                        'Experiment ' + param.name + '',
			                        'upper: ' + param.data[5],
			                        'Q3: ' + param.data[4],
			                        'median: ' + param.data[3],
			                        'Q1: ' + param.data[2],
			                        'lower: ' + param.data[1]
			                    ].join('<br/>');
			                }
			            }
			        },
			        {
			            name: 'outlier',
			            type: 'scatter',
			            data: data.outliers
			        });
					
	            }
				//차트 데이터 End ----------------------------------------------------
				
	            
            	// 차트 옵션 Start ----------------------------------------------------
	            if('box' == type ){
					var customOption = {
						tooltip: {
					        trigger: 'item',
					        axisPointer: {
					            type: 'shadow'
					        }
					    },
						title: {
							text: chartParamJsn[_i-1].title,
						},
						legend: {
						   data: chartParamJsn[_i-1].var_arr,
						},
						xAxis: {
						   data: xAxisLabel,
						   show: false,
						},
						series: _series,
					};
	            }else{
					var customOption = {
						title: {
							text: chartParamJsn[_i-1].title,
						},
						legend: {
						   data: chartParamJsn[_i-1].var_arr,
						},
						xAxis: {
						   data: _xAxis,
						},
						series: _series,
					};
	            }
				// 차트 옵션 End ----------------------------------------------------
				
				
	            // 차트 옵션 설정
	            customOption = $.extend(true, {}, comOpt, customOption);
	            
	            var _dom = document.getElementById('err_chart' + _i);
	            var c = echarts.getInstanceByDom(_dom);
				if(c != null){
					c.dispose();
					c = null;
				}
	            
				chart = echarts.init(_dom, 'dark');
				
				chart.setOption(customOption);
					
			}
			
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			kendo.ui.progress($('body'), false);
		},
	});
}

/*
 * ng_cnt 값 구함
 * 왼쪽의 테이블 데이터 조회 (Material Supply Record, Trouble Record)
 */
function fnGetAlarmList(_sdate, _edate){
	kendo.ui.progress($('body'), true);
	ClAjax.fnCallAjax({
		url : '/pmng/errAnalysisAlarmAjax.do',
		paramJsn : {
			sdate : _sdate,
			edate : _edate,
			lot_id : $('#lot_id').val()
		},
		sucFn : function(data) {
			
			//ng_cnt
			var ng_cnt = data.data.ng_cnt;
			$('#err_chart12 .ng_cnt_title').html('NG');
			$('#err_chart12 .ng_cnt').html(ng_cnt[0].count);
			
			//Material Supply Record
			var Mate_list = data.data.Mate_list;
			fnMaterialTable(_sdate, _edate, Mate_list);
			
			//{"result":true,"msg":null,"sysmsg":null,"noauth":false,"location":null,"data":{"trouble_list":[{"start_dt":1592719210000,"trouble_cd":"101","end_dt":1592725210000,"diff_dt":{"type":"interval","value":"0 years 0 mons 0 days 1 hours 40 mins 0.00 secs","years":0,"months":0,"days":0,"hours":1,"minutes":40,"seconds":0.0},"loss_detail_cd":"EL001_01_000휴일부동_/_휴무일","data_val":1.0,"var_id":"Holiday","var_gr":"User Stop"}],"Mate_list":[],"ng_cnt":[{"count":0}]},"errType":null,"errLv":null}
			//Trouble Record
			var trouble_list = data.data.trouble_list;
			fnTroubleTable(_sdate, _edate, trouble_list);
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			kendo.ui.progress($('body'), false);
		},
	});
}






//Material 테이블 생성 후 append
function fnMaterialTable(_sdate, _edate, _data){
	var html_tbl;
// 	data_val: 1
// 	end_dt: "20200621151010"
// 	loss_detail_cd: "EL017_04_002PET_교체"
// 	start_dt: "20200621150010"
// 	trouble_cd: "000514"
// 	var_gr: "Material Replacement"
// 	var_id: "514_U-Pet_Material_Change"

	//날짜 형식 변경
	var _sdateChar = _sdate.slice(0, 4) + '-' + _sdate.slice(4, 6) + '-' + _sdate.slice(6,8) 
			+' '+_sdate.slice(8,10)+':'+_sdate.slice(10,12)+':'+_sdate.slice(12,14);
	var _edateChar = _edate.slice(0, 4) + '-' + _edate.slice(4, 6) + '-' + _edate.slice(6,8) 
			+' '+_edate.slice(8,10)+':'+_edate.slice(10,12)+':'+_edate.slice(12,14);

	$('.mate_tbody').children().not('.no_data').remove();
	if(_data.length > 0){
		$('.mate_tbody .no_data').css('display', 'none');
		$.each(_data, function(idx, item) {
			html_tbl += "<tr>"
					+'<td>'+_sdateChar+'</td>'
					+'<td>'+_edateChar+'</td>'
					+'<td>'+fnCheckUndefined(item.start_dt)+'</td>'
					+'<td>'+fnCheckUndefined(item.end_dt)+'</td>'
					+'<td>'+fnCheckUndefined(item.input_lot_id)+'</td>'
					+'<td>'+fnCheckUndefined(item.trouble_cd)+'</td>'
					+'<td>'+fnCheckUndefined(item.curr_lot_id)+'</td>'
				+ '</tr>'
		});
		
		$('.mate_tbody').append(html_tbl);
	}else{
		$('.mate_tbody .no_data').css('display', '');
	}
	
}

//trouble 테이블 생성 후 append
function fnTroubleTable(_sdate, _edate, _data){
	var html_tbl;
	
	// data_val: 1
	// diff_dt: {type: "interval", value: "0 years 0 mons 0 days 1 hours 40 mins 0.00 secs", years: 0, months: 0, days: 0, …}
	// end_dt: 1592725210000
	// loss_detail_cd: "EL001_01_000휴일부동_/_휴무일"
	// start_dt: 1592719210000
	// trouble_cd: "101"
	// var_gr: "User Stop"
	// var_id: "Holiday"
	
	//날짜 형식 변경
	var _sdateChar = _sdate.slice(0, 4) + '-' + _sdate.slice(4, 6) + '-' + _sdate.slice(6,8) 
			+' '+_sdate.slice(8,10)+':'+_sdate.slice(10,12)+':'+_sdate.slice(12,14);
	var _edateChar = _edate.slice(0, 4) + '-' + _edate.slice(4, 6) + '-' + _edate.slice(6,8) 
			+' '+_edate.slice(8,10)+':'+_edate.slice(10,12)+':'+_edate.slice(12,14);
			
	$('.trouble_tbody').children().not('.no_data').remove();

	if(_data.length > 0){
		$('.trouble_tbody .no_data').css('display', 'none');
		
		$.each(_data, function(idx, item) {
			html_tbl += "<tr>"
					+'<td>'+_sdateChar+'</td>'
					+'<td>'+_edateChar+'</td>'
					+'<td>'+fnCheckUndefined(item.start_dt)+'</td>'
					+'<td>'+fnCheckUndefined(item.end_dt)+'</td>'
					+'<td>'+fnCheckUndefined(item.trouble_cd)+'</td>'
					+'<td>'+fnCheckUndefined(item.loss_detail_cd)+'</td>'
					+'<td>'+fnCheckUndefined(item.diff_dt)+'</td>'
				+ '</tr>'
		});
	
		$('.trouble_tbody').append(html_tbl);
	}else{
		$('.trouble_tbody .no_data').css('display', '');
	}
	
	
}

/*
 * Undefined 값을 '-'으로 전환
 */
function fnCheckUndefined(_data){
	if(_data == undefined){
		return '-'
	}
	return _data;
}

/*
 * 시간을 초로 변환함
 */
function hmsToSecondsOnly(str) {
    var p = str.split(':'),
        s = 0, m = 1;

    while (p.length > 0) {
        s += m * parseInt(p.pop(), 10);
        m *= 60;
    }

    return s;
}
</script>
