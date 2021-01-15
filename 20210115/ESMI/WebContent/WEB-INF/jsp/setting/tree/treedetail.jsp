<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>DeviceGroup Mng</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post">
			<input type="hidden" id ="tree_seq" name="tree_seq" value="${bean.tree_seq }" />
			<input type="hidden" id = "p_tree_seq" name="p_tree_seq" value="${bean.p_tree_seq }" />
			<input type="hidden" id = "action_type" name="action_type" value="${action_type }" />
			<input type="hidden" id = "depth_ord" name="depth_ord" value="${bean.depth_ord }" />
			
			<div class="pd-a13">
			<table class="tb2" style="width: 100%;">
				<colgroup>
					<col width="70px">
					<col width="150px">
					<col width="120px">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.DVC_TREE_NM" text="장치 그룹 명" /><span class="red">*</span></th>
		        		<td class="hasPad">
		        			<input type="text" name="tree_nm" id="tree_nm" 
		        			value="<c:out value="${bean.tree_nm}"></c:out>"
							class="itx itx-p100" maxlength="100" required/>
		        		</td>
		    		</tr>
		    		
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.DVC_TREE_DESC" text="장치 그룹 설명" /></th>
		        		<td class="hasPad">
		        			<input type="text" name="tree_desc" id="tree_desc" 
		        			value="<c:out value="${bean.tree_desc}"></c:out>"
							class="itx itx-p100" maxlength="100" />
		        		</td>
		    		</tr>
		    		
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.DVC_MAPP_NM" text="매핑 장치 명" /></th>
		        		<td class="hasPad">
							<input id="dvc_seq" name="dvc_seq" style="width: 100%;" value="${bean.dvc_seq }" <c:out value="${bean.dvc_id }"/> />
						</td>
		    		</tr>
		    		
<!-- 					    		<tr> -->
<!-- 					        		<th scope="row">정렬순서<span class="red">*</span></th> -->
<!-- 					        		<td> -->
<!-- 										<select name="depth_ord" id="depth_ord" style="width: 100%"> -->
<%-- 											<c:forEach var="i" begin="1" end="${cnt }" step="1"> --%>
<%-- 												<option value="${i }"  --%>
<%-- 												${(detail == null && cnt == i) || (detail != null && bean.depth_ord == i) ? "selected" : "" }> --%>
<%-- 													${i } --%>
<!-- 												</option> -->
<%-- 											</c:forEach> --%>
<!-- 										</select> -->
<!-- 									</td> -->
<!-- 					    		</tr> -->
		    		
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.DVC_GR_TYPE" text="장치그룹 타입" /><span class="red">*</span></th>
		        		<td class="hasPad">
							<select name="tree_kd" id="tree_kd" style="width: 100%">
								<c:forEach var="i" items="${tree_list}">
									<option value="${i.cd}" ${i.cd eq bean.tree_kd ? 'selected' : ''} >
										<c:out value="${i.cd_val}" />
									</option>
								</c:forEach>
							</select>
						</td>
		    		</tr>
		    		
					<tr>
	        			<th scope="row" class="hasBg hasPad text-center"><spring:message code="TABLE.COLUMN.USE_YN" text="사용 여부" /><span class="red">*</span></th>
        				<td class="hasPad">
							<label class="radio">
								<input type="radio" name="use_yn" value="Y" ${bean.use_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="use_yn" value="N" ${bean.use_yn == 'N' ? 'checked=checked' : ''}>
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
				onclick="save();">
				<spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>


