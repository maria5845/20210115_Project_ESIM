<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>Code</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post" action="">
			<input type="hidden" name="action_type" id="action_type"  value="${action_type}" />
			<input type="hidden" name="before_disp_ord" value="${bean.disp_ord}">
			
		    <!-- 팝업 테이블 (s) -->
		    <div class="pd-a13">
		    <table class="tb2">
		    	<colgroup>
					<col width="160">
					<col>
				</colgroup>
				<tbody>
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Category<span class="red">*</span></th>
		        		<td class="hasPad">
							<select name="cat_cd" id="cat_cd" style="width: 100%" 
								onchange="javascript:fnchangeCmcat(this.value)"
								${action_type == 'add' ? '' : 'readonly' }
								required disabled>
								<option value=""></option>
								<c:forEach var="i" items="${cmcatlist}">
									<option value="${i.cat_cd}" ${ bean.cat_cd == i.cat_cd ? "selected='selected'" : "" }><c:out value="${i.cat_nm}" /></option>
								</c:forEach>
							</select>
						</td>
		    		</tr>

		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">
							<!-- Code Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-320" >
								<spring:message code="JS.DIV.TOOLTIP.CODES_MSG_CD" 
										text="시스템에서 사용할 코드 입니다.<br> &nbsp;&nbsp;- 값을 임의로 수정하면 시스템에 영향을 줄 수 있습니다." />
								</span>
							</div>
		        			<spring:message code="TABLE.COLUMN.CD" text="코드" /><span class="red">*</span></th>
		        		<td class="hasPad">
							<input type="text" name="cd" id="cd"  
							${action_type == 'add' ? '' : 'readonly' }
							value="<c:out value="${bean.cd}"></c:out>"
							class="itx itx-p100" maxlength="20" required/>
						</td>
		    		</tr>
		    		
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">
							<!-- cd_val Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc wd-200" >
								<spring:message code="JS.DIV.TOOLTIP.CODENM_MSG_CD" 
										text="화면에 표시되는 코드 이름 입니다." />
								</span>
							</div>
		        			<spring:message code="TABLE.COLUMN.CD_NM" text="코드 명" /><span class="red">*</span>
		        		</th>
		        		<td class="hasPad">
							<input type="text" name="cd_val" id="cd_val"  value="<c:out value="${bean.cd_val}"></c:out>"
							class="itx itx-p100" maxlength="100" required/>
						</td>
		    		</tr>
		    		
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Parent Code</th>
		        		<td class="hasPad">
							<select name="p_cd" id="p_cd" style="width: 100%">
								<option value="">None</option>
								<c:forEach items="${cmcdlist }" var="i">
									<c:if test="${i.cat_cd eq bean.p_cat_cd}">
										<option value="${i.cd }" ${i.cd == bean.p_cd ? 'selected' : '' }>${i.cd_val }</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
		    		</tr>
	    			
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Note</th>
		        		<td class="hasPad">
							<input type="text" name="cd_desc" id="cd_desc"  value="<c:out value="${bean.cd_desc}"></c:out>"
							class="itx itx-p100" maxlength="999" />
						</td>
		    		</tr>
	    			
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Attr1.</th>
		        		<td class="hasPad">
							<input type="text" name="cd_attr_1" id="cd_attr_1"  value="<c:out value="${bean.cd_attr_1}"></c:out>"
							class="itx itx-p100" maxlength="100" />
						</td>
		    		</tr>
	    			
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Attr2.</th>
		        		<td class="hasPad">
							<input type="text" name="cd_attr_2" id="cd_attr_2"  value="<c:out value="${bean.cd_attr_2}"></c:out>"
							class="itx itx-p100" maxlength="100" />
						</td>
		    		</tr>
	    			
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Attr3.</th>
		        		<td class="hasPad">
							<input type="text" name="cd_attr_3" id="cd_attr_3"  value="<c:out value="${bean.cd_attr_3}"></c:out>"
							class="itx itx-p100" maxlength="100" />
						</td>
		    		</tr>
	    			<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Attr4.</th>
		        		<td class="hasPad">
							<input type="text" name="cd_attr_4" id="cd_attr_4"  value="<c:out value="${bean.cd_attr_4}"></c:out>"
							class="itx itx-p100" maxlength="100" />
						</td>
		    		</tr>
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">Attr5.</th>
		        		<td class="hasPad">
							<input type="text" name="cd_attr_5" id="cd_attr_5"  value="<c:out value="${bean.cd_attr_5}"></c:out>"
							class="itx itx-p100" maxlength="100" />
						</td>
		    		</tr>
		    		
	    			<tr>
		        		<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.DISP_ORD' text='표시 순서'/><span class="red">*</span></th>
		        		<td class="hasPad">
							<select name="disp_ord" id="disp_ord" style="width: 100%">
								<c:forEach var="i" begin="1" end="${cnt}" step="1">
									<option value="${i }" ${(bean == null && cnt == i) || (bean != null && bean.disp_ord == i) ? "selected='selected'" : "" }>${i }</option>
								</c:forEach>
							</select>
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

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
        	<button type="button" class="btn btn-lg btn-x90" 
				onclick="javascript:ClCRUD.fnActionIt({selector: '#sub_grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/setting/codesActionAjax.do'
						, param: '#actionForm', validFnc: function(){return $('#actionForm').parsley().validate();}, mdClsBool: true,});">
				<spring:message code='BUTTON.SAVE' text='저장'/></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code='BUTTON.CANCEL' text='취소'/></button>
        </div>
    </div>
</div>
