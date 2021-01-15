<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../jsp/config_error.jsp" %>
</head>

<body style="min-width: 1024px;">
	<div style="width: 300px; margin:250px auto; text-align: center;">
		<div>
			<img alt="403" src="${rootPath}/resource/img/error.png" style="float: left;">
			<h1 style="width: 300px; padding-top: 28px; color: #fff;">Error 403</h1>
		</div>
		<br />
		<p style="color: #fff;">
			<small>접근이 거부된 문서를 요청하였습니다.</small><br>
			<strong>관리자에게 문의하세요.</strong>
			<br><br>
		</p>
	</div>
</body>
</html>