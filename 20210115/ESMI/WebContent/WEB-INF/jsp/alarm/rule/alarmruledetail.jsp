<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="cont-header">
	<hgroup>
	    <h1>Alarm Rule Mng</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->	
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post">
			<input type="hidden" name="action_type" id="action_type"  value="${action_type}" />
			<input type="hidden" name="alarm_rule_seq" id="alarm_rule_seq"  value="${bean.alarm_rule_seq}" />
			
			<div id="alarmTabstrip" style="height: 526px;">
				<ul>
					<li class="k-state-active"><spring:message code='TAB.BUTTON.BASEINFO' text='기본정보' /></li>
					<li><spring:message code='TAB.BUTTON.TARGETDEVICE' text='대상 장치' /></li>
					<li><spring:message code='TAB.BUTTON.TARGETVARIABLE' text='대상 수집항목' /></li>
					<li><spring:message code='TAB.BUTTON.NOTITARGET' text='통지 대상' /></li>
					<li><spring:message code='TAB.BUTTON.CEPQUERY' text='CEP 쿼리' /></li>
				</ul>
				
				<!-- 탭 내부영역 -->
				<!-- 기본정보 -->
				<div>
					<div>
						<table class="tb2" style="width: 100%;">
							<colgroup>
								<col width="130px">
								<col width="220px">
								<col width="240px">
								<col width="">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><spring:message code='TABLE.COLUMN.ALARM_RULE_NM' text='알람 규칙 명' /><span class="red">*</span></th>
									<td colspan="3">
										<input type="text" name="alarm_rule_nm" id="alarm_rule_nm" class="itx itx-p100" placeholder="<spring:message code='TABLE.COLUMN.ALARM_RULE_NM' text='알람 규칙 명' />"
										value="<c:out value="${bean.alarm_rule_nm}"></c:out>"
										maxlength="30" required 
										data-parsley-errors-container="#alarm_rule_nm_text"/>
										<span id="alarm_rule_nm_text"></span>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><spring:message code='TABLE.COLUMN.ALARM_TYPE' text='알람 타입' /><span class="red">*</span></th>
									<td colspan="3">
										<select id="alarm_type" name="alarm_type" style="width: 30%" onchange="fnChangeAlarmTypeAction();">
											<c:forEach items="${alarm_type_list}" var="i">
									  		<option value="${i.cd}" id="${i.cd}" 
									  			${(action_type == 'modify' && bean.alarm_type == i.cd) ? 'selected' : '' }>
									  			
									  			<c:out value="${i.cd_val}"></c:out>
									  		</option>
									  		</c:forEach>
										</select>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><spring:message code='TABLE.COLUMN.ALARM_MSG' text='알람 메시지' /><span class="red">*</span></th>
									<td colspan="3">
										<input type="text" name="alarm_msg" id="alarm_msg" class="itx itx-p100" placeholder="<spring:message code='TABLE.COLUMN.ALARM_MSG' text='알람 메시지' />"
										value="<c:out value="${bean.alarm_msg}"></c:out>"
										maxlength="1000" required 
										data-parsley-errors-container="#alarm_msg_text"/>
										<span id="alarm_msg_text"></span>
									</td>
								</tr>

								<tr id="at_lmt">
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320" >
											<spring:message code='JS.DIV.TOOLTIP.ALARMTERM_MSG_CD' text='알람이 발생할 조건을 정의합니다.<br/>
											Duration을 지정시 해당 시간(초) 동안 조건이 충족되어야 알람이 발생합니다. <br/>
											(0 또는 공란으로 기입시 지속시간 체크는 하지 않습니다.)' />
											</span>
										</div>
										<spring:message code='TABLE.COLUMN.CHKTERM' text='체크 조건' /><span class="red">*</span></th>
									<td colspan="3">
										<select id="chk_attr_1" name="chk_attr_1" style="width: 18%">
											<c:forEach items="${sv_condition_list}" var="i">
									  		<option value="${i.cd}" 
									  			${(action_type == 'modify' && bean.chk_attr_1 == i.cd) ? 'selected' : '' }>
									  			<c:out value="${i.cd_val}"></c:out>
									  		</option>
									  		</c:forEach>
										</select>
										<input type="number" name="chk_data_1" id="chk_data_1" class="itx itx-x100" placeholder="Condition1"
										value="<c:out value="${bean.chk_data_1}"></c:out>"
										maxlength="8"  
										data-parsley-errors-container="#chk_data_1_text"/>
										
										AND
										
										<select id="chk_attr_2" name="chk_attr_2" onchange="fnOnchangeChkAttr2(this);" style="width: 18%">
											<option value="">Not used</option>
											<c:forEach items="${sv_condition_list}" var="i">
									  		<option value="${i.cd}" 
									  			${(action_type == 'modify' && bean.chk_attr_2 == i.cd) ? 'selected' : '' }>
									  			<c:out value="${i.cd_val}"></c:out>
									  		</option>
									  		</c:forEach>
										</select>
										<input type="number" name="chk_data_2" id="chk_data_2" class="itx itx-x100" placeholder="Condition2"
										value="<c:out value="${bean.chk_data_2}"></c:out>"
										maxlength="8" ${empty bean.chk_attr_2 ? 'disabled' : ''}
										data-parsley-errors-container="#chk_data_1_text"/>
										
										During
										<input type="number" name="chk_duration" id="chk_duration" class="itx itx-x100" placeholder="Duration Time"
										value="<c:out value="${bean.chk_duration}"></c:out>"
										maxlength="5"
										style="width:85px;"
										data-parsley-errors-container="#chk_data_1_text"/>(sc)
										
										<span id="chk_data_1_text"></span>
									</td>
								</tr>
								
								<tr id="at_noreceive">
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320" >
											<spring:message code='JS.DIV.TOOLTIP.ALARMCD_MSG_CD' text='알람이 발생할 조건을 정의합니다.' />
											</span>
										</div>
										<spring:message code='TABLE.COLUMN.CHKTERM' text='체크 조건' /><span class="red">*</span></th>
									<td colspan="3">
										<select id="chk_attr_3" name="chk_attr_3" style="width: 30%">
											<c:forEach items="${tm_condition_list}" var="i">
									  		<option value="${i.cd}" id="${i.cd}" 
									  			${(action_type == 'modify' && bean.chk_attr_1 == i.cd) ? 'selected' : '' }>
									  			<c:out value="${i.cd_val}"></c:out>
									  		</option>
									  		</c:forEach>
										</select>
