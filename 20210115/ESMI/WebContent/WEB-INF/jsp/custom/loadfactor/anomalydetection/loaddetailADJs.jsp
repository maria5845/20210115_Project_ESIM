<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script>
var plusIconPath = "path://m408 184h-136c-4.417969 0-8-3.582031-8-8v-136c0-22.089844-17.910156-40-40-40s-40 17.910156-40 40v136c0 4.417969-3.582031 8-8 8h-136c-22.089844 0-40 17.910156-40 40s17.910156 40 40 40h136c4.417969 0 8 3.582031 8 8v136c0 22.089844 17.910156 40 40 40s40-17.910156 40-40v-136c0-4.417969 3.582031-8 8-8h136c22.089844 0 40-17.910156 40-40s-17.910156-40-40-40zm0 0";
var idx = "${bean.gubun}"; // java에서 넘겨받은 idx로 타이틀 생성

var var_nm = "";
var var_id = ""; //메인 차트에서 클릭한 xAxis 이름
var dvc_id = pkg4Jsn["unit"+idx].dvc_id;
var dvc_nm = pkg4Jsn["unit"+idx].name;

var yyyy = "${YYYY}";
var mmdd = "${mmdd}";

//메인 차트 기준 날짜
var baseDate = new Date();
var mainDate = new Date((new Date()).getFullYear(), mmdd.split('/')[0]-1, mmdd.split('/')[1]);
var subDate = new Date((new Date()).getFullYear(), mmdd.split('/')[0]-1, mmdd.split('/')[1]);
var alarmDate = new Date((new Date()).getFullYear(), mmdd.split('/')[0]-1, mmdd.split('/')[1]);

// 화면 새로고침용
var mainInterval = null;
var subInterval = null;
var realInterval = null;
var gridInterval = null;

//서브 차트 왼쪽 비교 시간
var last_cllct_dt = "";

var mainChartIns ;
var subChartIns;
var mainChartInitOpt;
var charOpts = {};

var titleStr = "Servo Motor";

$(document).ready(function() {
	if(loadfactor_type=="LOAD_FACTOR_CYLINDER"){titleStr="Cylinder";}	
	$(".main_title").text(titleStr+" Load Factor : "+ dvc_nm + " ( " + mmdd + " )");
	
// 	if(Object.keys(pkg4Jsn).length==1){
// 		$('#btn-goback').css('display','none');
// 	}
	//-- Kendo Date 설정
	ClKendo.fnCreateDatePicker({selector : "#sdate", value: mainDate, min: null}); 
	ClKendo.fnCreateDatePicker({selector : "#edate", value: mainDate, min: null});

	// 차트 조회
	fnCreateMainChart(null, initSubChart);
// 	if($('.l-footer', parent.document).find('.version_text').text() == ''){
// 		$('.l-footer', parent.document).append('<div style="float: right;width: 1px;"><p class="version_text" style="float: right;right: 5px;width: 200px;">'+CWA_VERSION+'</p></div>');
// 	}
});



/**
 * 메인 차트의 좌 / 우 클릭 시 이벤트
 */
// (좌)전날짜의 메인데이터를 조회하여 메인 차트를 출력
$(".main_chart_title .left-btn").on('click', function(){
	var dtObj = setMainDate(new Date(mainDate.setDate(mainDate.getDate()-1)));
    fnCreateMainChart(dtObj.yymmdd); 
});

// (우)다음날짜의 메인데이터를 조회하여 메인 차트를 출력
$(".main_chart_title .right-btn").on('click', function(){
	var dt = new Date(); dt.setHours(0, 0, 0, 0);
	// 다음 날짜가 오늘보다 크면 조회하지 않는다.
	var compareDate = new Date(mainDate.getFullYear(), mainDate.getMonth(), mainDate.getDate()+1);
	if( compareDate > dt){
		compareDateNotification({top: 300, left: 832});
		return;
	}
	var dtObj = setMainDate(new Date(mainDate.setDate(mainDate.getDate()+1)));
    fnCreateMainChart(dtObj.yymmdd); //0201 t_md 형식으로 보냄
});

/**
 * 서브 차트의 좌 / 우 클릭 시 이벤트
 */
//(좌)전날짜의 서브차트 조회
$(".sub_chart_title .left-btn").on('click', function(){
	// 전날짜의 메인데이터를 조회하여 메인 차트를 출력
	var dtObj = setSubDate(new Date(subDate.setDate(subDate.getDate()-1)));
    fnCreateSubLeftChart(var_id, dtObj.mmdd, null);//날짜 t_md 0102 형식
});

//(우)다음날짜의 서브차트 조회
$(".sub_chart_title .right-btn").on('click', function(){
	var dt = new Date(); dt.setHours(0, 0, 0, 0);
	// 다음 날짜가 오늘보다 크면 조회하지 않는다.
	var compareDate = new Date(subDate.getFullYear(), subDate.getMonth(), subDate.getDate()+1);
	if( compareDate > dt ){
		compareDateNotification({top: 570, left: 445});
		return;
	}
	var dtObj = setSubDate(new Date(subDate.setDate(subDate.getDate()+1)));
    fnCreateSubLeftChart(var_id, dtObj.mmdd, null);//날짜 t_md 0102 형식
});

