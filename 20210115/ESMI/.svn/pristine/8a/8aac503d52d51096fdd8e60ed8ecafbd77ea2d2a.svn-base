<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript" charset="utf-8">

//목록 페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/setting/codecategoryAjax.do');
var cat_cd;
ClKendo.fnCreateGrid({
	selector: '#sub_grid',
	height: 720,
	columns: [
		{ title: "<input type='checkbox' id='cd_all'>", template: kendo.template($("#cd_check-template").html()), width:60, attributes:{ 'class':"text-center"}},
		{ field: "cd",				title: "<spring:message code='TABLE.COLUMN.CD' text='코드'/>",					width: 150},
		{ field: "cd_val",			title: "<spring:message code='TABLE.COLUMN.CD_VAL' text='코드 값'/>",			width: 200},
		{ field: "cd_desc",			title: "<spring:message code='TABLE.COLUMN.CD_DESC' text='코드 설명'/>",		width: 300},
		{ field: "disp_ord",		title: "<spring:message code='TABLE.COLUMN.DISP_ORD' text='표시 순서'/>",				width: 120,		attributes:{ 'class':"text-right"}},
		{ field: "p_cd",			title: "<spring:message code='TABLE.COLUMN.P_CD' text='상위 코드'/>",					width: 120,		attributes:{ 'class':"text-center"}},
		{ field: "cd_attr_1",		title: "ATTRIBUTE1",					width: 170},
		{ field: "cd_attr_2",		title: "ATTRIBUTE2",					width: 170},
		{ field: "cd_attr_3",		title: "ATTRIBUTE3",					width: 170},
		{ field: "cd_attr_4",		title: "ATTRIBUTE4",					width: 170},
		{ field: "cd_attr_5",		title: "ATTRIBUTE5",					width: 170},
		{ field: "use_yn",			title: "<spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/>",					width: 80,		attributes:{ 'class':"text-center"}},
		{ field: "gen_by",			title: "<spring:message code='TABLE.COLUMN.GEN_BY' text='생성자'/>",			width: 150,		attributes:{ 'class':"text-center"}},
		{ field: "gen_dt",			title: "<spring:message code='TABLE.COLUMN.GEN_DT' text='생성일시'/>",			width: 150, 	attributes:{ 'class':"text-center"}},
		{ field: "mdfy_by",			title: "<spring:message code='TABLE.COLUMN.MDFY_BY' text='변경자'/>",			width: 150, 	attributes:{ 'class':"text-center"}},
		{ field: "mdfy_dt",			title: "<spring:message code='TABLE.COLUMN.MDFY_DT' text='변경일시'/>",			width: 150, 	attributes:{ 'class':"text-center"}}
	],
	toolbar: false,
 	pageable: false,
	scrollable: {
		virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	}
});
// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 720,
	columns: [
		{ title: "<input type='checkbox' id='cat_cd_all'>", template: kendo.template($("#check-template").html()), width:30, attributes:{ 'class':"text-center"}},
		{ field: "cat_cd",			title: "<spring:message code='TABLE.COLUMN.CAT_CD' text='카테고리 코드'/>",		width: 100,},
		{ field: "cat_nm",			title: "<spring:message code='TABLE.COLUMN.CAT_NM' text='카테고리 명'/>",		width: 100,},
		{ field: "cat_desc",		title: "<spring:message code='TABLE.COLUMN.CAT_DESC' text='카테고리 설명'/>",				width: 200,},
	],
 	pageable: false,
	scrollable: {
		virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	toolbar: false,
	selectable: "cell",
	change: function(arg) {
		var selected = $.map(this.select(), function(item) {
			cat_cd = ClLayout.fnGetSelector({selector:"#grid"}).data('kendoGrid').dataItem($(item).parent()).cat_cd;
		});
		ClLayout.fnGetTabJsn().urlList.push('/setting/codesAjax.do?cat_cd=' + cat_cd);
		ClCRUD.fnListSearchIt({selector: '#sub_grid', url:'/setting/codesAjax.do?cat_cd=' + cat_cd});
		$("#cd_all").on("change", function() {
			if ($("#cd_all").is(":checked")) {
				$("input[name=cd]").prop("checked", true);
			} else {
				$("input[name=cd]").prop("checked", false);
			}
		});
	}
});
ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList')});

$("div.k-grid-norecords div").html("<div><spring:message code='MESSAGE.NEED_CATEGORY' text='카테고리를 먼저 선택해주세요.'/></div>");

$("#cat_cd_all").on("change", function() {
	if ($("#cat_cd_all").is(":checked")) {
		$("input[name=cat_cd]").prop("checked", true);
	} else {
		$("input[name=cat_cd]").prop("checked", false);
	}
});
function fnEditCat() {
	if ($("input[name=cat_cd]:checked").length != 1) {
		alert("<spring:message code='MESSAGE.NEED_ONE' text='하나의 항목을 선택해주세요.'/>");
		return;
	} else {
		ClPopup.fnOnClickModalOpen('/setting/codecategorydetail.do', 'action_type=modify&cat_cd=' + $("input[name=cat_cd]:checked").val());
	}
}
function fnDelCat() {
	if ($("input[name=cat_cd]:checked").length < 1) {
		alert("<spring:message code='MESSAGE.NEED_ONE' text='하나의 항목을 선택해주세요.'/>");
		return;
	} else {
		var delCats = "";
		$("input[name=cat_cd]:checked").each(function(i, e) {
			delCats += $(e).val() + ",";
		});
		delCats = delCats.substring(0, delCats.length - 1);
		ClCRUD.fnActionIt({selector: '#grid', url: '/setting/codecategoryAjax.do', actionUrl: '/setting/codecategoryActionAjax.do'
		, param: 'action_type=delete&cat_cd=' + delCats});
	}
}
function fnEditCode() {
	if ($("input[name=cd]:checked").length != 1) {
		alert("<spring:message code='MESSAGE.NEED_ONE' text='하나의 항목을 선택해주세요.'/>");
		return;
	} else {
		var cd = $("input[name=cd]:checked").val().split("|");
		ClPopup.fnOnClickModalOpen('/setting/codesdetail.do', 'action_type=modify&cat_cd=' + cat_cd + '&cd=' + cd[0]);
	}
}
function fnDelCode() {
	if ($("input[name=cd]:checked").length < 1) {
		alert("<spring:message code='MESSAGE.NEED_ONE' text='하나의 항목을 선택해주세요.'/>");
		return;
	} else {
		var cdArr = "";
		var ordArr = "";
		$("input[name=cd]:checked").each(function(i, e) {
			var stringArr = $(e).val().split("|");
				
			cdArr += stringArr[0] + ",";
			ordArr += stringArr[1] + ",";
		});
		cdArr.substring(0, cdArr.length - 1);
		ordArr.substring(0, ordArr.length - 1);
		
		ClCRUD.fnActionIt({selector: '#sub_grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/setting/codesActionAjax.do'
				, param: 'action_type=delete&cat_cd=' + cat_cd + '&cd=' + cdArr + '&ord_arr=' + ordArr});
	}
}
</script>

<style>
#grid .k-grid-content tbody tr {
    cursor: pointer;
}
</style>