<!-- 										<input type="number" name="chk_data_3" id="chk_data_3" class="itx itx-x200" placeholder="알람 체크 데이터" -->
<%-- 										value="<c:out value="${bean.chk_data_2}"></c:out>" --%>
<!-- 										maxlength="8"   -->
<!-- 										data-parsley-errors-container="#chk_data_2_text"/> -->
<!-- 										<span id="chk_data_2_text"></span> -->
									</td>
								</tr>
								
								<tr>
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320" >
											<spring:message code='JS.DIV.TOOLTIP.CHKTIME_MSG_CD' text='해당 알람건을 체크할 시간을 설정합니다.<br>설정 시 해당 시간 내에서만 알람조건을 체크합니다.' />
											</span>
										</div>
										<spring:message code='TABLE.COLUMN.CHKTIME' text='체크 시간' /><span class="red">*</span></th>
									<td colspan="3">
										<select id="chk_tm_yn" name="chk_tm_yn" style="width: 130px" onchange="fnShowTimeInput();">
											<option value="N" ${(action_type == 'modify' && bean.chk_tm_yn == 'N') ? 'selected' : '' } >Yes</option>
											<option value="Y" ${(action_type == 'modify' && bean.chk_tm_yn == 'Y') ? 'selected' : '' } >No</option>
										</select>
										<div id="tm_input_div" class="fr" style="width: 300px; ${(action_type == 'modify' && bean.chk_tm_yn == 'N') ? 'display: none;' : '' }">
											<input name="chk_start_tm" id="chk_start_tm" class="itx itx-x130" data-role="datepicker" type="text" class="k-input" role="combobox" aria-expanded="false" aria-owns="chk_start_tm_dateview" aria-disabled="false">
											 ~ 
											<input name="chk_finish_tm" id="chk_finish_tm" class="itx itx-x130" data-role="datepicker" type="text" class="k-input" role="combobox" aria-expanded="false" aria-owns="chk_finish_tm_dateview" aria-disabled="false">
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><spring:message code='TABLE.COLUMN.ALARM_LVL' text='알람 레벨' /></th>
									<td>
										<select id="alarm_lvl" name="alarm_lvl">
											<c:forEach items="${alarm_lvl_list}" var="i">
									  		<option value="${i.cd}" id="${i.cd}" 
									  			${(action_type == 'modify' && bean.alarm_lvl == i.cd) ? 'selected' : '' }>
									  			<c:out value="${i.cd_val}"></c:out>
									  		</option>
									  		</c:forEach>
										</select>
									</td>
									
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320" >
											<spring:message code='JS.DIV.TOOLTIP.ALARMSTATE_MSG_CD' text='알람이 발생 시 상태 값을 정의합니다.<br>"해결상태"는 알람이 해결된 상태를 의미합니다.' />
											</span>
										</div>
										<spring:message code='TABLE.COLUMN.ALARM_STATE' text='알람 상태' /></th>
									<td>
										<select id="alarm_state" name="alarm_state">
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
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320" >
											<spring:message code='JS.DIV.TOOLTIP.ALARMINTERVAL_MSG_CD' text='알람이 발생 시 알람 간격동안은 동일 알람이 발생되지 않습니다.' />
											</span>
										</div>
										<spring:message code='TABLE.COLUMN.ALARM_INTERVAL' text='알람 간격' /></th>
									<td>
										<select id="alarm_interval" name="alarm_interval">
											<c:forEach items="${tm_condition_list}" var="i">
									  		<option value="${i.cd}" id="${i.cd}" 
									  			${(action_type == 'modify' && bean.alarm_interval == i.cd) ? 'selected' : '' }>
									  			<c:out value="${i.cd_val}"></c:out>
									  		</option>
									  		</c:forEach>
										</select>
									</td>
									
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320">
											<spring:message code='JS.DIV.TOOLTIP.BEEPTIME_MSG_CD' text='해당 알람이 발생하였을 경우 해당 시간동안<br>경고음을 발생 시킵니다.(단위 : 초)<br/>
											&nbsp;&nbsp;- 0 입력 시 알람이 발생하지 않습니다.' />
											
											</span>
										</div>
										<spring:message code='TABLE.COLUMN.BEEPTIME' text='경고음 발생 시간' /></th>
									<td>
										<input type="number" name="beep_sec" id="beep_sec" class="itx itx-p90" placeholder="<spring:message code='TABLE.COLUMN.BEEPTIME' text='경고음 발생 시간' />"
										value="<c:out value="${bean.beep_sec}"></c:out>"
										maxlength="8"  
										data-parsley-errors-container="#beep_sec_text"/>
										<span id="beep_sec_text"></span>
									</td>
								</tr>
								
								<tr>
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320" >
											<spring:message code='JS.DIV.TOOLTIP.TRGTDVC_MSG_CD' text='항상 모든 장치를 대상으로 할지 여부입니다.<br>"미사용"일 경우 대상장치 탭에서 장치를 선택해주세요.' />
											</span>
										</div>
										<spring:message code='TAB.BUTTON.TARGETDEVICE' text='대상 장치' /></th>
									<td>
										<select id="tot_dvc_yn" name="tot_dvc_yn" onchange="fnTabChange('dvc');">
											<option value="Y" ${(action_type == 'modify' && bean.tot_dvc_yn == 'Y') ? 'selected' : '' } ><spring:message code="TABLE.COLUMN.ALLDVC" text="전체 장치" /></option>
											<option value="N" ${(action_type == 'modify' && bean.tot_dvc_yn == 'N') ? 'selected' : '' } ><spring:message code="TABLE.COLUMN.DESIGNDVC" text="지정" /></option>
										</select>
									</td>
									<th scope="row">
										<!-- Tooltip -->
										<div class="tooltipOuter">
											<i class="fa fa-question-circle"></i>
											<span class="tooltipDesc wd-320" >
											<spring:message code='JS.DIV.TOOLTIP.NOTI_MSG_CD' text='알람이 발생한 사실을 통지(E-Mail 등)할지 여부입니다.<br>"사용"시 통지대상 탭에서 통지대상정보를 선택해주세요.' />
											</span>
										</div>
										<spring:message code='TABLE.COLUMN.NOTI_YN' text='통지 여부' /></th>
									<td>
										<select id="noti_yn" name="noti_yn" onchange="fnTabChange('noti');">
											<option value="Y" ${(action_type == 'modify' && bean.noti_yn == 'Y') ? 'selected' : '' } >Yes</option>
											<option value="N" ${(action_type == 'add' || bean.noti_yn == 'N') ? 'selected' : '' } >No</option>
										</select>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부' /></th>
									<td colspan="3">
										<select id="use_yn" name="use_yn">
											<option value="Y" ${(action_type == 'modify' && bean.use_yn == 'Y') ? 'selected' : '' } >Yes</option>
											<option value="N" ${(action_type == 'modify' && bean.use_yn == 'N') ? 'selected' : '' } >No</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div> <!-- // 기본정보 -->
				<!-- 대상장치 -->
				<div class="l-kendo-wrap override">
					<div class="grid-wrap mg-t20">
						<div id="load_grid"></div>
						<script id="pk-template-load" type="text/x-kendo-template">
							<input type="checkbox" value="#:dvc_id#" name="dvc_id"
							# if(checked == 'true' ) { #
								#='checked'#
							# } #
							/>
						</script>
					</div>
				</div> <!-- // 대상장치 -->
				<!-- 대상수집항목 -->
				<div class="l-kendo-wrap override">
					<div class="grid-wrap mg-t20">
						<div id="variable_grid"></div>