$(".alarm_list .left-btn").on('click', function(){
	var dtObj = setAlarmDate(new Date(alarmDate.setDate(alarmDate.getDate()-1)));
	var param = {tree_nm : tree_nm,
				 dvc_id : dvc_id,
			 	 edate : dtObj.yymmdd,
		 	 	 edate_mmdd : dtObj.mmdd};
	fnSearch(param);
});

$(".alarm_list .right-btn").on('click', function(){
	var dt = new Date(); dt.setHours(0, 0, 0, 0);
	// 다음 날짜가 오늘보다 크면 조회하지 않는다.
	var compareDate = new Date(alarmDate.getFullYear(), alarmDate.getMonth(), alarmDate.getDate()+1);
	if( compareDate > dt ){
		compareDateNotification({top: 650, left: 1420});
		return;
	}
	var dtObj = setAlarmDate(new Date(alarmDate.setDate(alarmDate.getDate()+1)));
	var param = {tree_nm : tree_nm,
				 dvc_id : dvc_id,
			 	 edate : dtObj.yymmdd,
		 	 	 edate_mmdd : dtObj.mmdd};
	fnSearch(param);
});

function compareDateNotification(_position){
	ClKendo.fnErrorNotification({
		msg: '오늘날짜 이후 데이터는 조회할 수 없습니다.', 
		level: 'warning', 
		opt: {
			width: 256,
			height: 42,
			position: _position
		}
	});
}

// Main Chart의 시간 설정
function setMainDate(date){
	mainDate=date;
	var dtObj = convertDate(mainDate);
	$(".main_title").text(titleStr+" Load Factor : "+ pkg4Jsn["unit"+idx].name + " ( " + dtObj.month+"/"+dtObj.day+" )");
	return dtObj;
}

//Sub Chart의 시간 설정
function setSubDate(date){
	subDate=date;
	ClKendo.fnSetDatePickerVal("#sdate", new Date(subDate));
	ClKendo.fnSetDatePickerVal("#edate", new Date(subDate));
	var dtObj = convertDate(subDate); 
	var dispNm = var_nm.length>30?var_nm.substr(0, 30)+'..':var_nm;
    $("#subTitle1").text( "Daily History : " + dispNm +" ("+dtObj.month+"/"+dtObj.day+")");
	return dtObj;
}

function setAlarmDate(date){
	alarmDate=date;
	var dtObj = convertDate(alarmDate); 
	$("#subTitle2").text( "Alarm List : ("+dtObj.month+"/"+dtObj.day+")");
	return dtObj;
}

// convert Date -> yyyy, mm, dd
function convertDate(date){
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	month = month < 10 ? '0' + month : '' + month;
	day   = day   < 10 ? '0' + day   : '' + day;
	return {year:year, 
			month:month, 
			day:day,
			yymmdd:year+month+day,
			mmdd:month+day};
}

//일자 변경여부 확인
function checkDateChange(_date){
	var dt = new Date(); dt.setHours(0, 0, 0, 0);
	// 일자 변경	
	if(baseDate < dt){
		baseDate = new Date();
		return true;
	}
	return false;
}

function dateChangeProcess(_date){
	var baseDtObj = convertDate(baseDate);		
	setMainDate(baseDate);
	if(subLeftDateRangeParam==null){
		setSubDate(baseDate);
	    fnCreateSubLeftChart(var_id, baseDtObj.mmdd, null);
	}
	var dtObj = setAlarmDate(baseDate);
	var param = {tree_nm : tree_nm,
				 dvc_id : dvc_id,
			 	 edate : dtObj.yymmdd,
		 	 	 edate_mmdd : dtObj.mmdd};
	fnSearch(param);
	_date=baseDtObj.yymmdd;
	return _date;
}

// Date parameter와 현재 선택된 날짜 비교
function checkDateParam(dateParam, dpDateParam){
	var dtObj = convertDate(dpDateParam);
	var dpDate = dtObj.yymmdd;
	if(dpDate != dateParam){return false;}
	return true;
}

//Date parameter와 현재 선택된 날짜 비교
function checkDateRangeParam(sdate, edate, dpDateParam){
	// 범위 값으로 지정된 경우
	if(sdate!=null && edate!=null && sdate!=edate){
		if(subLeftDateRangeParam!=sdate+edate){return false;}
		return true; 
	}
	// 범위로 지정되지 않은 경우
	else{
		var dtObj = convertDate(dpDateParam);
		var dpDate = dtObj.mmdd;
		if(dpDate != sdate){return false;}
		return true;
	}
} 

