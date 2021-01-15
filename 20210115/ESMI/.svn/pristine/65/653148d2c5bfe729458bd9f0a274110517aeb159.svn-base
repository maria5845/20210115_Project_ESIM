<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.img_wrapper {
	width: 1235px;
    height: 530px;
    margin: 10px 10px;
    float: left;
   	border-radius: 10px;
	background-color: #32323d;
}
.cont-body{
	height: 600px;
    overflow-y: scroll;
}
.time_box{
    width: 1215px;
    height: 40px;
    padding: 10px;
    text-align: center;
	line-height: 45px;
}
.img_box img{
	width: 1215px;
    height: 450px;
    padding: 10px;
}
</style>
<div class="cont-header">
	<hgroup>
		<h1>Vision Images (Click image to download)</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<c:forEach items="${imgMap}" var="i">
		<div class="img_wrapper">
			<div class="time_box">${i.img_time}</div>
			<div class="img_box">
				<a download="vision_${i.img_time}.jpg" href="${i.img_path}" title="Click image to download">
				    <img alt="Vision Image" src="${i.img_path}">
				</a>
			</div>
		</div>
	</c:forEach>
	<c:if test="${empty imgMap}">
		<div style="font-size: 30px;padding: 24px;text-align: left;">No Vision image available.</div>
	</c:if>
</div>

<div class="cont-foot">
	<div class="action hasMargin">
		<div class="fl">
		</div>
		<div class="fr">
<!-- 			<button type="button" class="btn btn-lg btn-x90"  -->
<!-- 				onclick="javascript:ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/setting/menuActionAjax.do' -->
<!-- 						, param: '#actionForm', validFnc: function(){return $('#actionForm').parsley().validate();}, mdClsBool: true,});"> -->
<%-- 				<spring:message code="BUTTON.SAVE" text="저장" /></button> --%>
			<button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
		</div>
	</div>
</div>