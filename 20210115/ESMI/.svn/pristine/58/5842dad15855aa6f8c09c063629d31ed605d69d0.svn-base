<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



	<div class="l-kendo-wrap override">

		<div class="l-notkendo-section">

			<div class="row">
			
				<!-- 좌측: 권한 그룹 목록 -->
				<div class="col fl b_tbl" style="width: 40%;">

					<div class="m-option top">
						<div class="fr">
							<button type="button" class="btn btn-add2 btn-medium btn-x60"
							onclick="javascript:ClPopup.fnOnClickModalOpen( '/setting/authgrdetail.do', 'action_type=add')">
							<spring:message code="BUTTON.ADD" text="추가" /></button>
						</div>
					</div>

					<div class="m-table">

						<div class="table-wrap">

							<table class="tb">
								<colgroup>
									<col width="46px">
									<col width="225px">
									<col width="255px">
									<col width="110px">
									<col width="180px">
									<col width="85px">
									<col width="85px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">&nbsp;</th>
										<th scope="col"><spring:message code="TABLE.COLUMN.AUTH_GR_NM" text="권한 그룹 명" /></th>
										<th scope="col"><spring:message code="TABLE.COLUMN.AUTH_GR_DESC" text="권한 그룹 설명" /></th>
										<th scope="col"><spring:message code="TABLE.COLUMN.AUTH_GR_HOME" text="홈 사용여부" /></th>
										<th scope="col"><spring:message code="TABLE.COLUMN.AUTH_GR_HOMENUM" text="홈 메뉴 번호" /></th>
										<th scope="col"><spring:message code="BUTTON.EDIT" text="수정" /></th>
										<th scope="col"><spring:message code="BUTTON.DELETE" text="삭제" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userAuthGroupList }" var="uagBean" varStatus="vs">
									<tr class="vertical-align-m height-26">
										<td class="text-center">
											<input type="radio" name="rperm" class="" value="${uagBean.auth_gr_no }"
											onclick="javascript:fnOnclickUserAuthGr(this, '${uagBean.auth_gr_nm }');" ${vs.first ? "checked" : "" }
											/>
										</td>
										<td>
											<c:out value="${uagBean.auth_gr_nm }"></c:out>
											<input name="auth_gr_no" type="hidden" value="${uagBean.auth_gr_no }" />
											<input name="menu_no" type="hidden" value="${uagBean.menu_no }" />
										</td>
										<td><c:out value="${uagBean.auth_gr_desc}"></c:out></td>
										<td class="text-center"><c:out value="${uagBean.home_yn}"></c:out></td>
										<td class="text-center"><c:out value="${uagBean.home_menu_no}"></c:out></td>
										<td class="text-center">
											<button type="button" class="btn btn-small btn-grid-edit"
											onclick="javascript:ClPopup.fnOnClickModalOpen( '/setting/authgrdetail.do', 'auth_gr_no=${uagBean.auth_gr_no}&action_type=modify', '600')">
											<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
										</td> 
										<td class="text-center">
											<button type="button" class="btn btn-grid-del btn-small"
											onclick="javascript: ClCRUD.fnActionIt({selector: '#grid', url: '/setting/getauthgrlistAjax.do', actionUrl: '/setting/authgrActionAjax.do'
 												, param: 'action_type=delete&auth_gr_no=${uagBean.auth_gr_no}'}); reload();">
											<spring:message code="BUTTON.DELETE" text="삭제" /></button>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				
				
				<!-- 우측: 메뉴 목록 -->
				<div id="authListWidget" class="col fr b_tbl" style="width: 59%">

					<div class="section-header">

						<div class="m-option top">

							<div class="fl">
								<h4 class="fw-600" id="leftAuthListText"></h4>
							</div>

							<div class="fr">
								<button type="button" class="btn btn-add2 btn-medium btn-x60" onclick="javascript:fnSaveUserAuthMenuMapp();"><spring:message code='BUTTON.SAVE' text='저장'/></button>
								<button type="button" class="btn btn-del btn-medium btn-x70" onclick="javascript:$('input[type=radio]:checked').click();"><spring:message code='BUTTON.CANCEL' text='취소'/></button>
							</div>

						</div>

					</div>

					<div class="ovf-y-scr" style="height: 745px !important;">

						<table class="tb">
							<colgroup>
								<col width="534px">
								<col width="467px">
								<col width="76px">
								<col width="45px">
							</colgroup>
						<thead>
							<tr>
								<th scope="col"><spring:message code="TABLE.COLUMN.MENU_NM" text="메뉴 명" /></th>
								<th scope="col"><spring:message code="TABLE.COLUMN.MENU_DESC" text="메뉴 설명" /></th>
								<th scope="col"><spring:message code="TABLE.COLUMN.MENU_DEPTH" text="메뉴 깊이" /></th>
								<th scope="col" onclick="fnCheckAll()">Authority</th>
								</tr>
							</thead>
							<tbody id="userAuthList"></tbody>
						</table>

					</div>

				</div>
			</div>
		</div>
	</div>
