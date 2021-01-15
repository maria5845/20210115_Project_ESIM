<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
//목록 페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/alarm/alarmrulemngAjax.do');

// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 720,
	columns: [
                 { field: "alarm_rule_seq",		hidden: true},
                 { field: "alarm_type_nm",		title: "<spring:message code='TABLE.COLUMN.ALARM_TYPE' text='알람 타입' />",			width: 100, attributes:{ 'class':"text-center"}},
                 { field: "alarm_rule_nm",		title: "<spring:message code='TABLE.COLUMN.ALARM_RULE_NM' text='알람 규칙 명' />",			width: 250, attributes:{ }},
                 { field: "chk_op_label",		title: "<spring:message code='TABLE.COLUMN.ALARM_TERMS' text='알람 조건' />",			width: 280, attributes:{'class':"text-center" }},
                 { field: "alarm_lvl_nm",		title: "<spring:message code='TABLE.COLUMN.ALARM_LVL' text='알람 레벨' />",			width: 95, attributes:{ 'class':"text-center"}},
                 { field: "alarm_interval",		title: "<spring:message code='TABLE.COLUMN.ALARM_INTERVAL' text='알람 간격' />",				width: 110, attributes:{ 'class':"text-center"}
                 	, template: '# if(typeof alarm_interval == "undefined" || alarm_interval == 0){# #:alarm_interval# #}'
                 	+ 'else if(alarm_interval > 3600 ) { # #:alarm_interval/3600#시간 # }else{# #:alarm_interval/60#분 #} #'},
                 { field: "chk_time_label",		title: "<spring:message code='TABLE.COLUMN.CHKTIME' text='체크 시간' />",			width: 150, attributes:{'class':"text-center" }},
                 { field: "alarm_msg",			title: "<spring:message code='TABLE.COLUMN.ALARM_MSG' text='알람 메시지' />",			width: 400, attributes:{ 'class':"text-left"}},
                 { field: "noti_yn",			title: "<spring:message code='TABLE.COLUMN.NOTI_YN' text='통지 여부' />",			width: 100, attributes:{ 'class':"text-center"}},
                 { field: "use_yn",				title: "<spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부' />",			width: 80, attributes:{ 'class':"text-center"}},
                 { title: "<spring:message code='GRID.HEADER.WORK' 	text='작업' />", template: kendo.template($("#cmd-template").html()), width:150, attributes:{ 'class':"text-center"}},
	],
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	toolbar: false
});

ClCRUD.fnListSearchIt({selector: '#grid', url: '/alarm/alarmrulemngAjax.do'});

isProcessing = false;
/**
 * 알람 에이전트 restart
 */
function fnReloadAlarmAgent(){
	if(isProcessing) return;
	isProcessing = true;
		
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url: '/sensor/restartAgentAjax.do',
		paramJsn: {
			propKey: 'alarmagent.refresh_rule_url',
			agentNm: '알람',
		},
		sucFn: function(data){
			alert(data.msg);
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
			isProcessing = false;
		},
	});
}

function fnBeepSuspendAlarmAgent(t){
	if(isProcessing) return;
	isProcessing = true;
		
	kendo.ui.progress($('body'), true);

	ClAjax.fnCallAjax({
		url: '/sensor/restartAgentAjax.do',
		paramJsn: {
			propKey: 'alarmagent.beep_suspend_url',
			agentNm: '알람',
		},
		sucFn: function(data){
			alert(data.msg);
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
			isProcessing = false;
		},
	});
}

/* Excel 익스포트 */
function fnExportExcel() {
	var grid = $("#grid").data("kendoGrid");
	grid.saveAsExcel();
}


/**
 * 검색 자동완성 기능
 */
// 알람 룰 명
ClKendo.fnCreateAutoComplete({
 	selector: '#alarm_rule_nm',
 	dataSource:{
 		transport:{
 			parameterMap: function(data, oper){
				var filter = $("#alarm_rule_nm").data('kendoAutoComplete').dataSource.filter();
                data.search_type = "alarm_rule_nm";
                if( filter.filters.length > 0 ){
              	   data.search_value = filter.filters[0].value;
                }
				return data;
 			}
 		}
 	}
});

</script>
