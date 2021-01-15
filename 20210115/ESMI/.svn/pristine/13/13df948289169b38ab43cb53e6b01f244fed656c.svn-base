<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">

ClLayout.fnGetTabJsn().urlList.push('/alarm/alarmnotimngAjax.do');

// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 720,
	columns: [
                 { field: "noti_seq",			title: "알람 순번",		width: 100, attributes:{ 'class':"text-center"}, hidden: true},
                 { field: "noti_type_nm",		title: "<spring:message code='TABLE.COLUMN.NOTI_TYPE' text='통지 타입' />",		width: 150, attributes:{ 'class':"text-center"}},
                 { field: "noti_nm",			title: "<spring:message code='TABLE.COLUMN.NOTI_NM' text='통지 명' />",		width: 150, attributes:{ 'class':"text-center"}},
                 { field: "noti_attr",			title: "<spring:message code='TABLE.COLUMN.NOTIATTR' text='통지 속성' />",		width: 550, attributes:{ 'class':"text-left"}},
                 { field: "mapping_yn",			title: "<spring:message code='TABLE.COLUMN.ALARM_MAPP' text='알람 맵핑여부' />",	width: 80, attributes:{ 'class':"text-center"}},
                 { title: "<spring:message code='GRID.HEADER.WORK' 	text='작업' />", template: kendo.template($("#cmd-template").html()), width:110, attributes:{ 'class':"text-center"}},
	],
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	toolbar: false
});

ClCRUD.fnListSearchIt({selector: '#grid', url: '/alarm/alarmnotimngAjax.do'});

/* Excel 익스포트 */
function fnExportExcel() {
	var grid = $("#grid").data("kendoGrid");
	grid.saveAsExcel();
}

</script>
