<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
// + 모양의 Symbol Icon
var plusIconPath = "path://m408 184h-136c-4.417969 0-8-3.582031-8-8v-136c0-22.089844-17.910156-40-40-40s-40 17.910156-40 40v136c0 4.417969-3.582031 8-8 8h-136c-22.089844 0-40 17.910156-40 40s17.910156 40 40 40h136c4.417969 0 8 3.582031 8 8v136c0 22.089844 17.910156 40 40 40s40-17.910156 40-40v-136c0-4.417969 3.582031-8 8-8h136c22.089844 0 40-17.910156 40-40s-17.910156-40-40-40zm0 0";
var gridInterval = null;
// $("#btn-switch").click(function(){
// 	$('.switch-view').removeClass('.display-block');
// 	$(this).addClass('.display-none');
// });

var resetDate = '${resetDate}';
var sdate = '${sdate}';
var edate= '${edate}';

var timer

function switchView(viewId){
	$('.switch-view').removeClass('display-block');
// 	$('.switch-view').addClass('display-none');
	$('.'+viewId ).addClass('display-block');
	resizeContents();
}

$(document).ready(function(){
	fnInitUI();
	fnChartInit();
	initGrid();
	if(ClString.isNotEmpty(viewType)){
		switchView(viewType)
	}
    setResetDate(resetDate);
});

function setResetDate(resetDate){
	$("#reset_date").html(resetDate);
}

var dvcCnt;
function fnInitUI(){
	dvcCnt = Object.keys(pkg4Jsn).length; 
	var mainUnit = '${mainUnit.cd_val}';
	if(dvcCnt==1){
// 		fnUnitDetail(1);
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
}

/**
 * 패키지에 설정된 6개의 Unit별 함수 생성호출 함수
 */
function fnChartInit(){
	$.each(pkg4Jsn, function(gubun, item, startDate){
		var idx = gubun.substring(4);
		$(".chart_title" + idx).text(item.name);
		// 차트 데이터 조회
		fnCreateUnitChart(idx, item.dvc_id);
	})
// 	if($('.l-footer', parent.document).find('.version_text').text() == ''){
// 		$('.l-footer', parent.document).append('<div style="float: right;width: 1px;"><p class="version_text" style="float: right;right: 5px;width: 200px;">'+CWA_VERSION+'</p></div>');
// 	}
}

/**
 * 각 Unit별 차트 생성
 */
var charOpts = [];
function fnCreateUnitChart(idx, dvc_id){
// 	var startDate = new Date().toISOString().slice(0,10).replace(/-/g,"");
	var startDate = convertDate(new Date()).yymmdd;
	ClAjax.fnCallAjax({
		url : '/custom/loadfactorADAjax.do',
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
						grid: {top:30,
							   right:40,
							   bottom:dvcCnt>6?25:95,
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
							max: function(value){return checkCylinderType(dvc_id)?5:100},
							minInterval : checkCylinderType(dvc_id)?1:(dvcCnt>6?50:25),
				            axisLabel: {
					            formatter: checkCylinderType(dvc_id)?'{value}s':'{value} %',
								interval: 10,
								showMinLabel: true,
								showMaxLabel: true,
								textStyle: {
								    color: '#EA7E53'
								}
				            },
				            name : 'Max부하율/일',
					        nameTextStyle : {align : 'right',
					        				 color : '#EA7E53',
					        				 fontWeight : 'bold'},
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
					            textStyle: {
								    color: '#EEDD78'
								}
				            },
				            name : '증감률',
					        nameTextStyle : {color : '#EEDD78',
					        				 align : 'left',
					        				 fontWeight : 'bold'},
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
						name: 'increase/decrease',
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
			timer = setTimeout(function(){
				fnCreateUnitChart(idx, dvc_id);
			}, 600000) // 10분 = 1000*60*10
		},
	});
}

