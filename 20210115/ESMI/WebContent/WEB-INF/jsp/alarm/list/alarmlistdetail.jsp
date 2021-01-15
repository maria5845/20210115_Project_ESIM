<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>Alarm List</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post">
			<input type="hidden" name="action_type" id="action_type"  value="${action_type}" />
			<input type="hidden" name="alarm_seq" id="alarm_seq"  value="${bean.alarm_seq}" />
			<input type="hidden" name="alarm_seq_str" id="alarm_seq_str"  value="${bean.alarm_seq_str}" />
			<input type="hidden" name="org_alarm_state" id="org_alarm_state"  value="${bean.alarm_state}" />
			
			<div class="pd-a13">
			<table class="tb2" style="width: 100%;">
				<colgroup>
					<col width="150px">
					<col width="">
				</colgroup>
				<tbody>
					<c:if test="${action_type ne 'modify_batch' }">
						<tr>
							<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.ALARM_RULE_NM' text='알람 규칙 명' /></th>
							<td class="hasPad">
								<c:out value="${bean.alarm_rule_nm}"></c:out>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.ALARM_LVL' text='알람 레벨' /></th>
							<td class="hasPad">
								<c:out value="${bean.alarm_lvl_nm}"></c:out>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.ALARM_DATA_VAL' text='알람 데이터 값' /></th>
							<td class="hasPad">
								<c:out value="${bean.alarm_data_val}"></c:out>
							</td>
						</tr>
					</c:if>
					<tr>	
						<th scope="row" class="hasBg hasPad text-center">
							<!-- 알람 상태 Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-320" >
								<spring:message code='JS.DIV.TOOLTIP.ALARMST_MSG_CD' text='알람이 현재 발생상태인지 해결상태인지 선택합니다.' />
								</span>
							</div>
							<spring:message code='TABLE.COLUMN.ALARM_STATE' text='알람 상태' /><span class="red">*</span></th>
						<td class="hasPad">
							<select id="alarm_state" name="alarm_state" style="width: 50%">
								<c:forEach items="${alarm_state_list}" var="i">
						  		<option value="${i.cd}" id="${i.cd}" 
						  			${(action_type == 'modify' && bean.alarm_state == i.cd) ? 'selected' : '' }>
						  			<c:out value="${i.cd_val}"></c:out>
						  		</option>
						  		</c:forEach>
							</select>
						</td>
					</tr>
					<tr>	
						<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.CNFRM_MSG' text='확인 메시지' /><span class="red">*</span></th>
						<td class="hasPad">
							<input type="text" name="cnfrm_msg" id="cnfrm_msg" class="itx itx-p100"
							value="<c:out value="${bean.cnfrm_msg}"></c:out>" 
							required
							data-parsley-errors-container="#cnfrm_msg_text"/>
							<span id="cnfrm_msg_text"></span>
						</td>
					</tr>
					
				</tbody>
			</table>
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
            <button type="button" class="btn btn-lg btn-x90" 
            	onclick="javascript:ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/alarm/alarmlistActionAjax.do'
        		, cnfrmMsg: fnGetCnfrmMsgAlarm()
        		, param: '#actionForm', validFnc: function(){return $('#actionForm').parsley().validate();}, mdClsBool: true,});"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>
