<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.m-option.top{
	text-align: right;
}
.l-kendo-wrap.override .k-grid-header .k-header{
	color: #999999!important;
}
.sub-btn{
	font-size: 12px;
}
#tree1depthList{
 	height: calc(100% - 39px)!important; 
}
</style>
	
	<div class="m-form">
		<div class="in">
			<table class="inForm">
				<colgroup>
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<button type="button" class="btn btn-medium btn-default" onclick='fnSearchIt();'><spring:message code="BUTTON.MOVETOPLEVELDVCGROUP" text="최상위 장치그룹으로 이동" /></button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="grid-wrap" style="height: calc(100% - 99px);">
		<div class="m-option top">
			<button type="button" class="btn btn-add2 btn-medium" 
				onclick="javascript:ClPopup.fnOnClickModalOpen('/treemng/treedetail.do', 'action_type=add&p_tree_seq=0');" ><spring:message code="BUTTON.ADDTOPLEVELDVCGROUP" text="최상위 장치그룹 추가" /></button>
<!-- 			<button type="button" class="btn btn-medium btn-excel" onclick="fnExportExcel();">데이터 다운로드</button> -->
<!-- 			<button type="button" class="btn btn-medium btn-excel" onclick="fnImportPop();">데이터 업로드</button> -->
		</div>
		<div id="tree1depthList"></div>
		<script id="k-template-step" type="text/x-kendo-template">
			<i class="k-icon k-i-arrow-60-up crsr-pt" onclick="fnTreeUpDwnIt('up', '#:tree_seq#', '#:p_tree_seq#', '#:level#', '#:depth_ord#');"></i>
			<i class="k-icon k-i-arrow-60-down crsr-pt" onclick="fnTreeUpDwnIt('down', '#:tree_seq#', '#:p_tree_seq#', '#:level#', '#:depth_ord#');"></i>
		</script>
		<script id="k-template-drill" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" onclick="location.href='${rootPath}/treemng/treeMngFromParent.do?tree_seq=#:tree_seq#'"><i class="fa fa-arrow-circle-right"></i> <spring:message code="BUTTON.MOVE" text="이동" /></button>
		</script>
		<script id="k-template-edit" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" onclick="ClPopup.fnOnClickModalOpen('/treemng/treedetail.do', 'action_type=modify&tree_seq=#:tree_seq#');"><i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
		</script>
	</div>