/**
 * 메인 차트 데이터 조회
 */
 function fnCreateMainChart(_date, callback){
	if(_date == null){_date = convertDate(new Date()).yymmdd;}
    // Interval 초기화 후 다시 실행
    clearTimeout(mainInterval);
    kendo.ui.progress($('body'), true);
 	// 일자 변경시의 처리
	if(checkDateChange(_date)){
		_date = dateChangeProcess(_date);
	}
	var lifList;
	ClAjax.fnCallAjax({ 
		url : '/custom/loaddetailmainAjax.do',
		paramJsn : {
			loadfactor_type : loadfactor_type,
			tree_nm : tree_nm,
			edate: _date,
			dvc_id : dvc_id,
			arr : new Array(),
		},
		sucFn : function(data) {
			// ajax응답 대기시간 동안 click event가 발생한 경우 
			// 해당 callback을 처리하지 않고 return
			if(!checkDateParam(_date, mainDate)){ return; }
			if(!(data.data && data.data.list
				         && data.data.list.length>0)){
				charOpts['main'] && charOpts['main'][0].clear();
			}else{
				var l = data.data.list
				lifList = data.data.list;
				var xAxisArrList = new Array();
				var seriesArr = new Array();
// 				var dvcArr = ClArray._groupBy(l, ["xunit"]);
// 				var dateArr = ClArray._groupBy(l, ["data_tm"]);
				var grpData = ClArray._groupBy(l, ['var_gr', 'data_tm']);
				var xAxisGrpData = ClArray._groupBy(l, ['var_gr', 'var_id']);
				var xAxisLength = Object.keys(xAxisGrpData.LOAD_FACTOR).length;
				var legendData = Object.keys(grpData.LOAD_FACTOR);
				$.each(xAxisGrpData, function(nm, e){
					var isLine=(nm=='LOAD_FACTOR_EC');
					var xAxisArr = Array.apply('', Array(isLine?xAxisLength*5:xAxisLength)).map(function(){return ''});
					var idx=0;
					$.each(xAxisGrpData[nm], function(e){
						if(e!=''){
							if(isLine){xAxisArr.fill(e, idx, idx+=5);}
							else{xAxisArr[idx++]=e;}
						}						
					});
					xAxisArrList.push(xAxisArr);
				})
				
				itemStyle = {barBorderColor : 'black', barBorderWidth:0.4};
				itemStyle2 = {opacity : 0.65};
			    //load
				var seriesArrTmp = new Array();
				var diffArr=null;
				$.each(grpData.LOAD_FACTOR, function(nm, item){
					var tmpBar = new Array();
					diffArr=item;
					item.forEach(function(item){
						tmpBar.push(item.data_val);
					});
					seriesArrTmp.push({name: nm, type: "bar", data: tmpBar, yAxisIndex: 1, xAxisIndex:0, z:1, itemStyle:itemStyle});
				});
				setlfStyle2(seriesArrTmp[4], diffArr);
				seriesArr = seriesArr.concat(seriesArrTmp);
				
				//peak load
				seriesArrTmp = new Array();
				diffArr=null;
				$.each(grpData.LOAD_FACTOR_PEAK, function(nm, item){
					var tmpBar = new Array();
					diffArr=item;
					item.forEach(function(item){
						tmpBar.push(item.data_val);
					});
					seriesArrTmp.push({name: nm, type: "bar",  data: tmpBar, yAxisIndex: 1, xAxisIndex:1, z:0, itemStyle:itemStyle2});
				});
				setlfStyle2(seriesArrTmp[4], diffArr);
				seriesArr = seriesArr.concat(seriesArrTmp);
				
				//전류값
				var tmpLine;
				var diffVal=null;
				var dummyLine = new Array();
				seriesArrTmp = new Array();
				diffArr=null;
				$.each(grpData.LOAD_FACTOR_EC, function(nm, item){
					tmpLine = new Array();
					//tooltip line
					item.forEach(function(item){
						for(i=0; i<5; i++){
							tmpLine.push(item.data_val);							
						}
					});
					
					diffArr = new Array();
					item.forEach(function(item){
						for(i=0; i<5; i++){
							diffArr.push(item);							
						}
					});
					
					seriesArrTmp.push({
				 		type: 'line', 
				 		name: nm+' ', 
				 		xAxisIndex:2,
				 		yAxisIndex:0,
				 		symbol: 'none',
				 		markLine:{
				 			data: [{name: 'load', yAxis: 0}],
				 			label: {show: false},
				 			symbol: 'none',
				 			lineStyle:{
				 				type: 'dashed',
				 				color : 'green',
//	 			 				color : '#FF3333',
				 				width : 1
				 			}
				 		},
				 		itemStyle : { color:'green'},
			            lineStyle : {opacity:0},
				 		data: tmpLine,
					})
				});
				
				/** 	*/
				//data(dummy) line
				var length = Object.keys(grpData.LOAD_FACTOR_EC[Object.keys(grpData.LOAD_FACTOR_EC)[0]]).length;
				for(i=0; i<length; i++){
					$.each(grpData.LOAD_FACTOR_EC, function(nm, item){
// 						if(item[i].data_val>100){
// 							dummyLine.push({ value : item[i].data_val,
// 							   				 itemStyle : {color : 'red', barBorderColor : 'red'}});
// 						}else{
// 							dummyLine.push(item[i].data_val);
// 						}
						dummyLine.push(item[i].data_val);
					})
				}
// 				setlfStyle2(seriesArrTmp[4], 99.5);
				setlfStyle3(seriesArrTmp[4], dummyLine, diffArr);
				seriesArr = seriesArr.concat(seriesArrTmp);
				
				seriesArr.push({
			 		type: 'line', 
			 		xAxisIndex:2,
			 		yAxisIndex: 0,
// 			 		symbol: 'none',
			 		symbolSize: 3.5,
			 		itemStyle : { color:'green'},
// 			 		lineStyle : {opacity:0},
			 		lineStyle : { color : 'green', width:1, opacity:0.5},
// 			 		lineStyle : { color : '#333333'},
			 		tooltip : { show : false,},
			 		data: dummyLine,
				})
				
				
				
				var chartOpt = {
					legend: {show: true,
							 data : legendData},
					grid: {top:30,right:60,bottom:120,left:60},
					tooltip:{
								trigger: 'axis',
					          	axisPointer: {
					          		type: 'shadow'
					          	},
					          	position: function (pos, params, el, elRect, size) {
					                var obj = {left: pos[0]+10,
					                           top : pos[1]+10};    
					                return obj;
					            },
					         },
					         
					         
					xAxis: [
						{
							type: 'category',
							data: xAxisArrList[0],
							splitLine :{
								show: true,
								lineStyle: {
									color: [ '#ffffff'],
									type: 'dashed',
								}
							},
					        axisTick:{
					        	interval:0,
					        },
							axisLabel: {
								showMinLabel: true,
								showMaxLabel: true,
								interval: 0,
								rotate: 60,
								fontSize: 9,
								formatter: function (value, index) {
								    var a = value.split('|');
								    return a[0];
								}
							},
							axisPointer:{
								label:{
									show:false,
								}
							},
							triggerEvent: true,
						},
						{
				            type: 'category',
				            axisTick: {show: false},
				            axisLine: {onZero: false},
				            splitLine: {show: false},
				            axisLabel: {show: false},
				            data: xAxisArrList[2],
				        },
				        {
				            type: 'category',
				            axisTick: {show: false},
				            axisLine: {onZero: false},
				            splitLine: {show: false},
				            axisLabel: {show: false},
				            data: xAxisArrList[1],
				        }
					],
					yAxis: [
				        {
				            type: 'value',
// 				            name: '(증감량)',
// 				            max: function(value){return checkCylinderType(dvc_id)?Math.ceil(value.max):50}, 
// 				            min: function(value){return checkCylinderType(dvc_id)?Math.ceil(value.max)*(-1):-75},
 							minInterval: checkCylinderType(dvc_id)?1:25,
// 					        max: function(item){
// 							    var diff = item.max-item.min;
// 							    if(diff == 0) {diff = 1}
// 							    return (item.max + ((diff) * 0.2)).toFixed(2);
// 							},
					        max: function(item){
							    return Math.ceil(item.max + 10);
							},
 							minInterval: 25,
							nameLocation :'start',
							splitNumber: 8,
				            symbol: plusIconPath,
							symbolSize: 12,
				            axisLabel: {
// 								formatter: function (value, index) {
// 								    if(value >= -100){
// 								    	return value + (checkCylinderType(dvc_id)?'s':' %');
// 								    }
// 								},
								showMinLabel: false,
					            showMaxLabel: false,
				            },
				            splitLine :{
				            	show: false,
				            }
				        },
				        {
				            type: 'value',
				            min: 0,
				            max: function(value){return checkCylinderType(dvc_id)?Math.ceil(value.max):100},
							minInterval: checkCylinderType(dvc_id)?1:25,
				            axisLabel: {
				            	formatter: checkCylinderType(dvc_id)?'{value}s':'{value} %',
								interval: 10,
								showMinLabel: true,
								showMaxLabel: true,
				            },
				            splitLine :{
				            	show: false,
				            }
				        },
				    ],
					dataZoom: {show: false},
					series: seriesArr,
				}
				 var c = ClEcharts.fnCreateEcharts({
					selector: "#mainChart",
					type: 'line',
					opt_overwrite: chartOpt,
				});
				mainChartIns = c;
				mainChartInitOpt = chartOpt.xAxis[0].data;
				// x축 Highlight 옵션 재적용
				revertHighlightXAxisOpt();
			 	// 각 xAxis 를 눌렀을 때 이벤트로 하단 차트를 생성한다.
			 	c.on('click', function (params) {
			 		if (params.componentType === 'xAxis' && params.xAxisIndex === 0) {
			 			onActiveSubChart(params.value, null, null, xAxisGrpData.LOAD_FACTOR);
			 		} 
			 	});
			 	charOpts['main'] = [];
			 	charOpts['main'].push(c);
			}
		},
		errHandle : true,
		compltFn : function() {
			kendo.ui.progress($('body'), false);
			resizeContents();
			if(callback!=undefined){ callback(lifList); }
			if(!checkDateParam(_date, mainDate)){ return; }
			mainInterval = setTimeout(function(){
				fnCreateMainChart(_date);
			}, 350000); // 5분 = 1000 * 60 * 5 
		},
	});
}

