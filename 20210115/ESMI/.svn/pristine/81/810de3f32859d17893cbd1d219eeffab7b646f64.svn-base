<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>Code Category</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post" action="">
			<input type="hidden" name="action_type" id="action_type"  value="${action_type}" />
			
		    <!-- 팝업 테이블 (s) -->
		    <div class="pd-a13">
		    <table class="tb2">
		    	<colgroup>
					<col width="160">
					<col>
				</colgroup>
				<tbody>
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">
							<!-- cat_cd Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-240" >
								<spring:message code="JS.DIV.TOOLTIP.CODECATEGORY_MSG_CD" text="개별 코드를 통합하는 카테고리 코드 값입니다.<br>
								&nbsp;&nbsp;- 임의로 값을 수정할 경우 시스템에 영향을 줄 수 있습니다." />
								</span>
							</div>
		        			<spring:message code='TABLE.COLUMN.CAT_CD' text='카테고리 코드'/><span class="red">*</span></th>
		        		<td class="hasPad">
							<input type="text" name="cat_cd" id="cat_cd"  value="<c:out value="${bean.cat_cd}"></c:out>"
							${action_type == 'modify' ? 'readonly' : '' }
							class="itx itx-p100" required maxlength="20" />
						</td>
		    		</tr>

		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.CAT_NM' text='카테고리 명'/><span class="red">*</span></th>
		        		<td class="hasPad">
							<input type="text" name="cat_nm" id="cat_nm"  value="<c:out value="${bean.cat_nm}"></c:out>"
							class="itx itx-p100" maxlength="100" required/>
						</td>
		    		</tr>
		    		
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.P_CAT_CD' text='상위 카테고리 코드'/></th>
		        		<td class="hasPad">
							<select name="p_cat_cd" id="p_cat_cd" style="width: 100%">
								<option value="">None</option>
								<c:forEach items="${cmcatlist }" var="i">
									<option value="${i.cat_cd }" ${i.cat_cd == bean.p_cat_cd ? 'selected' : '' }>${i.cat_cd }</option>
								</c:forEach>
							</select>
						</td>
		    		</tr>
					<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Category Attribute - 1</th>
		        		<td class="hasPad">
							<input type="text" name="cat_attr_1" id="cat_attr_1"  value="<c:out value="${bean.cat_attr_1}"></c:out>"
							class="itx itx-p100"
							maxlength="20"
							/>
						</td>
		    		</tr>
		    			<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Category Attribute - 2</th>
		        		<td class="hasPad">
							<input type="text" name="cat_attr_2" id="cat_attr_2"  value="<c:out value="${bean.cat_attr_2}"></c:out>"
							class="itx itx-p100"
							maxlength="20"
							/>
						</td>
		    		</tr>
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Category Attribute - 3</th>
		        		<td class="hasPad">
							<input type="text" name="cat_attr_3" id="cat_attr_3"  value="<c:out value="${bean.cat_attr_3}"></c:out>"
							class="itx itx-p100"
							maxlength="20"
							/>
						</td>
		    		</tr>
		    			<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Category Attribute - 4</th>
		        		<td class="hasPad">
							<input type="text" name="cat_attr_4" id="cat_attr_4"  value="<c:out value="${bean.cat_attr_4}"></c:out>"
							class="itx itx-p100"
							maxlength="20"
							/>
						</td>
		    		</tr>
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Category Attribute - 5</th>
		        		<td class="hasPad">
							<input type="text" name="cat_attr_5" id="cat_attr_5"  value="<c:out value="${bean.cat_attr_5}"></c:out>"
							class="itx itx-p100"
							maxlength="20"
							/>
						</td>
		    		</tr>
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Note</th>
		        		<td class="hasPad">
							<input type="text" name="cat_desc" id="cat_desc"  value="<c:out value="${bean.cat_desc}"></c:out>"
							class="itx itx-p100"
							maxlength="999"
							/>
						</td>
		    		</tr>
	    			
					<tr>
	        			<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/><span class="red">*</span></th>
        				<td class="hasPad">
							<label class="radio">
								<input type="radio" name="use_yn" id="use_yn" value="Y" ${bean.use_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
								<i></i>Yes</label>
							<label class="radio">
								<input type="radio" name="use_yn" id="use_yn" value="N" ${bean.use_yn == 'N' ? 'checked=checked' : ''}>
							<i></i>No</label>
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
				onclick="javascript:ClCRUD.fnActionIt({selector: '#grid', url: '/setting/codecategoryAjax.do', actionUrl: '/setting/codecategoryActionAjax.do'
						, param: '#actionForm', validFnc: function(){return $('#actionForm').parsley().validate();}, mdClsBool: true,});">
				<spring:message code='BUTTON.SAVE' text='저장'/></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code='BUTTON.CANCEL' text='취소'/></button>
        </div>
    </div>
</div>


