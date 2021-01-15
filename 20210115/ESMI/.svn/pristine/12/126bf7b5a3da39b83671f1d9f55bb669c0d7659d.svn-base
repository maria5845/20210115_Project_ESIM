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
            		<col width="120">
            		<col width="100">
            		<col width="120">
            		<col width="200">
            		<col width="*">
            	</colgroup>
                <tbody>
                	<tr>
	                    <th scope="row" class="text-right">
	                        <label for="alarm_type"><spring:message code='TABLE.COLUMN.NOTI_TYPE' text='통지 타입' /></label>
	                    </th>
	                    <td>
	                    	<select id="noti_type" name="noti_type" class="wd-150">
								<option value=""><spring:message code="ETC.SELECTBOX.ALL" text="전체" /></option>
								<c:forEach items="${noti_type_list }" var="i">
									<option value="${i.cd }"><c:out value="${i.cd_val }"></c:out></option>
								</c:forEach>
	                    	</select>
	                    </td>
	                    <th scope="row" class="text-right">
	                        <label for="noti_attr_1"><spring:message code='TABLE.COLUMN.NOTIATTR' text='통지 속성' /></label>
	                    </th>
	                    <td>
							<input type="text" id="noti_attr_1" name="noti_attr" class="itx itx-p100"/>
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
					onclick="javascript:ClPopup.fnOnClickModalOpen('/alarm/alarmnotidetail.do', 'action_type=add');">
					<spring:message code="BUTTON.ADD" text="추가" />
				</button>
				<button type="button" class="btn btn-medium btn-excel" 
					onclick="fnExportExcel();"> Excel Export
				</button>
			</div>
		</div>
	
		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		<script id="pk-template" type="text/x-kendo-template">
		</script>

		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
			onclick="javascript:ClPopup.fnOnClickModalOpen('/alarm/alarmnotidetail.do', 'action_type=modify&noti_seq=#:noti_seq#&page=');">
			<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
			
			<button type="button" class="btn btn-grid-del btn-small"
			onclick="ClCRUD.fnActionIt({selector: '\\#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/alarm/alarmnotiActionAjax.do', param: 'action_type=delete&noti_seq=#:noti_seq#'});"
			# if(mapping_yn != 'N' ) { #disabled# } #
			>
			<spring:message code="BUTTON.DELETE" text="삭제" /></button>
		</script>
		
	</div>
