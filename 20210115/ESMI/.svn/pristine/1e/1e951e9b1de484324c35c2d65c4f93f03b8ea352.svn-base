<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

			<div class="cont-header">
				<hgroup>
					<h1>User PW Change</h1>
				</hgroup>
				<button type="button" class="close-pop is-close">팝업 닫기</button>
			</div><!-- // .cont-header -->
			
			
			<div class="cont-body">
			
				<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
				<div class="tb-wrap">
			  		  		
					<form id="actionForm" method="POST">
						<div class="pd-a13">
							<table class="tb2">
								<colgroup>
									<col width="210px">
									<col width="">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="hasBg hasPad text-center">
											<spring:message code='TABLE.COLUMN.USER_ID' text='사용자 ID' />
										</th>
										<td class="hasPad">
											<input type="text" id="user_id" name="user_id" value="<c:out value="${idStr}"></c:out>"
												class="itx itx-p100" autocomplete="off"
												readonly required />
										</td>
									</tr>
									<tr>
										<th scope="row" class="hasBg hasPad text-center">
											<spring:message code='TABLE.COLUMN.USERPW_CHG' text='현재 비밀번호' />
										</th>
										<td class="hasPad">
											<input type="password" id="oldPwdStr" name="oldPwdStr" value="0000"
												class="itx itx-p100" autocomplete="off"
												minlength="4" maxlength="20"
												required readonly />
										</td>
									</tr>
									<tr>
										<th scope="row" class="hasBg hasPad text-center">
											<spring:message code='TABLE.COLUMN.USERPW' text='변경 비밀번호' />
										</th>
										<td class="hasPad">
											<input type="password" id="user_pwd" name="user_pwd" value=""
												class="itx itx-p100" autocomplete="off"  
												data-parsley-errors-container="#user_pwd_text" minlength="4" maxlength="20"
												required autofocus />
											<span id="user_pwd_text"></span>
										</td>
									</tr>
									<tr>
										<th scope="row" class="hasBg hasPad text-center">
											<spring:message code='TABLE.COLUMN.USERPW_CHK' text='변경 비밀번호 확인' />
										</th>
										<td class="hasPad">
											<input type="password" id="user_pwd2" name="user_pwd2" value=""
												class="itx itx-p100" autocomplete="off"
												minlength="4" maxlength="20" data-parsley-equalto="#user_pwd"
												required />
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
			
			
			<div class="cont-foot">
				<div class="action hasMargin">
					<div class="fr">
						<button type="button" class="btn btn-lg btn-x90" onclick="javascript:fnPwdChgAction();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
						<button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
					</div>
				</div>
			</div>
			

