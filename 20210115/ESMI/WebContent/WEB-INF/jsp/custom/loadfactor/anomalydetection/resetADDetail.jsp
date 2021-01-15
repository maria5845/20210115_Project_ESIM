<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
table .k-state-selected {
    background-color:#C40452 !important;
}
.k-grid tr.k-state-selected {
  background-color: #C40452 !important;
}
</style>
    
<div class="cont-header">
	<hgroup>
		<h1>Reset Date History</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post">
			<div class="pd-a13">
			<div id="grid_reset"></div>
			</div>
		</form>
	</div>
</div>

<div class="cont-foot">
	<div class="action hasMargin">
		<div class="fl">
		</div>
		<div class="fr">
			<button type="button" class="btn btn-lg btn-x90" 
				onclick="fnSearchIt();">
				<spring:message code="BUTTON.SEARCH" text="조회" /></button>
			<button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
		</div>
	</div>
</div>
