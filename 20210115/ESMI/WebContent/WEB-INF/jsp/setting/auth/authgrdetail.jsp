<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1><spring:message code='TAB.BUTTON.AUTHGROUP' text='권한 그룹'/></h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div>
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post" action="${rootPath}/setting/authgrActionAjax.do">
		
			<input type="hidden" name="auth_gr_no" id="auth_gr_no" value="${bean.auth_gr_no == null || bean.auth_gr_no == '' ? 0 : bean.auth_gr_no}" />
			<input type="hidden" name="action_type" id="action_type"  value="${action_type}" />
			
		    <!-- 팝업 테이블 (s) -->
		    <div class="pd-a13">
		    <table class="tb2">
		    	<colgroup>
					<col width="190">
					<col>
				</colgroup>
				<tbody>
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">
							<!-- 권한 그룹명 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-200" >
								<spring:message code="JS.DIV.TOOLTIP.AUTHNM_MSG_CD" 
										text="추가될 권한 그룹의 이름입니다." />
								</span>
							</div>
		        			<spring:message code='TABLE.COLUMN.AUTH_GR_NM' text='권한 그룹 명'/><span class="red">*</span></th>
		        		<td class="hasPad">
							<input type="text" name="auth_gr_nm" id="auth_gr_nm_modal"  value="<c:out value="${bean.auth_gr_nm}"></c:out>" 
							class="itx itx-p100" 
							maxlength="100" required/>
						</td>
		    		</tr>
		    		
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.AUTH_GR_DESC' text='권한 그룹 설명'/></th>
		        		<td class="hasPad">
							<input type="text" name="auth_gr_desc" id="auth_gr_desc_modal"  value="<c:out value="${bean.auth_gr_desc}"></c:out>"
							class="itx itx-p100" maxlength="199" />
						</td>
		    		</tr>

					<tr>
	        			<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/><span class="red">*</span></th>
        				<td class="hasPad">
							<label class="radio">
								<input type="radio" name="use_yn" 
								<c:if test="${action_type != 'add'}">
									onclick="groupCheck(this);" 
								</c:if>
								value="Y" ${bean.use_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="use_yn" 
								<c:if test="${action_type != 'add'}">
									onclick="groupCheck(this);" 
								</c:if>
								value="N" ${bean.use_yn == 'N' ? 'checked=checked' : ''}>
							<i></i>No</label>
						</td>
	    			</tr>
		    		
		    		<c:if test="${action_type != 'add'}">
	    			<tr id="homeyn">
	        			<th scope="row" class="hasBg hasPad text-center">
	        				<!-- 홈 여부 Tooltip -->
        					<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-200" >
								<spring:message code="JS.DIV.TOOLTIP.HOMEUSE_MSG_CD" 
										text="다시 로그인을 했을시 home 화면을 우선적으로 보여줍니다." />
								</span>
							</div>
	        				Home Use<span class="red">*</span>
        				</th>
        				<td class="hasPad">
							<label class="radio">
								<input type="radio" name="home_yn" value="Y" ${bean.home_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="home_yn" value="N" ${bean.home_yn == 'N' ? 'checked=checked' : ''}>
							<i></i>No</label>
						</td>
	    			</tr>
		    		<tr id="menuno">
	        			<th scope="row" class="hasBg hasPad text-center">
	        				<!-- 홈 번호 Tooltip -->
        					<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-200" >
									<spring:message code="JS.DIV.TOOLTIP.HOMEMENUNUM_MSG_CD" 
										text="Home 화면에 표시될 메뉴 번호를 선택합니다." />
								</span>
							</div>
							<spring:message code='TABLE.COLUMN.MENU_NM' text='메뉴 명'/><span class="red">*</span>
						</th>
        				<td class="hasPad">
							<input id="pMenuSel" required
							data-parsley-error-message="먼저 우측에서 권한 저장 후 메뉴를 선택하세요." data-parsley-errors-container="#msg_menu1"//>
							<span id="msg_menu1"></span>
							<input id="menuSel" name="home_menu_no" required 
							data-parsley-error-message="먼저 우측에서 권한 저장 후 메뉴를 선택하세요." data-parsley-errors-container="#msg_menu2"/>
							<span id="msg_menu2"></span>
						</td>
	    			</tr>
	    			</c:if>
				</tbody>
			</table>
			</div>
			<!-- 팝업 테이블 (e) -->
			
		</form>
	</div>
</div>

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
            <button type="button" class="btn btn-lg btn-x90" onclick="javascript:submitCheck();"><spring:message code='BUTTON.SAVE' text='저장'/></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code='BUTTON.CANCEL' text='취소'/></button>
        </div>
    </div>
</div>
