<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>Code Management</h1>
	</hgroup>
	<!-- <button type="button" class="close-pop is-close">팝업 닫기</button> -->
</div><!-- // .cont-header -->
	
<div class="cont-body" style="height:715px;">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
		<form id="actionForm" method="post" action="">
			<input type="hidden" name="_sel" id="_sel"  value="${param.selector }" />
			<input type="hidden" name="action_type" id="action_type"  value="add" />
			<input type="hidden" name="use_yn" id="use_yn"  value="Y" />
			
		    <!-- 팝업 테이블 (s) -->
		    <div class="pd-a13">
		    <div class="popsub" style="margin: 0px 0px 5px 2px;">Code Info</div>
			    <table class="tb2">
			    	<colgroup>
						<col width="8%">
						<col width="12%">
						<col width="8%">
						<col width="12%">
						<col width="8%">
						<col width="12%">
						<col width="8%">
						<col width="12%">
						<col width="8%">
						<col width="12%">
					</colgroup>
					<tbody>
			    		<tr>
			        		<th scope="row" class="hasBg hasPad text-center">Category</th>
			        		<td class="hasPad">
								<input type="text" name="cat_cd" id="cat_cd"  value="<c:out value="${bean.cat_cd}"></c:out>" class="itx itx-p100" required readonly/>
							</td>
	
			        		<th scope="row" class="hasBg hasPad text-center">
								<!-- Code Tooltip -->
								<div class="tooltipOuter">
									<i class="fa fa-question-circle"></i>
									<span class="tooltipDesc wd-320" >
									<spring:message code="JS.DIV.TOOLTIP.CODES_MSG_CD" text="시스템에서 사용할 코드 입니다.<br> &nbsp;&nbsp;- 값을 임의로 수정하면 시스템에 영향을 줄 수 있습니다." />
									</span>
								</div>
			        			<spring:message code="TABLE.COLUMN.CD" text="코드" /><span class="red">*</span>
			        		</th>
			        		<td class="hasPad">
								<input type="text" name="cd" id="cd" class="itx itx-p100" maxlength="20" value="" required/>
							</td>
							
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
								<input type="text" name="cd_val" id="cd_val" class="itx itx-p100"  value="" maxlength="100" required/>
							</td>
							
			        		<th scope="row" class="hasBg hasPad text-center">Parent Code</th>
			        		<td class="hasPad">
								<select name="p_cd" id="p_cd" style="width: 100%">
									<option value="">None</option>
									<c:forEach items="${cmcdlist }" var="i">
										<c:if test="${i.cat_cd eq bean.p_cat_cd}">
											<option value="${i.cd }">${i.cd_val }</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							
			        		<th scope="row" class="hasBg hasPad text-center"><spring:message code='TABLE.COLUMN.DISP_ORD' text='표시 순서'/><span class="red">*</span></th>
			        		<td class="hasPad">
								<select name="disp_ord" id="disp_ord" style="width: 100%">
									<c:forEach var="i" begin="1" end="${cnt}" step="1">
										<option value="${i }">${i }</option>
									</c:forEach>
								</select>
							</td>
			    		</tr>
	
			    		<tr>
			        		<th scope="row" class="hasBg hasPad text-center">Attr1.</th>
			        		<td class="hasPad">
								<input type="text" name="cd_attr_1" id="cd_attr_1" class="itx itx-p100" value="" maxlength="100" />
							</td>
	
			        		<th scope="row" class="hasBg hasPad text-center">Attr2.</th>
			        		<td class="hasPad">
			        			<input type="text" name="cd_attr_2" id="cd_attr_2" class="itx itx-p100" value="" maxlength="100" />
							</td>
							
			        		<th scope="row" class="hasBg hasPad text-center">Attr3.</th>
			        		<td class="hasPad">
								<input type="text" name="cd_attr_3" id="cd_attr_3" class="itx itx-p100" value="" maxlength="100" />
							</td>
							
			        		<th scope="row" class="hasBg hasPad text-center">Attr4.</th>
			        		<td class="hasPad">
								<input type="text" name="cd_attr_4" id="cd_attr_4" class="itx itx-p100" value="" maxlength="100" />
							</td>
							
			        		<th scope="row" class="hasBg hasPad text-center">Attr5.</th>
			        		<td class="hasPad">
								<input type="text" name="cd_attr_5" id="cd_attr_5" class="itx itx-p100" value="" maxlength="100" />
							</td>
			    		</tr>
			    		
						<tr>
			        		<th scope="row" class="hasBg hasPad text-center">Note</th>
			        		<td class="hasPad" colspan="9">
								<input type="text" name="cd_desc" id="cd_desc" class="itx itx-p100" maxlength="999" value="" />
							</td>
		    			</tr>
		    			
					</tbody>
				</table>
			</div>
			
		</form>
		
		<!-- 버튼 영역 -->
		<table>
			<tr>
			   <th scope="row" class="text-left">
					<div class="popsub" style="margin: 0px 0px 0px 13px;">Code List
					<!-- Total Count -->
				 		<span style="font-size:12px;">
				 			- Total Count : <span id="totalCnt"></span>
				 		</span>
					</div>
               </th>
               <th style="padding-right:0px;">
					<div class="fr">
						<button type="button" class="btn btn-add2 btn-medium btn-x60 mg-r10" onclick="fnSave()"> <spring:message code="BUTTON.ADD" text="추가" /></button>
					</div>
               </th>
			</tr>		
		</table>
		
		<!-- Grid 영역 -->
		<div class="l-kendo-wrap override fl second" style="width:1574px; padding: 0px 13px 13px 13px;">
			<input type="hidden" id="page" value="1">
			<div id="grid"></div>
		</div>
		
		<div class="fr">
			<button type="button" class="btn btn-default btn-x120 mg-r10" onclick="fnClose();"><spring:message code="BUTTON.CLOSE" text="닫기" /></button>
		</div>
	</div>
</div>