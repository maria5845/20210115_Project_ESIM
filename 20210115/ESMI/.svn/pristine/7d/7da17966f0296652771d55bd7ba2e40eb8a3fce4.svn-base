<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.img_wrapper {
	width: 400px;
    height: 235px;
    margin: 10px 10px;
    float: left;
   	border-radius: 10px;
	background-color: #32323d;
}
.cont-body{
	height: 500px;
    overflow-y: scroll;
}
.time_box{
    width: 380px;
    height: 40px;
    padding: 10px;
    text-align: center;
	line-height: 45px;
}
.img_box{
	width: 380px;
    height: 155px;
    padding: 10px;
}
</style>
<div class="cont-header">
	<hgroup>
		<h1>CTQ List</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<div id="ctpGrid"></div>
	<script id="pk-template" type="text/x-kendo-template">
			<input class="varId" type="checkbox" value="#:var_id#"
				# if(checked == 'true' ) { #
					#='checked'#
				# } #
			/>
		</script>
</div>

<div class="cont-foot">
	<div class="action hasMargin">
		<div class="fl">
		</div>
		<div class="fr">
			<button type="button" class="btn btn-lg btn-x90" 
				onclick="javascript:fnSetCtq()">
				<spring:message code="BUTTON.SAVE" text="저장" /></button>
			<button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
		</div>
	</div>
</div>