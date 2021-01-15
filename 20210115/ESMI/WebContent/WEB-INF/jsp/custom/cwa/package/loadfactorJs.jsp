<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="../package/cwa_version.jsp" %>

<script>
// + 모양의 Symbol Icon
var plusIconPath = "path://m408 184h-136c-4.417969 0-8-3.582031-8-8v-136c0-22.089844-17.910156-40-40-40s-40 17.910156-40 40v136c0 4.417969-3.582031 8-8 8h-136c-22.089844 0-40 17.910156-40 40s17.910156 40 40 40h136c4.417969 0 8 3.582031 8 8v136c0 22.089844 17.910156 40 40 40s40-17.910156 40-40v-136c0-4.417969 3.582031-8 8-8h136c22.089844 0 40-17.910156 40-40s-17.910156-40-40-40zm0 0";

$(document).ready(function(){
	fnInitUI();
	
});

var dvcCnt;
function fnInitUI(){
	dvcCnt = Object.keys(pkg4Jsn).length; 
	var mainUnit = '${mainUnit.cd_val}';
	if(dvcCnt==1){
		fnUnitDetail(1);
		return;
	}else if(dvcCnt%2>=1) {
		var idx=0;
		if(ClString.isNotEmpty(mainUnit)){
			var j=0;
			$.each(pkg4Jsn, function(i, e){ 
				if(e.name==mainUnit){idx=j;}
				else{j++;}
			}) 
		} 
		$('.unit:eq('+idx+')').css('width', 'calc(100% - 30px)');
	}else if (dvcCnt==2){
		$('.unit').css('height', 'calc(50% - 20px)');
		$('.unit').css('width', 'calc(100% - 30px)');
	}
	fnChartInit();
}

/**
 * 패키지에 설정된 6개의 Unit별 함수 생성호출 함수
 */
function fnChartInit(){
	$.each(pkg4Jsn, function(gubun, item, startDate){
		var idx = gubun.substring(4, 5);
		$(".chart_title" + idx).text(item.name);
		// 차트 데이터 조회
		fnCreateUnitChart(idx, item.dvc_id);
	})
	if($('.l-footer', parent.document).find('.version_text').text() == ''){
		$('.l-footer', parent.document).append('<div style="float: right;width: 1px;"><p class="version_text" style="float: right;right: 5px;width: 200px;">'+CWA_VERSION+'</p></div>');
	}
}

/**
 * 각 Unit별 차트 생성
 */