function initGrid(){
 	ClLayout.fnGetTabJsn().urlList.push('/custom/loadfactorADAlarmListAjax.do');
 	ClKendo.fnCreateGrid({
 		selectable: true,
 		change: onChange,
 		toolbar: false,
	    excelExport: function(e) {
	        e.workbook.fileName = kendo.toString("Abnormal_Unit_List") + ".xlsx";
	    },
 		selector: '#grid',
 		height: '100%',
 		columns: [
 				{ field: "seq",					title: "No",			width: 40,			attributes:{ "class":"text-center"},hidden: true},
 				{ field: "data_tm",				title: "Day",			width: 100, 		attributes:{ "class":"text-center"}},
 				{ field: "dvc_id",				title: "Device",		width: 100,			attributes:{ "class":"text-left"}},
 				{ field: "var_id",				title: "Unit",			width: 250,			attributes:{ "class":"text-left"}},
 				{ field: "cause_type",			title: "Case",			width: 80,			attributes:{ "class":"text-center"}},
 	            { field: "cause_val",			title: "Value",			width: 100, 		attributes:{ "class":"text-center"}},
 				{ field: "cnt",					title: "Count",			width: 80,	 		attributes:{ "class":"text-center"}},
 				{ field: "check_flag",			title: "",				width: 100, 		attributes:{ "class":"text-center"},hidden: true},
 				{ field: "var_nm",				title: "",				width: 100, 		attributes:{ "class":"text-center"},hidden: true}
 		],
 		pageable: false,
 	    scrollable: true, 
 	    toolbar: false,
 	    resizable : false,//열 사이즈 조정 가능 여부 - Boolean (default:false)
 		sortable: false,//정렬 가능여부 - Boolean (default: true)
 		columnMenu: false,//헤더 메뉴 여부 - Boolean (default:false)
 		dataBound: function(e) {
 			var dataItems = e.sender.dataSource.view();
            for (var j = 0; j < dataItems.length; j++) {
               var check_flag = dataItems[j].get("check_flag");
               var row = e.sender.tbody.find("[data-uid='" + dataItems[j].uid + "']");
               if (check_flag=='1') {
                 row.addClass("bg-grey");
               }
            }
        }
 	});
 	
 	var sdate = new Date(resetDate+" 00:00:00").format('yyyy-MM-dd HH:mm:ss');
 	var param = {loadfactor_type : loadfactor_type, sdate : sdate, edate : null};
 	fnSearch(param);
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
//  		if(!checkDateParam(_params.paramJsn.edate, alarmDate)){return;} 
 			ClKendo.fnSetDataToKendoGrid({selector: _params.selector, data: data.data.list, selPos: _params.selPos});
 		},
 		errHandle: true,
 		compltFn: function(){
 			kendo.ui.progress($('body'), false);
 			if (_params.hasOwnProperty('callBack')) _params.callBack();
 			gridInterval=setTimeout(function(){ fnSearch(_params.paramJsn); }, 60000); 
//  			gridInterval=setTimeout(function(){ fnSearch(_params.paramJsn); }, 60000); 
 		},
 	});
 }
 
 function onChange(data){
 	$.map(this.select(), function(item) { 
 		var seq = $(item).find('td').eq(0).text();
 		var dvc_id = $(item).find('td').eq(2).text();
 		var var_id = $(item).find('td').eq(3).text();
 		var var_nm = $(item).find('td').eq(8).text();
 		var unitNo;
 		$.each(pkg4Jsn, function(i, e){
 			if(ClString.isNotEmpty(e.dvc_id_list) && e.dvc_id_list.split(',').includes(dvc_id)){
				unitNo=e.idx;
 			}
 		}); 
 		updateADAxisListItemStatus(seq, 0);
 		fnUnitDetail(unitNo, var_id, var_nm);
 	})
 }
 
 function updateADAxisListItemStatus(seq, status){
	 ClAjax.fnCallAjax({
	 		url: '/custom/updateADListItemStatusAjax.do',
	 		paramJsn: {seq : seq}, 
	 		sucFn: function(data){},
	 		errHandle: true,
	 		compltFn: function(){},
	 });
 }
 
 function doReset(){
	 if(confirm("Do you want to reset Abnormal Data?")){
		 ClAjax.fnCallAjax({
		 		url: '/custom/resetAdIndexAjax.do',
		 		errHandle: true,
		 		sucFn: function(data){
		 			alert("reset Complete");
		 			location.reload();
		 		},
		 });
	 }
 }

function fnExportExcel(){
	var dateParam = convertDate(new Date()).yymmdd;
	var now = new Date();
	$.each(pkg4Jsn, function(i, e){
		kendo.ui.progress($('body'), true);
		var excelFileName = loadfactor_type+'_('+e.name+")_"+ now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2);
		var _data = {
			dvc_id : e.dvc_id,
			edate : dateParam,
			excelFileName : excelFileName,
			loadfactor_type : loadfactor_type,
			tree_nm : tree_nm
	    };
		
		var f = document.createElement('form');
		f.method = "POST";
		f.action = "./getLoadFactorExcelAjax.do";
		f.target = "winExcelFrame";
	
		$.fileDownload(f.action,{
		    httpMethod: "POST",
		    data:_data,
		    async:false
	    })
	   .done(function(){kendo.ui.progress($('body'), false);})
	   .fail(function(){kendo.ui.progress($('body'), false); 
	   				    alert("<spring:message code='MESSAGE.EXPORTCSV' text='CSV다운로드에 실패하였습니다.' />")});
	});
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
		if(e.hasOwnProperty('resize')){try{e.resize();}catch(err){}};
	});
}

/**
 * 각 Unit별 상세 페이지 이동
 */
function fnUnitDetail(_idx, var_id, var_nm){
	if(pkg4Jsn.hasOwnProperty('unit'+_idx)) ClCommon.fnMovePage('/custom/loaddetailAD.do', 'gubun='+_idx+'&loadfactor_type='+loadfactor_type+'&parent_url='+parent_url  +'&tree_nm='+tree_nm +'&var_id='+encodeURIComponent(var_id) +'&var_nm='+encodeURIComponent(var_nm));
}

/* Excel 익스포트 */
function fnGridExportExcel() {
  var grid = $("#grid").data("kendoGrid");
  grid.saveAsExcel();
}

function fnOpenResetHistModal(){
	clearTimeout(timer);
	clearTimeout(gridInterval);
	clearInterval(timer);
	clearInterval(gridInterval);
    ClPopup.fnOnClickModalOpen( '${rootPath}/custom/modalResetAdHistList.do', '', '900');
}



</script>