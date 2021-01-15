<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript">

fnSearchIt();

/**
 * 테이블 데이터
 */
function fnSearchIt() {
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url: '/treemng/tree1depthMngAjax.do',
		paramJsn: {
		},
		sucFn: function(data){
			ClKendo.fnSetDataToKendoGrid({selector: '#tree1depthList', data: JSON.parse(data.data.list), selPos: -1});
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
		},
	});
}

/**
 * 테이블 생성
 */
ClKendo.fnCreateGrid({
// 	height: 740,
	columns: [
		{ field: "tree_nm", title: "<spring:message code='TABLE.COLUMN.TOPLEVELDVCGROUP' text='최상위 장치 그룹 명' />"},
		{ field: "tree_desc", title: "<spring:message code='TABLE.COLUMN.TOPLEVELDVCGROUPDESC' text='최상위 장치 그룹 내용' />"},
        { field: "tree_kd_nm", title: "<spring:message code='TABLE.COLUMN.DVC_GR_TYPE' text='장치 그룹 타입' />", width: 170, attributes:{ 'class':"text-center"}},
        { field: "use_yn", title: "<spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/>", width: 120, attributes:{ 'class':"text-center"}},
//         { field: "", title: "<spring:message code='TABLE.COLUMN.ORD_CHG' text='순서 변경' />", width: 150, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-step").html())},
        { field: "", title: "<spring:message code='BUTTON.MOVELOWLEVELDVCGROUPUP' text='하위 장치그룹으로 이동' />" , width: 150, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-drill").html())},
        { field: "", title: "<spring:message code='BUTTON.EDIT' text='수정' />", width: 120, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-edit").html())}
	],
	selector: '#tree1depthList',
	toolbar: false,
    resizable: false,
    pageable: false,
    columnMenu: false,
    scrollable: true
});

var isProcessing = false;

/** 
 * Excel 익스포트 
 */
// function fnExportExcel() {
// 	var now = new Date();
// 	var _param = {
// 			actionUrl: '/treemng/treeExcelExport.do',
// 			data: {
// 				excelFileName: 'dvcGroupInfo' + now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2),
// 	    	},
// 	}
// 	ClExcel.fnCommonExcelDown(_param);
// }
/**
 * 엑셀 Import
 */
// function fnImportPop(){
// 	ClPopup.fnOnClickModalOpen( '${rootPath}/treemng/treeExcelUpload.do', '', '400');
// }
</script>
