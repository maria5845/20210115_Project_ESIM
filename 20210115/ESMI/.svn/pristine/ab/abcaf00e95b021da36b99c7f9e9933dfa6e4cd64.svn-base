<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
//***********************************************************************************************
//데이트피커 설정

//데이트피커 설정
// var now = new Date();
//임시 데이터 있는 날짜로 변경
// ClKendo.fnCreateDatePicker({selector : "#edate", value: '2020-08-10', min: null
// 	, change: function() { fnGetLotList()}
// });
// ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: '15:59:00', change: function() { fnGetLotList()}});

// now.setMinutes(now.getMinutes()-10);
// ClKendo.fnCreateDatePicker({selector : "#sdate", value: '2020-08-10', min: null, change: function() { fnGetLotList()}}); 
// ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '15:00:00', change: function() { fnGetLotList()}});

// var now = new Date();
// ClKendo.fnCreateDatePicker({selector : "#sdate", value: new Date(new Date().setDate(new Date().getDate()-1)), min: null}); 
// ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: now});
// ClKendo.fnCreateDatePicker({selector : "#edate", value: now, min: null});
// ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: now});

ClKendo.fnCreateDatePicker({selector : "#sdate", value: '${sdate}', min: null}); 
ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: '${stime}'});
ClKendo.fnCreateDatePicker({selector : "#edate", value: '${edate}', min: null});
ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: '${etime}'});

<c:if test="${!empty varId}">
// 	console.log('${varId}');
	var temp = [];
	temp.push('${varId}');
	fnShowHistoryDetail(temp);
</c:if>

var saved_var_arr = [];

var common_opt={
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
			width : '550px',
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
// 			triggerEvent: true
			show: true,
			trigger: 'axis',
		},
		xAxis: {
	        type: 'category',
			show: true,
			triggerEvent: true
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
				showMinLabel: true,
				showMaxLabel: true,
			},
	    },
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
			top: '50',
			bottom: '70',
			right: '20',
			left: '40',
		},
		backgroundColor: '#32323d',
}

$(document).ready(function(){
	fnGetLotList();//lot 조회
})

//***********************************************************************************************

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


//페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/pmng/svHistoryAjax.do');
	
// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	toolbar: null,
	height: 745,
	dataBound: function(e){
		ClKendo.fnOnDataBoundClickEvent(e);
	},
	columns: [
// 		 {headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template").html()),  width:45, attributes:{ 'class':"text-center"}},
		 	{ template: kendo.template($("#pk-template").html()),  width:30, attributes:{ 'class':"text-center"}},
			{ field: "rn",				title: "No",	width: 50, attributes:{ 'class':"text-center"}},
// 			{ field: "dvc_id",			title: "<spring:message code='TABLE.COLUMN.DVC_ID' text='장치 ID' />", 				width: 150, 	attributes:{ 'class':"text-center"}},
			{ field: "var_id",			title: '<spring:message code="TABLE.COLUMN.VAR_ID" text="Parameter Name" />', 			width: 200},
			{ field: "change_cnt",		title: "<spring:message code='TABLE.COLUMN.CHANGE_CNT' text='Uadate Count' />",			width: 60,		attributes:{ 'class':"text-right"}},
			{ field: "last_mdfy_dt",	title: "<spring:message code='TABLE.COLUMN.LAST_MDFY_DT' text='Last Update Time'/>",	width: 140, 	attributes:{ 'class':"text-center"}},
			{ field: "data_val",		title: "<spring:message code='TABLE.COLUMN.CURR_DATA_VAL' text='Last Value' />",		width: 60,		attributes:{ 'class':"text-right"}},
	//			{ title: "<spring:message code='GRID.HEADER.WORK' text='작업' />", template: kendo.template($("#cmd-template").html()), 	width:90, attributes:{ 'class':"text-center"}},
	],
	pageable: {
		pageSize: 21
	},
	columnMenu: false,
	filterable: false,
	sortable: false,
    scrollable: {
        virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
    },
});

ClCRUD.fnListSearchIt({selector: '#grid', url: '/pmng/svHistoryAjax.do', page: 1});


// Grid 조회
function fnLoad(){
	ClCRUD.fnListSearchIt({selector: '#grid', url: '/pmng/svHistoryAjax.do', page: 1});
}



// 디테일 정보 조회
function fnShowHistoryDetail(){
	var selected = "";
    var var_arr = [];
    $('.excel_btn').removeClass('hide');
    
   $("input.svHistorySeq:checked").each(function(idx, ele){
        var val = $(ele).val();
        var_arr.push(val);
        saved_var_arr.push(val);
    })
    
    if(var_arr.length <= 0){
	    saved_var_arr = [];
    	alert("Please select variables.");
    	return;
    }
	fnSetSVDetailGrid(var_arr);
	fnSetSVDetailChart(var_arr);
}

//디테일 정보 조회
function fnShowGridDetail(saved_var_arr){
	fnSetSVDetailGrid(saved_var_arr);
}


