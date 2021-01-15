<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<div class="m-form">
		<div class="in">
			<spring:message code="TITLE.PIE.MNG" text="PIE 관리" />
		</div>
	</div>

	<div class="grid-wrap">
 		<div class="m-option top">
			<div class="fr">
				<button type="button" class="btn btn-add2 btn-medium btn-x60"
					onclick="javascript:ClPopup.fnOnClickModalOpen('/setting/pieDetail.do', 'action_type=add', 700);">
					<spring:message code="BUTTON.ADD" text="추가" />
				</button>
			</div>
		</div>

		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		
		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
				onclick="javascript:ClPopup.fnOnClickModalOpen('/setting/pieDetail.do', 'pie_seq=#:pie_seq#&pie_id=#:pie_id#&action_type=modify', 700);">
				<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>

			<button type="button" class="btn btn-grid-del btn-small" 
				onclick="javascript:ClCRUD.fnActionIt({selector: '\\#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/setting/pieActionAjax.do'
				, param: 'action_type=delete&pie_seq=#:pie_seq#&pie_id=#:pie_id#'});">
				<spring:message code="BUTTON.DELETE" text="삭제" /></button>
		</script>

	</div>