function setlfStyle(seriesArr, chkVal){
	if(seriesArr[4]!=null){
		seriesArr[4].data.forEach(
			function(data, idx){
// 				var dataYtd = seriesArr[3].data[idx];
// 				if(data > dataYtd){
// 					seriesArr[4].data[idx] = { value : data,
// 											   itemStyle : {color : 'red', barBorderColor : 'red'} };
// 				}
				if(data > chkVal){
					seriesArr[4].data[idx] = { value : data,
											   itemStyle : {color : 'red', barBorderColor : 'red'} };
				}
			}
		);
	}
}
function setlfStyle2(seriesArrData, chkArr){
	if(seriesArrData!=null){
		seriesArrData.data.forEach(
			function(data, idx){
				if('1'==chkArr[idx].alarm_target){
					seriesArrData.data[idx] = { value : data,
										   itemStyle : {color : 'red', barBorderColor : 'red'} };
				}
			}
		);
	}
}

function setlfStyle3(seriesArrData, dummyData, chkArr){
	if(seriesArrData!=null){
		seriesArrData.data.forEach(
			function(data, idx){
				if('1'==chkArr[idx].alarm_target){
// 				if(data > chkArr[idx].data_val_diff){
					var empStyle =  {value:data, itemStyle:{color:'red', barBorderColor:'red'} };
// 					dummyData[((idx+1)*5)-1] = empStyle;
					if((idx+1)%5==0) dummyData[idx] = empStyle; 
					seriesArrData.data[idx] = empStyle;
				}
			}
		);
	}
}


