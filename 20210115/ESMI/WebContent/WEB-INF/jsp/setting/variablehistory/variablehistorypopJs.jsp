<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 485,
	columns: [
		{ field: "curr_data_val",	title: "<spring:message code='TABLE.COLUMN.CURR_DATA_VAL' text='최근 수집 값' />",	width: 120,		attributes:{ 'class':"text-right"}},
		{ field: "pre_data_val",	title: "<spring:message code='TABLE.COLUMN.PRE_DATA_VAL' text='이전 수집 값' />",		width: 120,		attributes:{ 'class':"text-right"}},
		{ field: "change_reason",	title: "<spring:message code='TABLE.COLUMN.CHANGE_REASON' text='변경 사유'/>",		width: 400},
		{ field: "last_mdfy_dt",	title: "<spring:message code='TABLE.COLUMN.MDFY_DT' text='변경일시'/>",				width: 140, 	attributes:{ 'class':"text-center"}},
		{ field: "mdfy_by",			title: "<spring:message code='TABLE.COLUMN.MDFY_BY' text='변경자'/>",				width: 120, 	attributes:{ 'class':"text-center"}}
	],
	scrollable: true,
	toolbar: false,
	pageable: false
});

// Grid 조회
ClKendo.fnSetDataToKendoGrid({selector: "#grid", data: ${list}});


/**
 * 저장
 */
function fnSave(){
    ClCRUD.fnActionIt({
    	selector: '#grid', url: "/sensor/variablehistoryAjax.do", 
		actionUrl: '/sensor/variablehistoryAction.do',
		param: '#actionForm', validFnc: function(){return $('#actionForm').parsley().validate();}, 
		mdClsBool: false, callBack: fnClose
	});
}

/**
 * 팝업 종료
 */
function fnClose(){
	window.open('','_self').close();	
}

</script>