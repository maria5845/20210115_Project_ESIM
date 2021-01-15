<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../inc/config.jsp" %>
	
</head>
<body>


	<div class="l-kendo-wrap override" style="max-width: 1920px; height: 100%;">
	
		<jsp:include page='${viewName}.jsp' flush="false"/>
	
	</div>
	
	<!-- Page Javascript File -->
	<jsp:include page='${viewName}Js.jsp' flush="false"/>
	

	<!-- Common Js File -->
	<%@include file="../inc/config_commonJs.jsp" %>
	<%@include file="/WEB-INF/jsp/custom/cwa/common/variableJs.jsp"%>
	
</body>
</html>