var charOpts = [];
function fnCreateUnitChart(idx, dvc_id){
// 	var startDate = new Date().toISOString().slice(0,10).replace(/-/g,"");
	var startDate = convertDate(new Date()).yymmdd;
	ClAjax.fnCallAjax({
		url : '/custom/loadfactorAjax.do',
		paramJsn : {
			async: false,
			loadfactor_type : loadfactor_type,
			tree_nm : tree_nm,
			dvc_id : dvc_id,
			arr : new Array(),
			startDate : startDate
		},
		sucFn : function(data) {
			if(data.data && data.data.list){
				var l = data.data.list

				// X축 카테고리(구동부)와 Value 생성
				var xAxisArr = new Array();
				var seriesArr = new Array(); // 
				var seriesArr2 = new Array();
				l.forEach(function(item){
					xAxisArr.push(item.xunit);
					seriesArr.push(item.data_val);	// Bar 금일 부하량
					seriesArr2.push(item.load_val); // Line 금일부하량-전일부하량
				});
				seriesArr2.forEach(
					function(data, idx){
						if(data > 0){
							seriesArr[idx] = { value : seriesArr[idx],
											   itemStyle : {color : 'red', barBorderColor : 'red'} };
						}
					}
				);
				 
				var chartOption = {
						legend: {show: false},
						grid: {top:10,
							   right:40,
							   bottom:dvcCnt>6?50:95,
							   left:40},
						xAxis: {
							type: 'category',
							data: xAxisArr,
							axisLabel: {
								showMinLabel: true,
								showMaxLabel: true,
								interval: 0,
								rotate: 60,
								fontSize: 7,
								formatter: function (value, index) {
								    var a = value.split('|');
								    return dvcCnt>6?a[0].substr(0, 10):a[0];
								}
							},
						},
// 						yAxis:{
// // 							interval: 20,
// 							splitNumber: 5,
// 							axisLabel: {
// 					            formatter: '{value} %',
// 					            showMinLabel: true,
// 								showMaxLabel: true,
// 				            },
// 				            min: -100,
// 				            max: 100,
// 						},
					yAxis: [
				        {
				            type: 'value',
				            min: 0,
							max: function(value){return checkCylinderType(dvc_id)?Math.ceil(value.max):100},
							minInterval : checkCylinderType(dvc_id)?1:(dvcCnt>6?50:25),
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
				        {
				            type: 'value',
				            max: function(value){return checkCylinderType(dvc_id)?Math.max(1, Math.ceil(value.max)):50}, 
				            min: function(value){return checkCylinderType(dvc_id)?Math.max(1, Math.ceil(value.max))*(-1):-75},
							minInterval : checkCylinderType(dvc_id)?1:(dvcCnt>6?50:25),
							splitNumber: 8,
// 				            symbol: plusIconPath,
// 							symbolSize: 12,
				            axisLabel: {
								formatter: function (value, index) {
								    if(value >= -100){
								    	return value + (checkCylinderType(dvc_id)?'s':' %');
								    }
								},
					            showMinLabel: checkCylinderType(dvc_id)?true:false,
					            showMaxLabel: true,
				            },
				            splitLine :{
// 				            	show: false,
				            }
				        }
				    ],
					dataZoom: {show: false},
					series: {
						type: 'line',
						name: 'nm', 
						symbol: plusIconPath, 
						symbolSize: 12, 
						data: seriesArr,
					},
					series: [{
						type: 'bar',
						name: '부하량',
						yAxisIndex: 0,
						symbol: 'none',
						itemStyle:{
							color: '#ea7e53'
			            },
						data: seriesArr
					},
					{
						type: 'line',
						name: '증감량',
						yAxisIndex: 1,
						data: seriesArr2,
			            symbol: plusIconPath,
						symbolSize: 5,
						itemStyle:{
							color: '#eedd78'
			            },
// 				 		markLine:{
// 				 			data: [{name: 'load', yAxis: 0}],
// 				 			label: {show: false},
// 				 			symbol: 'none',
// 				 			lineStyle:{
// 				 				type: 'dashed',
// 				 				color : '#FF3333',
// 				 				width : 3
// 				 			}
// 				 		},
					}]
				}
				// 차트 생성
				var c = ClEcharts.fnCreateEcharts({
					selector: "#unit_" + idx + "_chart",
					type: 'line',
					opt_overwrite: chartOption,
				});
				charOpts.push(c);
			}
		},
		errHandle : true,
		compltFn : function() {
			resizeContents();
			setTimeout(function(){
				fnCreateUnitChart(idx, dvc_id);
			}, 600000) // 10분 = 1000*60*10
		},
	});
}

function fnExportExcel(){
	kendo.ui.progress($('body'), true);
	var f = document.createElement('form');
	var dateParam = convertDate(new Date()).yymmdd;
	var now = new Date();
	var excelFileName = 'LOAD_FACTOR_' + now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2);
	var _data = {
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
	    data:_data
    })
   .done(function(){ kendo.ui.progress($('body'), false);})
   .fail(function(){ kendo.ui.progress($('body'), false); alert("<spring:message code='MESSAGE.EXPORTCSV' text='CSV다운로드에 실패하였습니다.' />")});
}

function checkCylinderType(dvc_id){
	// DvcID에 Cylinder가 포함되거나, type이 지정된 경우
	var containsScaleStr = dvc_id.toLowerCase().indexOf('cylinder')>-1;
	var isCylinderType = loadfactor_type=="LOAD_FACTOR_CYLINDER";
	return containsScaleStr||isCylinderType	; 
}

//convert Date -> yyyy, mm, dd
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

$( window ).resize( function() {
	resizeContents();
})

function resizeContents() {
	$('.unit_chart').css('height',  'calc(' + $('.unit').css('height') + ' - 50px)');
	$.each(charOpts, function(idx, e){
// 		if(e!=null && e.resize!=null) e.resize();
		if(e.hasOwnProperty('resize')){try{e.resize();}catch(err){}};
	});
}

/**
 * 각 Unit별 상세 페이지 이동
 */
function fnUnitDetail(_idx){
	if(pkg4Jsn.hasOwnProperty('unit'+_idx)) ClCommon.fnMovePage('/custom/loaddetail.do', 'gubun='+_idx+'&loadfactor_type='+loadfactor_type+'&parent_url='+parent_url  +'&tree_nm='+tree_nm);
}


</script>