/**
 * xAxis의 var_id를 찾아 Highlight 표시
 */
var xAxisSelectedVarId; 
function setHighlightxAxisOpt(varId){
	xAxisSelectedVarId=varId;
	var data = JSON.parse(JSON.stringify(mainChartInitOpt));
	var idx = data.indexOf(varId);
	if(idx==-1) return; // varId(구동부)가 제거된 경우
	data[idx] = { 
	    value: data[idx],
	    textStyle: {
	    	fontWeight : 'bold',
	    	fontSize : 11,
	        color: '#ea7e53'
	    }}
	overwriteDataOption(data);
}

//Highlight 재적용
function revertHighlightXAxisOpt(){
	if(xAxisSelectedVarId==null) return;
	setHighlightxAxisOpt(xAxisSelectedVarId);
}

// Chart의 xAxis Data 옵션 재설정
function overwriteDataOption(dataOpt){
	var opt = mainChartIns.getOption(); 
	opt.xAxis[0].data = dataOpt;
	mainChartIns.setOption(opt);
}

function onActiveSubChart(unitName, date, param){
	fnCreateSubChart(unitName, date, param);
	// 클릭한 구동부 highlight 표시
	setHighlightxAxisOpt(unitName);
}

/**
 * 메인차트 x축 클릭시 서브 차트 생성
 */
 function fnCreateSubChart(_varId, date, params){
	if(date==null) date=mainDate;
	var _var_id, _var_nm;
	
	if(_varId){
// 		_varId = _varId.split('|');
// 		var_nm = _varId[0];
// 		var_id = _varId[1];
		var_nm = _varId;
		var_id = _varId;
		var dtObj = setSubDate(date);
		
		//왼쪽 차트 보여야할 항목 표시
		$(".dateBox").css("visibility","");
		$(".sub_chart_title .left-btn").css("visibility", "");
		$(".sub_chart_title .right-btn").css("visibility", "");
		
		fnCreateSubLeftChart(_varId, dtObj.mmdd, null, params); //화면 하단의 왼쪽 차트
	}
}

//서브 왼쪽 차트 검색
var subLeftDateRangeParam;
function fnSubLeftLoad(){
	//기본 검색기간 현재 기준 2주치
	var sdate = $('#sdate').val().replaceAll('-', '') + '000000000';
	var edate = $('#edate').val().replaceAll('-', '') + '235900000';
	var _sdate = $('#sdate').val();
	var _edate = $('#edate').val();
	var dispNm = var_nm.length>30?var_nm.substr(0, 30)+'..':var_nm;
	
	subLeftDateRangeParam = null;
	if(_sdate == _edate){
		_edate = null;
		$(".sub_chart_title .left-btn").css("visibility", "");
		$(".sub_chart_title .right-btn").css("visibility", "");
		$("#subTitle1").text( "Daily History : " + dispNm +" ("+ _sdate.split('-')[1]+"/"+_sdate.split('-')[2] +")"); //타이틀 변경
// 		subDate = new Date(_sdate.split('-')[0], _sdate.split('-')[1] -1, _sdate.split('-')[2]); //검색 날짜 기준 변경
		fnCreateSubLeftChart(var_id, _sdate.split('-')[1]+_sdate.split('-')[2] , _edate); // 호출 인자(차트 출력 Arr, 시작일자, 종료일자, 차트 생성 순번)
	}else if(_sdate > _edate){
		ClKendo.fnErrorNotification({
			msg: '검색 시작일이 종료일보다 클 수 없습니다.', 
			level: 'warning', 
			opt: {
				width: 260,
				height: 42,
				position: {
					top: 570, left: 445
				}
			}
		});
		$('#sdate').val(_edate);
	}else if(_sdate < _edate){
		subLeftDateRangeParam = sdate+edate;
		$(".sub_chart_title .left-btn").css("visibility", "hidden");
		$(".sub_chart_title .right-btn").css("visibility", "hidden");
		$("#subTitle1").text( "Daily History : " + dispNm +" ("+_sdate.split('-')[1]+"/"+_sdate.split('-')[2]+" ~ "+_edate.split('-')[1]+"/"+_edate.split('-')[2]+")");
		// 차트 생성
		fnCreateSubLeftChart(var_id, sdate, edate); // 호출 인자(차트 출력 Arr, 시작일자, 종료일자, 차트 생성 순번)
	}
}

