<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.img_wrapper {
	width: 830px;
    height: 576px;
    margin: 10px 10px;
    float: left;
   	border-radius: 10px;
	background-color: #32323d;
}
.cont-body{
	height: 600px;
/*     overflow-y: scroll; */
}
.img_box img{
	width: 1215px;
    height: 450px;
    padding: 10px;
}
</style>
<div class="cont-header">
	<hgroup>
		<h1>Inspection Item</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<div class="img_wrapper">
		<c:if test="${unit.cd_val eq 'A'}">
			<img alt="Vision image" style="margin-top: 10px;"
			 src="${rootPath}/resource/img/bts/cmi/lami/p1_a.png">
		</c:if>
		<c:if test="${unit.cd_val eq 'C'}">
			<img alt="Vision image" style="margin-top: 10px;"
			 src="${rootPath}/resource/img/bts/cmi/lami/p2_c.png">
		 </c:if>
	</div>
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
			<button type="button" class="btn btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
		</div>
	</div>
</div>