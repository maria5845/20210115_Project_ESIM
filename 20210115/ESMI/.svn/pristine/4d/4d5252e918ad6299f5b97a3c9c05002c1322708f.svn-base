<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<div class="m-form">
		<div class="in">

			<table id="hdrListSrch" class="inForm">
				<colgroup>
				<col width="170">
				<col width="250">
				<col width="170">
				<col width="250">
				<col width="*">
			</colgroup>
				<tbody>
					<tr>
<!-- 						<th scope="row" class="text-right"> -->
<%-- 							<label><spring:message code="TABLE.COLUMN.LANG_CD_NM" text="다국어 코드" /></label> --%>
<!-- 						</th> -->
<!-- 						<td> -->
<!-- 							<select id="lang_cd" name="lang_cd" style="width: 200px;"> -->
<%-- 								<option value=""><spring:message code="ETC.SELECTBOX.ALL" text="전체" /></option> --%>
<%-- 								<c:forEach items="${lang_cd_list}" var="i" > --%>
<%-- 								<option value="${i.cd}"> --%>
<%-- 									<c:out value="${i.cd_val}"></c:out> --%>
<!-- 								</option> -->
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
<!-- 						</td> -->
						
						<th scope="row" class="text-right">
							<label><spring:message code="TABLE.COLUMN.LANG_MSG_CD" text="다국어 메시지 코드" /></label>
						</th>
						<td>
							<input type="text" id="lang_msg_cd" name="lang_msg_cd" class="itx itx-x250"/>
						</td>
						
						<th scope="row" class="text-right">
							<label><spring:message code="TABLE.COLUMN.LANG_MSG_VAL" text="다국어 메시지 값" /></label>
						</th>
						<td>
							<input type="text" id="lang_msg_val" name="lang_msg_val" class="itx itx-x250"/>
						</td>
						
						<td>
							<button type="button" class="btn btn-srch btn-medium" id="kendoSearchBtn"
								onclick="ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), page: 1});">
								<spring:message code="BUTTON.SEARCH" text="조회" /></button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<div class="grid-wrap">
 		<div class="m-option top">
			<div class="fr">
				<button type="button" class="btn btn-add2 btn-medium btn-x60"
					onclick="javascript:ClPopup.fnOnClickModalOpen('/lang/langdetail.do', 'action_type=add');">
					<spring:message code="BUTTON.ADD" text="추가" />
				</button>
				
				<button type="button" class="btn btn-lg btn-medium btn-x120" onclick="javascript:fnApplyChangesLang();">
					<i class="fa fa-save"></i> <spring:message code="BUTTON.APPLYCHANGES" text="변경내용 적용" />
				</button>
			</div>
		</div>

		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		
		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
				onclick="javascript:ClPopup.fnOnClickModalOpen('/lang/langdetail.do', 'lang_msg_cd=#:lang_msg_cd#&action_type=modify');">
				<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>

			<button type="button" class="btn btn-grid-del btn-small" 
				onclick="javascript:ClCRUD.fnActionIt({selector: '\\#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/lang/langActionAjax.do'
				, param: 'action_type=delete&lang_msg_cd=#:lang_msg_cd#'});">
				<spring:message code="BUTTON.DELETE" text="삭제" /></button>
		</script>

	</div>
