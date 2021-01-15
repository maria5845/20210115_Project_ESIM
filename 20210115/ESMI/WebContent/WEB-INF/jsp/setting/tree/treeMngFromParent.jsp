<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<div class="m-form">
		<div class="in">
			<table class="inForm">
				<colgroup>
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<button type="button" class="btn btn-medium btn-default" onclick="javascript:location.href='${rootPath}/treemng/tree1depthMng.do';">
								<spring:message code="BUTTON.MOVETOPLEVELDVCGROUP" text="최상위 장치그룹으로 이동" /></button>
							&nbsp;&nbsp;&gt;&nbsp;&nbsp;
							<button type="button" class="btn btn-medium btn-default" onclick='fnSearchIt();'><spring:message code="BUTTON.SUBLEVELDVCGROUP" text="하위 장치그룹" />(${bean.tree_nm})</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="grid-wrap" style="height: calc(100% - 99px);">
		<div class="m-option top">
			<button id="allcol" class="btn btn-lg sub-btn">전체 닫기</button>
			<button id="allexp" class="btn btn-lg sub-btn">전체 열기</button>
		</div>
		<div id="childTree" style="height: calc(100% - 39px);"></div>
	</div>
	<script id="k-template-step" type="text/x-kendo-template">
		# if(level != 1){ #
			<i class="k-icon k-i-arrow-60-up crsr-pt" onclick="fnTreeUpDwnIt('up', '#:tree_seq#', '#:p_tree_seq#', '#:level#', '#:depth_ord#');"></i>
			<i class="k-icon k-i-arrow-60-down crsr-pt" onclick="fnTreeUpDwnIt('down', '#:tree_seq#', '#:p_tree_seq#', '#:level#', '#:depth_ord#');"></i>
		# } #
	</script>
	
	<script id="k-template-add" type="text/x-kendo-template">
		<i class="k-icon k-i-plus crsr-pt" onclick="ClPopup.fnOnClickModalOpen('/treemng/treedetail.do', 'action_type=add&p_tree_seq=#:tree_seq#&depth1_seq=${depth1_seq}');"></i>
	</script>
	
	<script id="k-template-edit" type="text/x-kendo-template">
		<button type="button" class="btn btn-small btn-grid-edit" onclick="ClPopup.fnOnClickModalOpen('/treemng/treedetail.do', 'action_type=modify&tree_seq=#:tree_seq#&depth1_seq=${depth1_seq}');"><i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
	</script>