function fnSetSVDetailGrid(var_arr){
	
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');
	kendo.ui.progress($('body'), true);
	ClAjax.fnCallAjax({
		url : '/pmng/svhistorydetailAjax.do',
		paramJsn : {
			sdate : sdate,
			edate : edate,
			var_arr : var_arr,
		},
		sucFn : function(data) {
			var l = data.data.list;
			
			if(l){
				// Grid생성
				ClKendo.fnCreateGrid({
					selector: '#detail_grid',
					height: 395,
					columns: [
							{ field: "var_id",			title: '<spring:message code="TABLE.COLUMN.VAR_ID" text="Parameter Name" />', 			width: 200},
							{ field: "last_mdfy_dt",	title: "<spring:message code='TABLE.COLUMN.LAST_MDFY_DT' text='Update Time'/>",				width: 140, 	attributes:{ 'class':"text-center"}},
							{ field: "curr_data_val",	title: "<spring:message code='TABLE.COLUMN.DATA_VAL' text='Value' />",		width: 50,		attributes:{ 'class':"text-right"}},
							{ field: "change_reason",	title: "<spring:message code='TABLE.COLUMN.CHANGE_REASON' text='Reason'/>",				width: 140, 	attributes:{ 'class':"text-center"}},
							{ field: "mdfy_by",			title: "<spring:message code='TABLE.COLUMN.MDFY_BY' text='Writer'/>",				width: 140, 	attributes:{ 'class':"text-center"}},
							 { title: "<spring:message code='GRID.HEADER.WORK' 	text='작업' />", template: kendo.template($("#cmd-template").html()), width:80, attributes:{ 'class':"text-center"}},
					],
					dataSource: l,
					scrollable: {
					    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
					},
					pageable: {
						pageSize: 9
					},
					toolbar: null,
					columnMenu: false,
					filterable: false,
					sortable: false,
// 					toolbar: ["excel"],
// 		            excel: {
// 		                fileName: "SV history detail.xlsx",
// 		                filterable: true
// 		            },
				});
			}
			
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			kendo.ui.progress($('body'), false);
		},
	}); 
}

function fnSetSVDetailChart(var_arr){
	kendo.ui.progress($('body'), true);
	var sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '');
	var edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '');
	
	ClAjax.fnCallAjax({
		url : '/pmng/getSVChgHisChartList.do',
		paramJsn : {
			st_md : $('#sdate').val().replaceAll('-', '').substring(4),
			et_md : $('#edate').val().replaceAll('-', '').substring(4),
			sdate : sdate,
			edate : edate,
			var_arr : var_arr,
		},
		sucFn : function(data) {
			var l = data.data.chartlist;
			
			if(l){
					// data가 있을때만 그린다.
		            var varNmArr = Object.keys(ClArray._groupBy(l, ["var_id"]));
		            var arr = ClArray._groupBy(l, ["var_id"]);
		            
		            var _xAxis = []; // x축 시간 데이터
		            var _series = []; // Series Object
		            for(var i=0; i<varNmArr.length; i++){
						var tmp = [];
						var pre_val = null;
						var curr_val = 0;
						$.each(arr[varNmArr[i]], function(idx, item){
						   if(i==0)_xAxis.push(item.data_tm);
						   
						   if(item.data_val != null){
						 	  tmp.push(item.data_val);
						 	  pre_val = item.data_val;
						   }else if(pre_val != null){
						 	  tmp.push(pre_val);
						   }else{
						 	  tmp.push(0);
						   }
						   
						})
						
// 						console.log(tmp);
						
						_series.push({
							type      : 'line',
							step	  : 'start',
							name      : varNmArr[i],
							data      : tmp, 
						});
					}
		            
					// 차트 옵션
					var customOption = {
// 							    toolbox: {
// 							        feature: {
// 							            myTool1: {
// 							                show: true,
// 							                title: 'custom extension method 1',
// 							                icon: 'path://M432.45,595.444c0,2.177-4.661,6.82-11.305,6.82c-6.475,0-11.306-4.567-11.306-6.82s4.852-6.812,11.306-6.812C427.841,588.632,432.452,593.191,432.45,595.444L432.45,595.444z M421.155,589.876c-3.009,0-5.448,2.495-5.448,5.572s2.439,5.572,5.448,5.572c3.01,0,5.449-2.495,5.449-5.572C426.604,592.371,424.165,589.876,421.155,589.876L421.155,589.876z M421.146,591.891c-1.916,0-3.47,1.589-3.47,3.549c0,1.959,1.554,3.548,3.47,3.548s3.469-1.589,3.469-3.548C424.614,593.479,423.062,591.891,421.146,591.891L421.146,591.891zM421.146,591.891',
// 							                onclick: function (){
// 							                	fnCreateExcel('chart_box');
// 							                }
// 							            },
// 							        }
// 							    },
					      legend: {
					         data: varNmArr,
					      },
					      xAxis: {
					         data: _xAxis,
					      },
					      series: _series,
					};
		            
		            // 차트 옵션 설정
		            customOption = $.extend(true, {}, common_opt, customOption);
// 		            ClEcharts.fnCreateEcharts({
// 		               selector: '#chart_box',
// 		               type: 'line',
// 		               opt_overwrite: customOption,
// 		            });
		            var _dom = document.getElementById('chart_box');
		            var c = echarts.getInstanceByDom(_dom);
					if(c != null){
						c.dispose();
						c = null;
					}	
					var chart = echarts.init(_dom, 'dark');
					
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
    _var_arr = opt.legend[0].data;
	
	var f = document.createElement('form');
	
	var _data = {
		sdate : sdate,
		edate : edate,
		var_arr: _var_arr,
		set_type: 'raw'
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


