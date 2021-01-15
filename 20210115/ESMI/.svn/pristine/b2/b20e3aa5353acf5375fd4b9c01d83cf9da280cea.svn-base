<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript">

var msgArr = new Array();
<c:forEach items="${menu_list}" var="i" varStatus="vs">
	msgArr[${i.menu_no}] = '<spring:message code="MENU.${i.menu_no}" text="${i.menu_nm}" javaScriptEscape="true"/>';
</c:forEach>


//목록 페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/setting/menuAjax.do');


// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 720,
	columns: [
				{ field: "menu_nm",		title: "<spring:message code='TABLE.COLUMN.MENU_NM' text='메뉴 명'/>",				width: 300},
				{ field: "menu_addr",	title: "<spring:message code='TABLE.COLUMN.MENU_ADDR' text='메뉴 주소'/>",				width: 300},
				{ field: "menu_desc",	title: "<spring:message code='TABLE.COLUMN.MENU_DESC' text='메뉴 설명'/>",				width: 350},
				{ field: "disp_ord",	title: "<spring:message code='TABLE.COLUMN.DISP_ORD' text='표시 순서'/>",				width: 100, 				attributes:{ 'class':"text-right"}},
				{ field: "show_yn",		title: "<spring:message code='TABLE.COLUMN.SHOW_YN' text='표출 여부'/>",				width: 100, 				attributes:{ 'class':"text-center"}},
				{ field: "use_yn",		title: "<spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/>",				width: 100, 				attributes:{ 'class':"text-center"}},
				{ field: "menu_no",		title: "<spring:message code='TABLE.COLUMN.MENU_NO' text='메뉴 번호'/>",				width: 100 , hidden: true},
				{ field: "p_menu_no",	title: "<spring:message code='TABLE.COLUMN.PMENU_NO' text='부모메뉴 번호'/>",			width: 100 , hidden: true},
				{ title: "<spring:message code='GRID.HEADER.WORK' text='작업'/>", template: kendo.template($("#cmd-template").html()), width: 180, attributes:{ 'class':"text-center"}},
	],
	excel: {
		fileName: '${curMenuNm}'//다운로드 파일명
	},
	selectable: "cell",
	change: function(arg) {
		var selected = $.map(this.select(), function(item) {
			var menu_no = ClLayout.fnGetSelector({selector:"#grid"}).data('kendoGrid').dataItem($(item).parent()).menu_no;
			if($(item).index() < 6){
				fnSearchIt(menu_no);
			}
		    return ;
		});
	},
	excelExportBtnSelector: "#kendoExlExpBtn",
	scrollable: {
		virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	pageable: false,
	toolbar: false
});

fnSearchIt("${bean.p_menu_no}");
	

/**
 * 조회
 */
function fnSearchIt(_menu_no){
	
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url: '/setting/menuAjax.do',
		paramJsn: {
			p_menu_no: _menu_no
		},
		sucFn: function(data){
			
// 			console.log("req : ${pageContext.request.locale} / res : ${pageContext.response.locale}");
			
			ClKendo.fnSetDataToKendoGrid({selector: "#grid", data: data.data.list});
			var menunavi=eval(data.data.settingMenuHierarchyList);
			
			$("#menuNavi").empty();
			var menunaviStr = '<button type="button" class="btn btn-medium btn-default" onclick="javascript:fnSearchIt(0);"><spring:message code="BUTTON.TOPLEVELMENUMNG" text="최상위 메뉴 관리" /></button>';
			$("#p_menu_no").val(0);
			
			for(var i=0; i<menunavi.length; i++){
				menunaviStr += '&nbsp;&nbsp;&gt;&nbsp;&nbsp;<button type="button" class="btn btn-medium btn-default" onclick="javascript:fnSearchIt(' 
// 						+ menunavi[i].menu_no + ');">' + menunavi[i].menu_nm + '</button>';
						+ menunavi[i].menu_no + ');">' + msgArr[menunavi[i].menu_no] + '</button>';
				$("#p_menu_no").val(menunavi[i].menu_no);
			}
			
			$("#menuNavi").append(menunaviStr);
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
		},
	})
}

</script>