/** 
 * params { 
	callbackAction,
	dataZoomOption : {eventTime}
}
 */
function fnCreateSubLeftChart(_var_id, _sdate, _edate, params){
	clearTimeout(subInterval);
	ClAjax.fnCallAjax({
		url : '/custom/loaddetailSubLeftAjax.do',
		paramJsn : {
			loadfactor_type : loadfactor_type,
			tree_nm : tree_nm,
			sdate: _sdate,
			edate: _edate,
			dvc_id : dvc_id,
			var_id : _var_id,
		},
		sucFn : function(data) {
			if(!checkDateRangeParam(_sdate, _edate, subDate)){return;}
			if(!(data.data && data.data.list 
					       && data.data.list.length>0)){
				charOpts['sub'] && charOpts['sub'][0].clear();
			}else{
				var l = data.data.list;
				
				var _xAxis = []; // x축 시간 데이터
				var _series_data = []; // Series Object
				
				var varGrpData = ClArray._groupBy(l, ['var_id']);
				var grpKey = Object.keys(ClArray._groupBy(l, ['var_id']))[0];
				$.each(varGrpData[grpKey],  function(idx, item){
					_xAxis.push(item.data_tm);
				});
				
				$.each(varGrpData,  function(nm){
					var seriesTmp = new Array();
					$.each(varGrpData[nm], function(idx, item){
						var val;
						if(nm.includes('Peak')){val=item.data_val_max}
						else{val=item.data_val}
						seriesTmp.push(val);
						
					});
					_series_data.push(seriesTmp)
				});
				
				// 일자별 조회시, 최근 2시간만 출력
				var dataZoomOpt = {
					start : 0,
					end : null
				};
					
				if(_edate == null){
					if(params!=null && typeof params.dataZoomOption != 'undefined'){
						try{
							var time = params.dataZoomOption.eventTime.substr(8,4);
							var idx = _xAxis.map(function (e){return e.replace(":", "")}).indexOf(time);
							var idxBase = idx/_xAxis.length;
							var idxBasePcnt = idxBase*100;
							var posWeightPlus  = 4;
							var posWeightMinus = 4;
							if(isNaN(idxBasePcnt)){idxBasePcnt=100};
							if(idxBasePcnt>96){
								idxBasePcnt=96;
							}else if(idxBasePcnt<4){
								idxBasePcnt=4;
							}else{
								posWeightPlus  = posWeightPlus*idxBase;
								posWeightMinus = posWeightMinus*(1-idxBase);
							}
							dataZoomOpt.start = idxBasePcnt + posWeightMinus;
							dataZoomOpt.end   = idxBasePcnt - posWeightPlus;
						}catch(e){}
					}else{
						dataZoomOpt.start = (_xAxis.length-120)/_xAxis.length*100;
					}
				}
				
				var opt = {
					legend: {show: true},
					grid: {top:30,right:60,bottom:60,left:60},
					xAxis: {
						type: 'category',
						data: _xAxis,
						axisLabel: {
							showMinLabel: true,
							showMaxLabel: true,
						},
					},
					yAxis: [
				        {
				            type: 'value',
				            axisLabel: {
					            formatter: '{value} %'
				            },
				            min: 0,
				            max: 100,
							minInterval: 5,
				        },{
				            type: 'value',
				            splitLine :{
				            	show: false,
				            },
				            minInterval: 50,
				        }
				    ],
				    dataZoom: [
						{
							type: 'slider',
							show: true,
							showDetail: false,
							xAxisIndex: 0,
							// dataZoom 조절로 최근 2시간 데이터만 우선 출력
							start: dataZoomOpt.start,
							end : dataZoomOpt.end 
						},
						{
							type: 'slider',
							show: false,
							showDetail: false,
							yAxisIndex: 0,
							right: 65,
						},
					],
					series: [{
								type: 'line', 
								name : 'Load',
						 		yAxisIndex: 0,
						 		itemStyle : { color:'#eedd78'},
						 		lineStyle : { color :'#eedd78'},
// 						 		tooltip : { show : false,},
						 		data: _series_data[0],
							},{
								type: 'line',
								name : 'Peakload',
								yAxisIndex: 0,
								itemStyle : { color : 'red'},
						 		lineStyle : { color : 'red'},
						 		data: _series_data[2],
							},{
								type: 'line',
								name : 'Current',
								yAxisIndex: 1,
								itemStyle : { color : 'green'},
						 		lineStyle : { color : 'green'},
						 		data: _series_data[1],
							},
					]
					/** {
						type: 'line',
						smooth: true,
						data : _series_data,
						itemStyle:{
							color:'red'	
						},
						lineStyle:{
							color:'red'	
						},
					}*/
				}
				subChartIns = ClEcharts.fnCreateEcharts({
					selector: "#subChart1",
					type: 'line',
					opt_overwrite: opt,
				});
				charOpts['sub']=[];
				charOpts['sub'].push(subChartIns);
			}
		},
		errHandle : true,
		compltFn : function() {
			resizeContents();
			if(!checkDateRangeParam(_sdate, _edate, subDate)){return;}
			if(params!=null && typeof params.callbackAction != 'undefined'){params.callbackAction()}
			subInterval = setTimeout(function(){
				fnCreateSubLeftChart(_var_id, _sdate, _edate);
			}, 350000); // 5분 = 1000 * 60 * 5
		},
	});
}

