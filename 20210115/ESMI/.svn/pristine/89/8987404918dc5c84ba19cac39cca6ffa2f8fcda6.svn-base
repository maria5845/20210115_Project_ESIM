<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../inc/config.jsp" %>
</head>
<body>
	
	<!-- 컨텐츠영역 -->
	<div class="l-kendo-wrap override" style="max-width: 1920px; height: 100%;">
		
		<%@include file="../inc/inc_lnb.jsp" %>
		
		<div class=" ${tree_use_yn eq 'Y' || tree_use_yn eq 'S' ? 'cntnt_lnb' : ''}" style="height: 100%;">
			<jsp:include page='${viewName}.jsp' flush="false"/>
		</div>
	
	</div>

	<!-- Common Js File -->
	<%@include file="../inc/config_commonJs.jsp" %>
	
	<!-- Page Javascript File -->
	<jsp:include page='${viewName}Js.jsp' flush="false"/>

</body>
</html>
