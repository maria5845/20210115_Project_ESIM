<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="./config.jsp" %>
</head>

<body style="width:100vw; min-width: 900px; max-width: 1920px; overflow-x: hidden;">
	<div class="responsive">

		<!-- Area Content -->
		<jsp:include page='${viewName}.jsp' flush="false"/>
		
	</div>
	
</body>

<%@include file="../formatJs.jsp"%>
<%@include file="../variableJs.jsp"%>
<!-- Page Javascript File -->
<jsp:include page='${viewName}Js.jsp' flush="false"/>

</html>