//Sub Chart 초기화
 function initSubChart(data){
 	var dvcArr = data;
 	var firstUnit = {};
 	onActiveSubChart();
 	if(data!= null){
		var alarmTarget=dvcArr.filter(function(i){return i.alarm_target=='1'})[0];
		if(ClString.isNotEmpty(alarm_var_id)){
			firstUnit.name = alarm_var_id;
		}else if(alarmTarget!=null) {
			firstUnit.name = dvcArr.filter(function(i){return i.var_gr_seq==alarmTarget.var_gr_seq && i.var_gr=='LOAD_FACTOR'})[0].var_id;  
		}else{
			firstUnit.name = dvcArr[0].var_id;
		}
 		onActiveSubChart(firstUnit.name);
 		$('#btn-reset').css('visibility','visible');
//  		firstUnit.val=0;
//  		$.each(dvcArr, function(nm, item){
//  			item.forEach(function(item){
//  				if(item.load_val!=null&&item.load_val!=undefined){
//  					if(item.load_val > firstUnit.val){
//  						firstUnit.val = item.load_val;
//  						firstUnit.name = nm;
//  					}
//  				}
//  			});
//  		});
 	}

 	initGrid();
 }
 	
 // Grid 초기화	
 function initGrid(){
 	ClLayout.fnGetTabJsn().urlList.push('/custom/loadFactorAlarmAjax.do');
 	ClKendo.fnCreateGrid({
 		selectable: true,
 		change: onChange,
 		selector: '#grid',
 		height: '100%',
 		columns: [
 				{ field: "rn",					title: "No",			width: 30,			attributes:{ "class":"text-center"}},
 				{ field: "dvc_id",				title: "Device",		width: 0,			attributes:{ "class":"text-center"}, hidden: true},
 				{ field: "var_id",				title: "Unit",			width: 175,			attributes:{ "class":"text-left"}},
 				{ field: "var_gr_id",			title: "",				width: 0,			attributes:{ "class":"text-center"}, hidden: true},
 				{ field: "reason"	,			title: "Reason",		width: 85,			attributes:{ "class":"text-left"}},
 				{ field: "data_val",			title: "Load Factor",	width: 70,			attributes:{ "class":"text-right"}},
 	            { field: "data_day_val",		title: "Load Factor(YTD)",width: 90, 		attributes:{ "class":"text-right"}},
 				{ field: "data_tm",				title: "Time",			width: 0,	 		attributes:{ "class":"text-center"},hidden: true},
 				{ field: "data_tmf",			title: "Time",			width: 90, 			attributes:{ "class":"text-center"}},
 				{ field: "var_nm",				title: "var_nm",		width: 0,	 		attributes:{ "class":"text-center"},hidden: true}
 		],
 		pageable: false,
 	    scrollable: true, 
 	    toolbar: false,
 	    resizable : false,//열 사이즈 조정 가능 여부 - Boolean (default:false)
 		sortable: true,
 		columnMenu: false,//헤더 메뉴 여부 - Boolean (default:false)
 	});
 	
 	var dtObj = convertDate(alarmDate);
 	var param = { tree_nm : tree_nm,
				  dvc_id : dvc_id,
 				  edate : dtObj.yymmdd,
 			 	  edate_mmdd : dtObj.mmdd};
 	
 	fnSearch(param);

 	$("#subTitle2").text("Alarm List : (" + mmdd + ")");
 	$(".alarm_list .left-btn").css("visibility", "");
 	$(".alarm_list .right-btn").css("visibility", "");
 }

 function onChange(data){
 	$.map(this.select(), function(item) { 
 		var unitId = $(item).find('td').eq(3).text();
 		var time =$(item).find('td').eq(7).text();
 		var param = { dataZoomOption : { eventTime : time} }
 		onActiveSubChart(unitId, alarmDate, param);
 	})
 }

 function fnSearch(param){
 	fnListSearchIt({selector: '#grid', 
 					paramJsn:param,
 					url: ClLayout.fnGetTabJsn('urlList')});
 }

 function fnListSearchIt(_params) {
 	if(typeof _params.url == 'undefined') return;
 	if(_params.selPos == null) _params.selPos = -1;
 	if(typeof _params.page != 'undefined') ClLayout.fnGetSelector(_params).find("#page").val(_params.page);
 	
 	clearTimeout(gridInterval);
 	kendo.ui.progress($('body'), true);
 	
 	ClAjax.fnCallAjax({
 		url: _params.url,
 		paramJsn: _params.paramJsn, 
 		sucFn: function(data){
 			if(!checkDateParam(_params.paramJsn.edate, alarmDate)){return;} 
			if( checkCylinderType(dvc_id)){
	 			$.each(data.data.list,function(idx, el){ el.data_max = el.data_max.replace('%', 's');
														 el.data_day_max = el.data_day_max.replace('%', 's');}
	 			);
 			}
 			ClKendo.fnSetDataToKendoGrid({selector: _params.selector, data: data.data.list, selPos: _params.selPos});
 		},
 		errHandle: true,
 		compltFn: function(){
 			kendo.ui.progress($('body'), false);
 			if (_params.hasOwnProperty('callBack')) _params.callBack();
 			if(!checkDateParam(_params.paramJsn.edate, alarmDate)){  return; };
 			gridInterval=setTimeout(function(){ fnSearch(_params.paramJsn); }, 60000); 
 		},
 	});
 }
 
