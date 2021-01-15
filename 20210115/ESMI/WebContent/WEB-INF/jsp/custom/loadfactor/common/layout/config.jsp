<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

	<meta charset="utf-8">
	<title>LG PIE</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<!-- 호환성보기 해제(브라우저의 가장 최신 문서모드) -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Expires" content="-1"> 
	<meta http-equiv="Pragma" content="no-cache"> 
	<meta http-equiv="Cache-Control" content="No-Cache"> 

	<!-- to do PIE로 변환필요 -->
	<link rel="icon" type="image/png" sizes="32x32" href="${rootPath}/resource/img/favicon_lg.ico">
	<link rel="icon" type="image/x-icon" href="${rootPath}/resource/img/favicon_lg.ico" >
	<link rel="shortcut icon" type="image/x-icon" href="${rootPath}/resource/img/favicon_lg.ico" >

	<!--  -->
	<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="application"/>
	<c:set var="userSession" value="${sessionScope.userSession}" scope="session"/>
	<c:set var="pageHash" value="<%=System.currentTimeMillis()%>" scope="request" />
	<!--  -->	

<!-- ********* -->
<!-- CSS Field -->
<!-- ********* -->
	
	<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/lgsmart/css/lgsmart.font.css">
	<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/font-awesome/css/font-awesome.min.css">
	
	<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/kendo/css/kendo.common.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/kendo/css/kendoui.style.all.min.css">
	
	<!-- white theme -->
	<link rel="stylesheet" class="white_link" type="text/css" media="none" href="${rootPath}/resource/css/layout.min.css">
	<link rel="stylesheet" class="white_link" type="text/css" media="none" href="${rootPath}/resource/css/custom.css">
	
	<!-- black theme -->
	<link rel="stylesheet" class="black_link" type="text/css" media="screen" href="${rootPath}/resource/ext/kendo/css/kendo.black-material.css">
	<link rel="stylesheet" class="black_link" type="text/css" media="screen" href="${rootPath}/resource/css/black/layout.min.css">
	<link rel="stylesheet" class="black_link" type="text/css" media="screen" href="${rootPath}/resource/css/black/custom.css">
	<link rel="stylesheet" class="black_link" type="text/css" media="screen" href="${rootPath}/resource/ext/echarts/dark.js">
	


<!-- *************** -->
<!-- Javscript Field -->
<!-- *************** -->
	<script src="${rootPath}/resource/ext/jquery/jquery-2.1.4.min.js"></script>
	<script src="${rootPath}/resource/ext/jquery/jquery.cookie.js"></script>
	<!-- eCharts -->
	<script src="${rootPath}/resource/ext/echarts/echarts.min.js"></script>
	<!-- Kendo -->
	<script src="${rootPath}/resource/ext/kendo/js/jszip.min.js"></script>
    <script src="${rootPath}/resource/ext/kendo/js/kendo.custom.min.js"></script>
    <script src="${rootPath}/resource/ext/kendo/js/kendo.core.min.js"></script>
	<script src="${rootPath}/resource/ext/kendo/js/kendo.all.min.js"></script>
	
	<!-- *************** -->
	<!-- Parsley -->
	<!-- *************** -->
	<script src="${rootPath}/resource/ext/parsley/parsley.js"></script>
	<script src="${rootPath}/resource/ext/parsley/i18n/ko.js"></script>
	<script src="${rootPath}/resource/ext/parsley/i18n/en.js"></script>
	
	<script src="${rootPath}/resource/ext/jquery/jquery.fileDownload.js"></script>
	<script src="${rootPath}/resource/ext/jquery/jquery.serializeObject.min.js"></script>
	
	<!-- common을 항상 최상위로 / 되도록 순서대로 -->
	<script src="${rootPath}/resource/js/class/common.class.jsp"></script>
	<script src="${rootPath}/resource/js/class/string.class.js"></script>
	<script src="${rootPath}/resource/js/class/ajax.class.jsp"></script>
	<script src="${rootPath}/resource/js/class/crud.class.jsp"></script>
	<script src="${rootPath}/resource/js/class/date.class.js"></script>
	<script src="${rootPath}/resource/js/class/echarts.class.js"></script>
	<script src="${rootPath}/resource/js/class/kendo.class.jsp"></script>
	<script src="${rootPath}/resource/js/class/popup.class.js"></script>
	<script src="${rootPath}/resource/js/class/layout.class.jsp"></script>
	<script src="${rootPath}/resource/js/class/validate.class.js"></script>
	<script src="${rootPath}/resource/js/class/array.class.js"></script>
	
	<script src="${rootPath}/resource/js/tectone.common.js"></script>
	
	<script>
		// 쿠키의 PIE_theme 값으로 테마 변경
		ClLayout.fnChangePIEThema();
	</script>