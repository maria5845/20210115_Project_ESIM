<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
		<h1>Menu</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post">
			<input type="hidden" name="action_type" id="action_type"  value="${action_type}" />
			<input type="hidden" id="before_disp_ord" name="before_disp_ord" value="${menu.disp_ord }" />
			<input type="hidden" id="p_menu_no" name="p_menu_no" value="${parentMenu == null ? '0' : parentMenu.menu_no }" />
			<input type="hidden" id="menu_depth" name="menu_depth" value="${parentMenu == null ? '1' : parentMenu.menu_depth + 1 }" />
			<input type="hidden" id="menu_no" name="menu_no" value="${menu.menu_no }" />
			<input type="hidden" id="gen_by" name="gen_by" value="<c:out value="${this_user_id}"></c:out>" />
			
			<div class="pd-a13">
			<table class="tb2">
				<colgroup>
					<col width="175px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="hasBg hasPad text-center">Registration Location</th>
						<td class="hasPad">
							<c:if test="${parentMenu == null }">
								Top Menu
							</c:if>
							<c:if test="${parentMenu != null }">
								<strong><c:out value="${parentMenu.menu_nm }"></c:out></strong> Sub Menu
							</c:if>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="hasBg hasPad text-center">
							<!-- 메뉴명 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-200" >
								<spring:message code="JS.DIV.TOOLTIP.MENU.DETAIL_MSG_CD" 
										text="사용자가 보는 메뉴의 이름입니다." />
								</span>
							</div>
							<spring:message code="TABLE.COLUMN.MENU_NM" text="메뉴 명" /><span class="red">*</span></th>
						<td class="hasPad">
							<input type="text" name="menu_nm" id="menu_nm"  value="<c:out value="${menu.menu_nm}"></c:out>"
							class="itx itx-p100" 
							maxlength="100" required/>
						</td>
<!-- 					</tr> -->
					
					<tr>
						<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.MENU_DESC" text="메뉴 설명" /></th>
						<td class="hasPad">
							<input type="text" name="menu_desc" id="menu_desc"  value="<c:out value="${menu.menu_desc}"></c:out>"
							class="itx itx-p100"
							maxlength="999" />
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="hasBg hasPad text-center">
							<!-- 대시보드 여부 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-280" >
								<spring:message code="JS.DIV.TOOLTIP.MENU.DSBD_MSG_CD" 
										text="해당 메뉴가 '레이아웃관리>대시보드관리'메뉴의<br>대시보드와 맵핑될지 여부입니다.<br>
								&nbsp;&nbsp;- '사용'일 경우 메뉴주소(URL)은 고정됩니다." />
								</span>
							</div>
							<spring:message code="TABLE.COLUMN.DSBD_SHOW_YN" text="대시보드 표출 여부" /></th>
						<td class="hasPad">
							<label class="radio">
								<input type="radio" name="dsbd_yn" value="Y" ${menu.menu_addr == '/layout/mvpage.do' ? 'checked' : ''}
								onclick="$('#menu_addr').val('/layout/mvpage.do');$('#menu_addr').attr('readonly', true);"
								>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="dsbd_yn" value="N" ${menu.menu_addr != '/layout/mvpage.do' ? 'checked' : ''}
								onclick="$('#menu_addr').val('');$('#menu_addr').removeAttr('readonly');"
								>
								<i></i>No</label>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="hasBg hasPad text-center">
							<!-- 메뉴 주소 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-280" >
								<spring:message code="JS.DIV.TOOLTIP.MENU.ADDR_MSG_CD" 
										text="대시보드 클릭 시 호출될 서버의 경로 값입니다." />
								</span>
							</div>
							<spring:message code="TABLE.COLUMN.MENU_ADDR" text="메뉴 주소" /><span class="red">*</span></th>
						<td class="hasPad">
							<input type="text" name="menu_addr" id="menu_addr"  value="<c:out value="${menu.menu_addr}"></c:out>"
							class="itx itx-p100" 
							${menu.menu_addr == '/layout/mvpage.do' ? 'readonly' : ''}
							maxlength="100" required/>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.DISP_ORD" text="표시 순서" /><span class="red">*</span></th>
						<td class="hasPad">
							<select name="disp_ord" id="disp_ord" style="width: 100%">
								<c:forEach var="i" begin="1" end="${cnt }" step="1">
									<option value="${i }" ${(menu == null && cnt == i) || (menu != null && menu.disp_ord == i) ? "selected='selected'" : "" }>${i }</option>
								</c:forEach>
							</select>
						</td>
					</tr>

					<tr>
						<th scope="row" class="hasBg hasPad text-center">
							<!-- 표출 여부 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-240" >
								<spring:message code="JS.DIV.TOOLTIP.MENU.SHOW_MSG_CD" 
										text="메뉴에서 해당 메뉴를 출력할지 여부입니다." />
								</span>
							</div>
							<spring:message code="TABLE.COLUMN.SHOW_YN" text="표출 여부" /><span class="red">*</span></th>
						<td class="hasPad">
							<label class="radio">
								<input type="radio" name="show_yn" value="Y" ${menu.show_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="show_yn" value="N" ${menu.show_yn == 'N' ? 'checked=checked' : ''}>
								<i></i>No</label>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.USE_YN" text="사용 여부" /><span class="red">*</span></th>
						<td class="hasPad">
							<label class="radio">
								<input type="radio" name="use_yn" value="Y" ${menu.use_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="use_yn" value="N" ${menu.use_yn == 'N' ? 'checked=checked' : ''}>
								<i></i>No</label>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="hasBg hasPad text-center">
							<!-- 로그 기록 여부 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-240" >
								<spring:message code="JS.DIV.TOOLTIP.MENU.RECORD_MSG_CD" 
										text="해당 메뉴의 접속기록을 관리할지 여부입니다." />
								</span>
							</div>
							<spring:message code="TABLE.COLUMN.LOG_RECORD_YN" text="로그 기록 여부" /><span class="red">*</span></th>
						<td class="hasPad">
							<label class="radio">
								<input type="radio" name="log_record_yn" value="Y" ${menu.log_record_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="log_record_yn" value="N" ${menu.log_record_yn == 'N' ? 'checked=checked' : ''}>
								<i></i>No</label>
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
		<div class="fl">
		</div>
		<div class="fr">
			<button type="button" class="btn btn-lg btn-x90" 
				onclick="javascript:ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/setting/menuActionAjax.do'
						, param: '#actionForm', validFnc: function(){return $('#actionForm').parsley().validate();}, mdClsBool: true,});">
				<spring:message code="BUTTON.SAVE" text="저장" /></button>
			<button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
		</div>
	</div>
</div>
