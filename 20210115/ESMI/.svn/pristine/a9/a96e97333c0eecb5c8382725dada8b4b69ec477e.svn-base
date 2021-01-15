<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<script type="text/javascript">
var sel = $("#_sel").val();

$(window).on("beforeunload", function() {
	// 사용자가 x 표시를 이용해 닫으면, 닫기 의 함수 호출
	fnClose();
});


ClCRUD.fnListSearchIt({selector: '#grid', url: "/setting/codecategoryAjax.do?cat_cd=" + sel, callBack: refreshCnt });

ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 430,
	columns: [
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
	],
	toolbar: false,
 	pageable: false,
	scrollable: {
		virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	}
});

//파라미터 건수를 Refresh 한다.
function refreshCnt() {
	$("#totalCnt").text($(".second tbody[role=rowgroup] tr[role=row]").size());
}

/**
 * 저장
 */
function fnSave(){
	// ajax 저장
	if( $('#actionForm').parsley().validate() ){
		ClAjax.fnCallAjax({
			url : '/setting/codesActionAjax.do',
			paramJsn : $("#actionForm").serialize(),
			sucFn : function(data) {
				alert("저장이 완료되었습니다.");
				$("#actionForm")[0].reset();
			},
			errHandle : true,
			compltFn : function() {
				//grid refresh
				ClCRUD.fnListSearchIt({selector: '#grid', url: "/setting/codecategoryAjax.do?cat_cd=" + sel });
			},
		});
	}
}

/**
 * 닫기
 */
function fnClose(){
	// Grid의 rowData를 모두 code_list 배열에 넣는다. 
	var grid = $("#grid").data("kendoGrid");
	var code_list = [];
	grid.dataSource._data.forEach(function(item){
		code_list.push(item);
    });
	
	// Grid의 데이터 소스를
	// parent의 selector에 데이터 소스로 셋팅 - 부모창 함수 호출
// 	opener.parent.fnLoad(code_list);
	var _select = opener.parent.ClLayout.fnGetSelector("#lcsvr_type");
	_select.kendoDropDownList({
        dataTextField: "cd_val",
        dataValueField: "cd",
        dataSource: code_list
	}).data("kendoDropDownList");

	window.open('','_self').close();
}
</script>
