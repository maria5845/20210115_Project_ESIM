<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>

.k-autocomplete.k-state-default, .k-numeric-wrap.k-state-default, .k-picker-wrap.k-state-default{
	color: #fff !important;
}
</style>


<div class="cont-header">
	<hgroup>
	    <h1>Variable Rule Mng [${set_type}]</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->	
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
		
		
		<form id="actionForm" method="post">
			<input type="hidden" name="action_type" id="action_type" value="${action_type}" />
			<input type="hidden" name="set_type" id="set_type" value="${set_type}" />
			<input type="hidden" name="rule_seq" id="rule_seq" value="${bean.rule_seq}" />
			<table class="tb2">
				<colgroup>
					<col width="70px">
					<col width="130px">
					<col width="70px">
					<col width="130px">
				</colgroup>
				<tbody>
					<c:if test="${set_type eq 'SV' or set_type eq 'PV'}">
						<tr>
							<th><spring:message code='TABLE.COLUMN.VAR_ID' text='변수 ID' /></th>
							<td>
								<input id="var_id" style="width:100%;" >
	<!-- 							<select id="var_id" name="var_id" style="width: 100%"> -->
	<%-- 								<c:forEach items="${variable_list}" var="i"> --%>
	<%-- 									<option <c:if test="${bean.var_id eq i.var_id}">selected="selected"</c:if>> --%>
	<%-- 										${i.var_id} --%>
	<!-- 									</option>			 -->
	<%-- 								</c:forEach> --%>
	<!-- 							</select> -->
							</td>
						</tr>
					</c:if>
					<c:if test="${set_type eq 'CTQ'}">
						<tr>
							<th><spring:message code='TABLE.COLUMN.VAR_ID' text='변수 ID' /></th>
							<td>
								<select id="var_id" name="var_id">
									<option value="CPK">CPK</option>
									<option value="NG_RATE">NG_RATE</option>
	                     		</select>
							</td>
						</tr>
					</c:if>
					<c:if test="${set_type eq 'PV'}">
						<tr>
							<th><spring:message code='TABLE.COLUMN.BASED_VAR_ID' text='Based Variable ID' /></th>
							<td>
								<input id="based_var_id" name="based_var_id" style="width: 100%" >
<!-- 								<select id="based_var_id" name="based_var_id" style="width: 100%"> -->
<%-- 									<c:forEach items="${variable_list}" var="i"> --%>
<%-- 										<option <c:if test="${bean.based_var_id eq i.var_id}">selected="selected"</c:if>> --%>
<%-- 											${i.var_id} --%>
<!-- 										</option>			 -->
<%-- 									</c:forEach> --%>
<!-- 								</select> -->
							</td>
						</tr>
					</c:if>
					<tr>
						<th>Green</th>
						<td>
							<input type="number" name="green_min" id="green_min" class="itx itx-x100" placeholder="green_min"
									value="<c:out value="${bean.green_min}"></c:out>"
									maxlength="8"   step="0.001"
<%-- 									${set_type == 'PV' ? 'readonly' : ''} --%>
									data-parsley-errors-container="#green_min_number"/>
									~
							<input type="number" name="green_max" id="green_max" class="itx itx-x100" placeholder="green_max"
									value="<c:out value="${bean.green_max}"></c:out>"
									maxlength="8" required step="0.001"
									data-parsley-errors-container="#green_max_number"/>
						</td>
					</tr>
					<tr>
						<th>Yellow</th>
						<td>
							<input type="number" name="yellow_min" id="yellow_min" class="itx itx-x100" placeholder="yellow_min"
									value="<c:out value="${bean.yellow_min}"></c:out>"
									maxlength="8"  step="0.001"
<%-- 									${set_type == 'PV' ? 'readonly' : ''} --%>
									data-parsley-errors-container="#yellow_min_number"/>
									~
							<input type="number" name="yellow_max" id="yellow_max" class="itx itx-x100" placeholder="yellow_max"
									value="<c:out value="${bean.yellow_max}"></c:out>"
									maxlength="8"  required  step="0.001"
									data-parsley-errors-container="#yellow_max_number"/>
						</td>
					</tr>
					<tr>
						<th>Red</th>
						<td>
							<input type="number" name="red_min" id="red_min" class="itx itx-x100" placeholder="red_min" step="0.001"
									value="<c:out value="${bean.red_min}"></c:out>"
									maxlength="8"  
									data-parsley-errors-container="#red_min_number"/>
									~
							<input type="number" name="red_max" id="red_max" class="itx itx-x100" placeholder="red_max" step="0.001"
									value="<c:out value="${bean.red_max}"></c:out>"
									maxlength="8"  
<%-- 									${set_type == 'PV' ? 'readonly' : ''} --%>
									data-parsley-errors-container="#red_max_number"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
			
	</div>
</div>
<!-- // .cont-body -->

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
            <button type="button" class="btn btn-lg btn-x90" onclick="javascript:fnVarRuleAction();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>


