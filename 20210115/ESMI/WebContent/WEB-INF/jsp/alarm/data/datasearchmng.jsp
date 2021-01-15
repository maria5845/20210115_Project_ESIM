<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<div class="m-form">
		<div class="in">

			<table id="hdrListSrchRfrsh" class="inForm">
           		<colgroup>
            		<col width="60px">
            		<col width="620px">
            		<col width="90px">
            		<col width="243px">
            		<col width="90px">
            		<col width="243px">
            		<col width="*">
            	</colgroup>
                <tbody>
                	<tr>
	                    <th scope="row" class="text-right">
	                        <label for="alarm_type"><spring:message code='TABLE.COLUMN.DATE' text='일자' /></label>
	                    </th>
	                    <td>
	                    	<div>
								<input name="startdate" id="startdate" style="width:140px" onchange="" >
								<input name="start_tm" id="start_tm" class="itx itx-x120" data-role="datepicker" type="text" class="k-input" role="combobox" aria-expanded="false" aria-owns="start_tm_dateview" aria-disabled="false">
	                        	 ~
	                        	<input name="enddate" id="enddate" style="width:140px" onchange="">
								<input name="end_tm" id="end_tm" class="itx itx-x120" data-role="datepicker" type="text" class="k-input" role="combobox" aria-expanded="false" aria-owns="end_tm_dateview" aria-disabled="false">
                        	</div>
	                    </td>
						<th scope="row" class="text-right">
                        	<label for="dvc_nm"><spring:message code="TABLE.COLUMN.DVC_NM" text="장치 명" /></label>
                    	</th>
                     	<td>
                     		<input type="text" id="dvc_nm" name="dvc_nm" class="itx itx-p100"/>
		             	</td>
                    	<th scope="row" class="text-right">
                        	<label for="var_id"><spring:message code="TABLE.COLUMN.VAR_ID" text="수집항목 ID" /></label>
                    	</th>
                     	<td>
                     		<input type="text" id="var_id" name="var_id" class="itx itx-p100"/>
		             	</td>

	                    <td>
            				<button type="button" class="btn btn-srch btn-medium" id="kendoSearchBtn" 
            					onclick="ClKendo.fnGridRefresh({selector: '#grid', page: 1});"><spring:message code="BUTTON.SEARCH" text="조회" /></button>
            			</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<div class="grid-wrap">
		<div class="m-option top">
		<div class="fr">
			<button type="button" class="btn btn-excel btn-medium" onclick="fnExportExcel();">
				<spring:message code='BUTTON.EXPORTCSV' text='CSV 다운로드' />
			</button>
		</div>
	</div>
	
		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		<script id="pk-template" type="text/x-kendo-template">
		</script>

		<script id="cmd-template" type="text/x-kendo-template">
		</script>
		
	</div>
