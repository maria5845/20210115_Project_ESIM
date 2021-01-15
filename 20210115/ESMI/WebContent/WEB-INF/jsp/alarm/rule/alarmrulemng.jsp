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
            		<col width="100">
            		<col width="200">
            		<col width="120">
            		<col width="200">
            		<col width="60">
            		<col width="100">
            		<col width="*">
            	</colgroup>
                <tbody>
                	<tr>
	                    <th scope="row" class="text-right">
	                        <label for="alarm_type"><spring:message code="TABLE.COLUMN.ALARM_TYPE" text="알람 타입" /></label>
	                    </th>
	                    <td>
	                    	<select id="alarm_type" name="alarm_type" class="wd-180">
								<option value=""><spring:message code="ETC.SELECTBOX.ALL" text="전체" /></option>
								<c:forEach items="${alarm_type_list }" var="i">
									<option value="${i.cd }"><c:out value="${i.cd_val }"></c:out></option>
								</c:forEach>
	                    	</select>
	                    </td>
                    	<th scope="row" class="text-right">
                        	<label for="alarm_rule_nm"><spring:message code="TABLE.COLUMN.ALARM_RULE_NM" text="알람 규칙 명" /></label>
                    	</th>
                     	<td>
                     		<input type="text" id="alarm_rule_nm" name="alarm_rule_nm" class="itx itx-x180"/>
		             	</td>
	                	<th scope="row" class="text-right">
                        	<label for="dvc_id">Device</label>
                    	</th>
                     	<td>
                     		<input type="text" id="dvc_id" name="dvc_id" class="itx itx-x180"/>
		             	</td>

	                    <td>
            				<button type="button" class="btn btn-srch btn-medium" id="kendoSearchBtn" 
            					onclick="ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), page: 1});"><spring:message code="BUTTON.SEARCH" text="조회" /></button>
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
					onclick="javascript:ClPopup.fnOnClickModalOpen('/alarm/alarmruledetail.do', 'action_type=add', '1000');">
					<spring:message code="BUTTON.ADD" text="추가" /></button>
					
				<button type="button" class="btn btn-lg btn-medium btn-x150" onclick="javascript:fnReloadAlarmAgent();">
        			<i class="fa fa-power-off"></i> <spring:message code="BUTTON.RELOADALARMAGENT" text="알람 엔진(Agent) 설정 Reload" />
				</button>
				<button type="button" class="btn btn-lg btn-medium btn-x150" onclick="javascript:fnBeepSuspendAlarmAgent(this);">
        			<i class="fa fa-volume-up"></i> <spring:message code="BUTTON.SUSPENDALARMBEEP" text="알람 경고음 중지" />
				</button>
				<button type="button" class="btn btn-medium btn-excel" 
					onclick="fnExportExcel();"> Excel Export
				</button>
				
<!-- 				<button type="button" class="btn btn-cancel2 btn-medium btn-x140" -->
<!-- 					onclick="javascript:ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/layout/dtsrcActionAjax.do', param: 'action_type=delete'});"> -->
<!-- 					삭제</button> -->
			</div>
		</div>

		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		<script id="pk-template" type="text/x-kendo-template">
		</script>

		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
			onclick="javascript:ClPopup.fnOnClickModalOpen('/alarm/alarmruledetail.do', 'action_type=modify&alarm_rule_seq=#:alarm_rule_seq#', '1000');">
			<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>

			<button type="button" class="btn btn-grid-del btn-small"
			onclick="ClCRUD.fnActionIt({selector: '\\#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/alarm/alarmruleActionAjax.do', param: 'action_type=delete&alarm_rule_seq=#:alarm_rule_seq#'});">
			<spring:message code="BUTTON.DELETE" text="삭제" /></button>
		</script>
		
	</div>
