<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
//목록 페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/pmng/varRulemngAjax.do');

// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 720,
	columns: [
         { field: "var_id",			title: "<spring:message code='TABLE.COLUMN.VAR_ID' text='변수 명' />",			width: 250, attributes:{'class':"text-center"}},
         { field: "based_var_id",	title: "<spring:message code='TABLE.COLUMN.BASED_VAR_ID' text='Based Variable ID' />",		width: 250, attributes:{'class':"text-center"}},
         { field: "set_type",		title: "<spring:message code='TABLE.COLUMN.SET_TYPE' text='Type' />",				width: 100, attributes:{'class':"text-center" }},
         { field: "green_min",		title: "<spring:message code='TABLE.COLUMN.GREEN_MIN' text='GREEN MIN' />",			width: 100, attributes:{ 'class':"text-center"}},
         { field: "green_max",		title: "<spring:message code='TABLE.COLUMN.GREEN_MAX' text='GREEN MAX' />",			width: 100, attributes:{'class':"text-center" }},
         { field: "yellow_min",		title: "<spring:message code='TABLE.COLUMN.YELLOW_MIN' text='YELLOW MIN' />",			width: 100, attributes:{ 'class':"text-center"}},
         { field: "yellow_max",		title: "<spring:message code='TABLE.COLUMN.YELLOW_MAX' text='YELLOW MAX' />",			width: 100, attributes:{ 'class':"text-center"}},
         { field: "red_min",		title: "<spring:message code='TABLE.COLUMN.RED_MIN' text='RED MIN' />",			width: 100, attributes:{ 'class':"text-center"}},
         { field: "red_max",		title: "<spring:message code='TABLE.COLUMN.RED_MAX' text='RED MAX' />",			width: 100, attributes:{ 'class':"text-center"}},
         { title: "<spring:message code='GRID.HEADER.WORK' 	text='작업' />", template: kendo.template($("#cmd-template").html()), width:150, attributes:{ 'class':"text-center"}},
	],
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	toolbar: false,
	pageable: false
});

ClCRUD.fnListSearchIt({selector: '#grid', url: '/pmng/varRulemngAjax.do'});

isProcessing = false;
// /**
//  * 알람 에이전트 restart
//  */
// function fnReloadAlarmAgent(){
// 	if(isProcessing) return;
// 	isProcessing = true;
		
// 	kendo.ui.progress($('body'), true);
	
// 	ClAjax.fnCallAjax({
// 		url: '/sensor/restartAgentAjax.do',
// 		paramJsn: {
// 			propKey: 'alarmagent.refresh_rule_url',
// 			agentNm: '알람',
// 		},
// 		sucFn: function(data){
// 			alert(data.msg);
// 		},
// 		errHandle: true,
// 		compltFn: function(){
// 			kendo.ui.progress($('body'), false);
// 			isProcessing = false;
// 		},
// 	});
// }

// function fnBeepSuspendAlarmAgent(t){
// 	if(isProcessing) return;
// 	isProcessing = true;
		
// 	kendo.ui.progress($('body'), true);

// 	ClAjax.fnCallAjax({
// 		url: '/sensor/restartAgentAjax.do',
// 		paramJsn: {
// 			propKey: 'alarmagent.beep_suspend_url',
// 			agentNm: '알람',
// 		},
// 		sucFn: function(data){
// 			alert(data.msg);
// 		},
// 		errHandle: true,
// 		compltFn: function(){
// 			kendo.ui.progress($('body'), false);
// 			isProcessing = false;
// 		},
// 	});
// }

/* Excel 익스포트 */
function fnExportExcel() {
	var grid = $("#grid").data("kendoGrid");
	grid.saveAsExcel();
}


/**
 * 검색 자동완성 기능
 */
// 알람 룰 명
// ClKendo.fnCreateAutoComplete({
//  	selector: '#alarm_rule_nm',
//  	dataSource:{
//  		transport:{
//  			parameterMap: function(data, oper){
// 				var filter = $("#alarm_rule_nm").data('kendoAutoComplete').dataSource.filter();
//                 data.search_type = "alarm_rule_nm";
//                 if( filter.filters.length > 0 ){
//               	   data.search_value = filter.filters[0].value;
//                 }
// 				return data;
//  			}
//  		}
//  	}
// });

</script>
