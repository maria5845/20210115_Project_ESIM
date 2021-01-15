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
            		<col width="120px">
            		<col width="310px">
            		<col width="90px">
            		<col width="120px">
            		<col width="100px">
            		<col width="120px">
            		<col width="*">
            	</colgroup>
                <tbody>
                	<tr>
	                    <th scope="row" class="text-left">
	                        <label for="alarm_type"><spring:message code='TABLE.COLUMN.ALARMLIST_DAY' text='알람 발생일자' /></label>
	                    </th>
	                    <td>
	                    	<div>
							<input name="startdate" id="startdate" style="width:130px" onchange="" >
                        	 ~
                        	<input name="enddate" id="enddate" style="width:130px" onchange="">
                        	</div>
	                    </td>
	                    <th scope="row" class="text-right">
	                        <label for="alarm_type"><spring:message code='TABLE.COLUMN.ALARM_TYPE' text='알람 타입' /></label>
	                    </th>
	                    <td>
	                    	<select id="alarm_type" name="alarm_type" style="width: 100%;">
								<option value=""><spring:message code="ETC.SELECTBOX.ALL" text="전체" /></option>
								<c:forEach items="${alarm_type_list }" var="i">
									<option value="${i.cd }"><c:out value="${i.cd_val }"></c:out></option>
								</c:forEach>
	                    	</select>
	                    </td>
	                    <th scope="row" class="text-right">
	                        <label for="alarm_lvl"><spring:message code='TABLE.COLUMN.ALARM_LVL' text='알람 레벨' /></label>
	                    </th>
	                    <td>
							<select id="alarm_lvl" name="alarm_lvl" style="width: 100%;">
								<option value=""><spring:message code="ETC.SELECTBOX.ALL" text="전체" /></option>
								<c:forEach items="${alarm_lvl_list}" var="i">
						  		<option value="${i.cd}" id="${i.cd}"> 
						  			<c:out value="${i.cd_val}"></c:out>
						  		</option>
						  		</c:forEach>
							</select>
	                    </td>
              
                    	<th scope="row" class="text-left">
                        	<label for="alarm_rule_nm"><spring:message code='TABLE.COLUMN.ALARM_RULE_NM' text='알람 규칙 명' /></label>
                    	</th>
                     	<td>
                     		<input type="text" id="alarm_rule_nm" name="alarm_rule_nm" class="itx itx-p100"/>
		             	</td>
	                    <th scope="row" class="text-right">
	                        <label for="alarm_state"><spring:message code='TABLE.COLUMN.ALARM_STATE' text='알람 상태' /></label>
	                    </th>
	                    <td>
							<select id="alarm_state" name="alarm_state" style="width: 100%">
								<option value=""><spring:message code="ETC.SELECTBOX.ALL" text="전체" /></option>
								<c:forEach items="${alarm_state_list}" var="i">
						  		<option value="${i.cd}" id="${i.cd}" >
						  			<c:out value="${i.cd_val}"></c:out>
						  		</option>
						  		</c:forEach>
							</select>
	                    </td>
	                	<th scope="row" class="text-right">
                        	<label for="dvc_nm"><spring:message code='TABLE.COLUMN.DVC_NM' text='장치 명' /></label>
                    	</th>
                     	<td>
                     		<input type="text" id="dvc_nm" name="dvc_nm" class="itx itx-x100"/>
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
			<button type="button" class="btn btn-lg btn-medium btn-x85"
				onclick="fnBatchUpdate();">
				<i class="fa fa-edit"></i> <spring:message code="BUTTON.BULKEDIT" text="일괄 수정" />
			</button>
			<button type="button" class="btn btn-medium btn-excel" 
				onclick="fnExportExcel();"> Excel Export
			</button>
			
		</div>
	</div>
	
		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		<script id="pk-template" type="text/x-kendo-template">
			<input type="checkbox" value="#:alarm_seq#"/>
		</script>

		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
			onclick="javascript:ClPopup.fnOnClickModalOpen('/alarm/alarmlistdetail.do', 'action_type=modify&alarm_seq=#:alarm_seq#');">
			<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
		</script>
		
	</div>