<!-- 							<input type="checkbox" value="#:var_id#" /> -->
						<script id="pk-template-variable" type="text/x-kendo-template">
							<input type="checkbox" value="#:var_id#" name="var_id"
							# if(checked == 'true' ) { #
								#='checked'#
							# } #
							/>
						</script>
					</div>
				</div> <!-- // 대상수집항목 -->
				<!-- 통지대상 -->
				<div class="l-kendo-wrap override">
					<div class="grid-wrap mg-t20">
						<div id="noti_grid"></div>
						<script id="pk-template-noti" type="text/x-kendo-template">
							<input type="checkbox" value="#:noti_seq#" name="noti_seq"
							# if(checked == 'true' ) { #
								#='checked'#
							# } #
							/>
						</script>
					</div>
				</div> <!-- // 통지대상 -->
				<!-- CEP 쿼리 -->
				<div class="l-kendo-wrap override">
<div id="editor" style="width:100%; height:525px;"></div>
<textarea id="cep_str" name="cep_str" style="width:100%; height:525px;display:none;"><c:if test="${action_type eq 'modify'}"
><c:out value="${bean.cep_str}"></c:out></c:if><c:if test="${action_type ne 'modify'}">
-- Pre defined stream(do not remove this comment)
-- define stream inputStream(dvc_id string, var_id string, data_val double, data_tm string, timestamp long);
-- define stream alarmStream(dvc_id string, var_id string, alarm_val double);

-- 예제)  
-- PUMP01, PUMP02 설비 중 모든 수집항목에 대해서 
-- 5초 이내(sliding)의 누적값이 500이 넘으면 알람을 발생시킨다!!!
-- 모든 결과는 alarmStream으로 반환되어야 알람이 발생함.

/*
@info(name = 'query1')
from inputStream#window.timeBatch(5 sec)
on dvc_id = 'PUMP01' or dvc_id = 'PUMP02'
select dvc_id, var_id , sum(data_val) as alarm_val 
group by dvc_id, var_id
having alarm_val > 500 
insert into alarmStream
;
*/

-- query here

</c:if></textarea>
				</div> <!-- // CEP 쿼리 -->
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
            <button type="button" class="btn btn-lg btn-x90" onclick="javascript:fnApplyEditor();fnAlarmRuleAction();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>



<!-- CEP query 에디터  -->
<style type="text/css" media="screen">


</style>