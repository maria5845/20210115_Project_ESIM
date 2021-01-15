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
            		<col width="115px">
            		<col width="130px">
            		<col width="80px">
            		<col width="130px">
            		<col width="120px">
            		<col width="130px">
            		<col width="*">
            	</colgroup>
                <tbody>
                	<tr>
                     	<th scope="row" class="text-left">
                        	 <label for="planDate1"><spring:message code="TAB.BUTTON.AUTHGROUP" text="권한 그룹" /></label>
                    	</th>
                     	<td>
							<select name="auth_gr_no" id="auth_gr_no" class="wd-180">
								<option value=""><spring:message code="ETC.SELECTBOX.ALL" text="전체" /></option>
								<c:forEach items="${authlist }" var="i">
								<option value="${i.auth_gr_no }">
									<c:out value="${i.auth_gr_nm }"></c:out>
								</option>
								</c:forEach>
							</select>
                     	</td>

                    	<th scope="row" class="text-left">
                        	<label for="productGroup">ID</label>
                    	</th>
                     	<td>
                        	<input type="text" id="user_id" name="user_id" class="itx itx-x180"/>
		             	</td>
	                     
                    	<th scope="row" class="text-left">
                        	<label for="productGroup">User Name</label>
                    	</th>
                     	<td>
                        	<input type="text" id="user_nm" name="user_nm" class="itx itx-x180"/>
		             	</td>
		             	<td>
            				<button type="button" class="btn btn-srch btn-medium" id="kendoSearchBtn" 
            					onclick="ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), page: 1});"
            					style="position:static;">
            					<spring:message code="BUTTON.SEARCH" text="조회" /></button>
            			</td>
					</tr>
					<tr>
                    	<th scope="row" class="text-left">
                        	<label for="productGroup"><spring:message code="TABLE.COLUMN.MOBILE_TEL_NO" text="전화번호" /></label>
                    	</th>
                     	<td>
                        	<input type="text" id="mobile_tel_no" name="mobile_tel_no" class="itx itx-x180"/>
		             	</td>
	                     
                    	<th scope="row" class="text-left">
                        	<label for="productGroup"><spring:message code="CODE.NOTI_TYPE.EMAIL" text="E-Mail" /></label>
                    	</th>
                     	<td>
                        	<input type="text" id="user_email" name="user_email" class="itx itx-x180"  data-parsley-type="email"/>
		             	</td>
						
						<th></th>
						<td></td>
					</tr>
                </tbody>
            </table>
        </div>
    </div>


    <div class="grid-wrap">
        <div class="m-option top">
            <div class="fr">
        		<button type="button" class="btn btn-add2 btn-medium btn-x60"
        			onclick="javascript:ClPopup.fnOnClickModalOpen( '${rootPath}/setting/userdetail.do', 'action_type=add', '700');"><spring:message code="BUTTON.ADD" text="추가" />
				</button>
            </div>
        </div>

		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		<script id="pk-template" type="text/x-kendo-template">
			<input type="checkbox" value="#:user_id#,#:user_position#,#:user_nm#" name="chk" data-state="#:user_id#" />
		</script>
		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
			onclick="javascript:ClPopup.fnOnClickModalOpen( '/setting/userdetail.do', 'action_type=modify&user_id=#:user_id#', '700');">
			<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
		</script>

    </div>
