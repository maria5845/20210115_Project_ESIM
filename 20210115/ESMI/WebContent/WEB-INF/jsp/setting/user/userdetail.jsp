<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>User</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<div id="tabstrip" style="height: 400px">
			<ul>
				<li class="k-state-active"><spring:message code='TABLE.COLUMN.USER_INFO' text='사용자 정보'/></li>
				<li><spring:message code='TAB.BUTTON.AUTHGROUP' text='권한 그룹'/></li>
<%-- 				<li><spring:message code='TAB.BUTTON.PIELIST' text='PIE 목록'/></li> --%>
			</ul>
			
			<!-- 탭 내부영역 -->
			<!-- 사용자정보 -->
			<div>
				<div class="pd-lr15">
					<form id="actionForm" method="post" action="">
						<input type="hidden" name="action_type" value="${action_type }" />
						
					    <table class="tb2" style="width: 100%;">
					    	<colgroup>
								<col width="140">
								<col>
							</colgroup>
							<tbody>
					    		<tr>
					        		<th scope="row"><spring:message code='TABLE.COLUMN.USER_NM' text='사용자 명'/><span class="red">*</span></th>
					        		<td>
					        			<input type="text" name="user_nm" id="user_nm" class="itx itx-p100" 
					        			value="<c:out value="${bean.user_nm}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.USER_NM' text='사용자 명'/>"
					        			maxlength="30" required 
					        			data-parsley-errors-container="#user_nm_text"/>
										<span id="user_nm_text"></span>
									</td>
					    		</tr>
					    		
					    		<tr>
					        		<th scope="row">
					        			<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc" style="width: 350px;">
											<spring:message code="JS.DIV.TOOLTIP.USER.ID_MSG_CD" 
											text="사용자 ID 규칙 : 영문, 숫자, 마침표(.)만 입력 가능합니다.<br/>(최소4 ~ 최대20자리)  
											${action_type eq 'add' ? '<br> - 사용자 추가시, 초기 비밀번호는 0000 입니다.' : ''}" />
											</span>
										</div>
					        			<spring:message code='TABLE.COLUMN.USER_ID' text='사용자 ID'/><span class="red">*</span></th>
					        		<td>
					        			<input type="text" name="user_id${action_type == 'modify' ? '1' : ''}" class="itx itx-p100" 
					        			value="${bean.user_id}" placeholder="<spring:message code='TABLE.COLUMN.USER_ID' text='사용자 ID'/>" ${action_type == 'modify' ? 'readonly' : ''} 
					        			pattern="^[A-Za-z0-9._]*$" data-parsley-minlength="4" maxlength="20" required 
					        			data-parsley-error-message="영문, 숫자, 마침표(.)만 입력 가능합니다.(최소4 ~ 최대20자리)"
					        			data-parsley-errors-container="#user_id_text" 
					        			/>
										<input type="hidden" name="user_id${action_type == 'modify' ? '' : '1'}" value="${bean.user_id}" />
										<span id="user_id_text"></span>
									</td>
					    		</tr>
					    		
					    		<tr id="pwd_div">
					        		<th scope="row"><spring:message code='TABLE.COLUMN.USER_PWD' text='사용자 비밀번호'/></th>
					        		<td>
					        			<input type="password" name="user_pwd" id="user_pwd" class="itx itx-p100" value="" placeholder="<spring:message code='TABLE.COLUMN.USER_PWD' text='사용자 비밀번호'/>"
					        			maxlength="20" 
					        			data-parsley-errors-container="#user_pwd_text" />
					        			<span id="#user_pwd_text"></span>
									</td>
					    		</tr>
					    		
					    		<tr id="pwd_cf_div">
					        		<th scope="row"><spring:message code='TABLE.COLUMN.USER_PWD_CHK' text='사용자 비밀번호 확인'/></th>
					        		<td>
					        			<input type="password" name="user_pwd_confirm" id="user_pwd_confirm" class="itx itx-p100" value="" placeholder="<spring:message code='TABLE.COLUMN.USER_PWD_CHK' text='사용자 비밀번호 확인'/>" 
					        			maxlength="20" 
					        			data-parsley-errors-container="#user_pwd_confirm_text"/>
					        			<span id="#user_pwd_confirm_text"></span>
									</td>
					    		</tr>
					    		
					    		<tr>
					        		<th scope="row"><spring:message code='CODE.NOTI_TYPE.EMAIL' text='E-Mail'/></th>
					        		<td>
					        			<input type="text" name="user_email" id="user_email" class="itx itx-p100" value="<c:out value="${bean.user_email}"></c:out>" placeholder="<spring:message code='CODE.NOTI_TYPE.EMAIL' text='E-Mail'/>" 
					        			data-parsley-type="email" maxlength="50" />
									</td>
					    		</tr>
					    		
					    		<tr>
					        		<th scope="row"><spring:message code='TABLE.COLUMN.MOBILE_TEL_NO' text='전화번호'/></th>
					        		<td>
					        			<input type="text" name="mobile_tel_no" id="mobile_tel_no" class="itx itx-p100" value="<c:out value="${bean.mobile_tel_no}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.MOBILE_TEL_NO' text='전화번호'/>"
					        			maxlength="20" />
									</td>
					    		</tr>
					    		
					    		<tr>
					        		<th scope="row"><spring:message code='TABLE.COLUMN.USER_DESC' text='사용자 설명'/></th>
					        		<td>
					        			<textarea rows="4" name="user_desc" class="itx itx-p100" placeholder="<spring:message code='TABLE.COLUMN.USER_DESC' text='사용자 설명'/>" maxlength="999" ><c:out value="${bean.user_desc}"></c:out></textarea>
									</td>
				    			</tr>
					    		
					    		<c:if test="${action_type == 'modify'}">
						    		<tr>
					        			<th scope="row"><spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/><span class="red">*</span></th>
				        				<td>
											<label class="radio">
												<input type="radio" name="use_yn" value="Y" ${bean.use_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
												<i></i>Yes</label>
											<label class="radio">
												<input type="radio" name="use_yn" value="N" ${bean.use_yn == 'N' ? 'checked=checked' : ''}>
											<i></i>No</label>
										</td>
					    			</tr>
					    		</c:if>
						    		
							</tbody>
						</table>
					</form>
				</div>
			</div> <!-- // 기본정보 -->
			<!-- 권한그룹 -->
			<div class="l-kendo-wrap override">
				<div class="grid-wrap mg-t20">
					<div id="grid_authgr"></div>
					<script id="pk-template-authgr" type="text/x-kendo-template">
						<input type="checkbox" value="#:auth_gr_no#" 
						# if(checked == 'true' ) { #checked# } #
						/>
					</script>
				</div>
			</div> <!-- // 권한그룹 -->
			<!-- 트리 매핑 -->
			<div class="l-kendo-wrap override">
				<div class="grid-wrap mg-t20">
					<div id="grid_pielist"></div>
					<script id="pk-template-pielist" type="text/x-kendo-template">
						<input type="checkbox" value="#:pie_id#" 
						# if(checked == 'true' ) { #checked# } #
						/>
					</script>
				</div>
			</div> <!-- // 트리 매핑 -->
		</div>
	</div>
</div>

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
        	<button type="button" class="btn btn-lg btn-x90" onclick="javascript:fnUserAction();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>

