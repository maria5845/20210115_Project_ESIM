<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>Noti Mng</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap hasMargin">
	
		<form id="actionForm" method="post">
			<input type="hidden" name="action_type" id="action_type"  value="${action_type}" />
			<input type="hidden" name="noti_seq" id="noti_seq"  value="${bean.noti_seq}" />
			
			<table class="tb2" style="width: 100%;">
				<colgroup>
					<col width="120px">
					<col width="">
				</colgroup>
				<tbody>
					<tr>	
						<th scope="row"><spring:message code='TABLE.COLUMN.NOTI_TYPE' text='통지 타입' /><span class="red">*</span></th>
						<td>
							<select id="noti_type" name="noti_type" style="width: 50%">
								<c:forEach items="${noti_type_list}" var="i">
						  		<option value="${i.cd}" id="${i.cd}" 
						  			${(action_type == 'modify' && bean.noti_type == i.cd) ? 'selected' : '' }>
						  			<c:out value="${i.cd_val}"></c:out>
						  		</option>
						  		</c:forEach>
							</select>
						</td>
					</tr>
					<tr>	
						<th scope="row">
							<!-- 통지명 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-200" >
								<spring:message code='JS.DIV.TOOLTIP.NOTINM_MSG_CD' text='통지정보를 구분할 이름입니다.' />
								</span>
							</div>
							<spring:message code='TABLE.COLUMN.NOTI_NM' text='통지 명' /><span class="red">*</span></th>
						<td>
							<input type="text" name="noti_nm" id="noti_nm" class="itx itx-p100"
							value="<c:out value="${bean.noti_nm}"></c:out>" 
							required
							data-parsley-errors-container="#noti_nm_text"/>
							<span id="noti_nm_text"></span>
						</td>
					</tr>
					<tr>	
						<th scope="row">
							<!-- 속성1 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-320" >
								<spring:message code='JS.DIV.TOOLTIP.NOTIATTR1_MSG_CD' text='속성1 은 통지 유형에 따라 해당하는 값을 입력합니다.
								<br>&nbsp;- E-Mail : 발신자' />
								
								</span>
							</div>
							<spring:message code='TABLE.COLUMN.NOTI_ATTR_1' text='통지 속성 1' /><span class="red">*</span></th>
						<td>
							<input type="email" name="noti_attr_1" id="noti_attr_1" class="itx itx-p100"
							value="<c:out value="${bean.noti_attr_1}"></c:out>" 
							required
							data-parsley-type="email"
							data-parsley-errors-container="#noti_attr_1_text"/>
							<span id="noti_attr_1_text"></span>
						</td>
					</tr>
					<tr>	
						<th scope="row">
							<!-- 속성2 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-320" >
								<spring:message code='TABLE.COLUMN.NOTI_ATTR_2' text='속성2 은 통지 유형에 따라 해당하는 값을 입력합니다.
								<br>&nbsp;- E-Mail : E-Mail 제목' />
								
								</span>
							</div>
							<spring:message code='TABLE.COLUMN.NOTI_ATTR_2' text='통지 속성 2' /><span class="red">*</span></th>
						<td>
							<input type="text" name="noti_attr_2" id="noti_attr_2" class="itx itx-p100"
							value="<c:out value="${bean.noti_attr_2}"></c:out>" 
							required
							data-parsley-errors-container="#noti_attr_2_text"/>
							<span id="noti_attr_2_text"></span>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="l-kendo-wrap override">
				<div style="margin: 5px 0"><spring:message code='TAB.BUTTON.NOTITARGET' text='통지 대상' /></div>
				<div id="grid"></div>
				<script id="pk-template-load" type="text/x-kendo-template">
					<input type="checkbox" value="#:user_id#"
					# if(checked == 'true' ) { #
						#='checked'#
					# } #
					/>
				</script>
			</div>
		</form>
	</div>
</div>
<!-- // .cont-body -->

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
            <button type="button" class="btn btn-lg btn-x90" onclick="javascript:alertAndModifyMenu();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>