function checkCylinderType(dvc_id){
	var scaleStr = 'cylinder';	
	// DvcID에 Cylinder가 포함되거나, type이 지정된 경우
	var containsScaleStr = dvc_id.toLowerCase().indexOf(scaleStr)>-1;
	var isCylinderType = loadfactor_type=="LOAD_FACTOR_CYLINDER";
	return containsScaleStr||isCylinderType	; 
}
 

/**
 * 오늘날짜에서 내일날짜로 변경되었을때,
 */
function fnDateUpdate(){
	// 스크립트 실행 중 날짜가 변경되었을 때, 변경된 날짜로 변경해준다.
}


/**
 * 해당 구동부 데이터 조회(Grid 조회 페이지로 이동)
 */
function fnCreateLoadGrid(){
	// ppt의 형태에 맞게 쿼리 작성하여 Grid에 출력 
	ClCommon.fnMovePage('/custom/loaddetailgrid.do', 'type=' + _type);
	
	// 해당 페이지는 기간 검색조건 (일자별) / 조회 버튼 / 다운로드 버튼으로 구성
	// 조회 시 검색기간에 해당하는 구동부별 일자별 평균 부하율을 표시
	// 다운로드 시 해당 Grid 를 csv 파일로 다운로드, Grid를 조회하지 않아도 다운로드 할 수 있도록 서버사이드 처리
}

function fnExportExcel(){
	kendo.ui.progress($('body'), true);
	var f = document.createElement('form');
	var dateParam = convertDate(baseDate).yymmdd;
	var now = new Date();
	var excelFileName = loadfactor_type + "_" + now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2);
	var _data = {
		dvc_id : dvc_id,
		edate : dateParam,
		excelFileName : excelFileName,
		loadfactor_type : loadfactor_type,
		tree_nm : tree_nm
    };
	
	f.method = "POST";
	f.action = "./getLoadFactorExcelAjax.do";
	f.target = "winExcelFrame";

	$.fileDownload(f.action,{
	    httpMethod: "POST",
	    data:_data,
    })
   .done(function(){ kendo.ui.progress($('body'), false);})
   .fail(function(){ kendo.ui.progress($('body'), false); alert("<spring:message code='MESSAGE.EXPORTCSV' text='CSV다운로드에 실패하였습니다.' />")});
}

function doReset(){
	 if(confirm("Do you want to reset Abnormal Data?")){
		 ClAjax.fnCallAjax({
		 		url: '/custom/resetAdIndexAjax.do',
		 		paramJsn:{dvc_id : dvc_id, 
			       		  var_id: var_id}, 
		 		errHandle: true,
		 		sucFn: function(data){
		 			alert("Reset Complete");
		 		},
		 });
	 }
}

$( window ).resize( function() {
	resizeContents();
})

function resizeContents() {
	$('.unit_chart').css('height',  'calc(' + $('.chart_main').css('height') + ' - 50px)');
	$('.grid').css('height',  $('.alarm_tbl ').css('height'));
	$.each(charOpts, function(idx, charOpt){
		$.each(charOpt, function(idx, e){
			if(e.hasOwnProperty('resize')){try{e.resize();}catch(err){}};
		});
	});
}

function fnGoBack(){
// 	window.history.back();
	ClCommon.fnMovePage('/custom/'+parent_url);
}

</script>