<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="m-form">
	<div class="in">
		<spring:message code="TITLE.CODE.MNG" text="코드 관리" />
	</div>
</div>

<div class="grid-wrap" style="">
	<div class="m-option top"></div>

	<input type="hidden" id="page" value="1">
	
	<table>
		<tr>
			<td style="width:750px;">
				<div id="grid" style="width: 700px;">
				
				
				</div>
				<div class="mar-t10">
						<button type="button" class="btn btn-add2 btn-medium btn-x60" style="" 
						onclick="javascript:ClPopup.fnOnClickModalOpen('/setting/codecategorydetail.do', 'action_type=add');">
						<spring:message code="BUTTON.ADD" text="추가" /></button>
						<button type="button" class="btn btn-lg btn-medium btn-x60" style="" 
						onclick="fnEditCat();">
						<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
						<button type="button" class="btn btn-del btn-medium btn-x60" style="" 
						onclick="fnDelCat();">
						<spring:message code="BUTTON.DELETE" text="삭제" /></button>
				</div>
			</td>
			<td style="">
				<div id="sub_grid" style="width:1100px;height:650px;">
				
				</div>
				<div class="mar-t10">
						<button type="button" class="btn btn-add2 btn-medium btn-x60" style="" 
						onclick="if (cat_cd != null) {ClPopup.fnOnClickModalOpen('/setting/codesdetail.do', 'action_type=add&cat_cd=' + cat_cd);} else { alert('<spring:message code="MESSAGE.NEED_CATEGORY" text="카테고리를 먼저 선택해주세요."/>'); }">
						<spring:message code="BUTTON.ADD" text="추가" /></button>
						<button type="button" class="btn btn-lg btn-medium btn-x60" style="" 
						onclick="fnEditCode();">
						<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
						<button type="button" class="btn btn-del btn-medium btn-x60" style="" 
						onclick="fnDelCode();">
						<spring:message code="BUTTON.DELETE" text="삭제" /></button>
				</div>
			</td>
		</tr>
	</table>
</div>
<script id="cd_check-template" type="text/x-kendo-template">
	<input name="cd" type="checkbox" value="#:cd#|#:disp_ord#">
</script>

<script id="check-template" type="text/x-kendo-template">
			<input name="cat_cd" type="checkbox" value="#:cat_cd#">
		</script>
		
		