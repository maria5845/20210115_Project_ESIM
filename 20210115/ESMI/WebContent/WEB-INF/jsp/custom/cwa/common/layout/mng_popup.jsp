<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="./config.jsp" %>
</head>


<body>
	<div class="ipop syspop">
		<div class="pop-cont">
		
			<jsp:include page='${viewName}.jsp' flush="false"/>
		
		</div>
	
	</div>

<%@include file="../variableJs.jsp"%>
<!-- Page Javascript File -->
<jsp:include page='${viewName}Js.jsp' flush="false"/>

</body>
</html>

