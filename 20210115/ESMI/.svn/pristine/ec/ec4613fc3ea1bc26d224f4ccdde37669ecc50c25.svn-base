<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript">
//목록 페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/setting/piemngAjax.do');

//Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 720,
	columns: [
		{ field: "pie_nm", title: '<spring:message code="TABLE.COLUMN.PIE_NM" text="PIE 명" />', width: 250, attributes:{ 'class':"text-center"}},
		{ field: "pie_ip", title: '<spring:message code="TABLE.COLUMN.PIE_IP" text="PIE IP" />', width: 200, attributes:{ 'class':"text-center"}},
		{ field: "cim_ver", title: '<spring:message code="TABLE.COLUMN.CIM_VER" text="CIM 버전" />', attributes:{ 'class':"text-center"}},
		{ field: "addrmap_ver", title: '<spring:message code="TABLE.COLUMN.ADDRMAP_VER"	text="AddrMap 버전" />', attributes:{ 'class':"text-center"}},
		{ field: "web_ver", title: '<spring:message code="TABLE.COLUMN.WEB_VER" text="WEB 버전" />', attributes:{ 'class':"text-center"}},
		{ field: "stats_agent_ver", title: '<spring:message code="TABLE.COLUMN.STATS_AGENT_VER" text="통계 에이전트 버전" />', attributes:{ 'class':"text-center"}},
		{ field: "alarm_agent_ver", title: '<spring:message code="TABLE.COLUMN.ALARM_AGENT_VER" text="알람 에이전트 버전" />', attributes:{ 'class':"text-center"}},
		{ field: "deploy_state", title: '<spring:message code="TABLE.COLUMN.DEPLOY_STATE" text="배포 상태" />', attributes:{ 'class':"text-center"}},
		{ title: '<spring:message code="GRID.HEADER.WORK" text="작업" />', template: kendo.template($("#cmd-template").html()), width:100, attributes:{ 'class':"text-center"}, width: 150}
	],
	excel: {
    	fileName: '${pielist}'//다운로드 파일명
    },
    pageable: {
    	pageSize: 50,
    },
    scrollable: {
        virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
    },
    toolbar: false
});

ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList')});
</script>
