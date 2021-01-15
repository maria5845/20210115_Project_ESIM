<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">

// DatePicker 생성
// Default로 오늘~하루전 선택
ClKendo.fnCreateDatePicker({selector: "#startdate", value: '${today}', min: null});
ClKendo.fnCreateDatePicker({selector: "#enddate",   value: '${today}', min: null});

ClLayout.fnGetTabJsn().urlList.push('/alarm/alarmlistmngAjax.do');

//header의 check박스 클릭액션
$(document).on("click", "#checkAll", function () {
    $("#grid tbody input[type=checkbox]:enabled").prop("checked", this.checked);
});

// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 680,
	columns: [
				 {headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template").html()),  width:45, attributes:{ 'class':"text-center"}},
                 { field: "alarm_type_nm",		title: "<spring:message code='TABLE.COLUMN.ALARM_TYPE' text='알람 타입' />",				width: 100, attributes:{ 'class':"text-center"}},
                 { field: "alarm_rule_nm",		title: "<spring:message code='TABLE.COLUMN.ALARM_RULE_NM' text='알람 규칙 명' />",				width: 200, attributes:{ 'class':"text-left"}},
                 { field: "alarm_lvl_nm",		title: "<spring:message code='TABLE.COLUMN.ALARM_LVL' text='알람 레벨' />",				width: 80, attributes:{ 'class':"text-center"}},
                 { field: "alarm_data_val",		title: "<spring:message code='TABLE.COLUMN.ALARM_DATA_VAL' text='알람 데이터 값' />",			width: 100, attributes:{ 'class':"text-right" }},
                 { field: "dvc_nm",				title: "<spring:message code='TABLE.COLUMN.DVC_NM' text='장치 명' />",					width: 150, attributes:{ 'class':"text-center" }},
                 { field: "var_id",				title: "<spring:message code='TABLE.COLUMN.VAR_ID' text='수집항목 ID' />",			width: 120, attributes:{ 'class':"text-center"}},
                 { field: "gen_dt",				title: "<spring:message code='TABLE.COLUMN.GEN_DT' text='생성 일시' />",				width: 180, attributes:{ 'class':"text-center"}},
                 { field: "alarm_state_nm",		title: "<spring:message code='TABLE.COLUMN.ALARM_STATE' text='알람 상태' />",				width: 100, attributes:{ 'class':"text-center"}},
                 { field: "cnfrm_msg",			title: "<spring:message code='TABLE.COLUMN.CNFRM_MSG' text='확인 메시지' />",			width: 300, attributes:{ 'class':"text-left"}},
                 { field: "mdfy_by",			title: "<spring:message code='TABLE.COLUMN.MDFY_BY' text='변경자' />",				width: 100, attributes:{ 'class':"text-center"}, hidden: true},
                 { field: "mdfy_dt",			title: "<spring:message code='TABLE.COLUMN.MDFY_DT' text='변경 일시' />",				width: 180, attributes:{ 'class':"text-center"}, hidden: true},
                 { title: "<spring:message code='GRID.HEADER.WORK' 	text='작업' />", template: kendo.template($("#cmd-template").html()), width:120, attributes:{ 'class':"text-center"}},
	],
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	pageable: {
    	pageSize: 50,
    },
    toolbar: false
});

ClCRUD.fnListSearchIt({selector: '#grid', url: '/alarm/alarmlistmngAjax.do'});

	
/**
 * 일괄 수정 
 */
function fnBatchUpdate(){
	var alarmSeqStr = getGridData();
	if( "" == alarmSeqStr || "undefined" == alarmSeqStr ){
		alert("<spring:message code='MESSAGE.ALARMLIST_CHG' text='수정할 대상 알람리스트를 선택해주세요.' />");
		return false;
	}
	ClPopup.fnOnClickModalOpen('/alarm/alarmlistdetail.do', 'action_type=modify_batch&alarm_seq_str='+alarmSeqStr);
}

/**
 * Grid checkbox 선택된 row 가져오기
 */
 function getGridData(){
	var grid = grid = $("#grid").data("kendoGrid");
	var rows = grid.tbody;
	var checked = rows.find("input:checkbox:checked")
	
	var str = "";
	for(var i=0; i<checked.length; i++){
		var tr = $(checked[i]).closest("tr");
		var d = grid.dataItem(tr);
		
		if( "" != str ){ str += ","; }
		str += "'" + d.alarm_seq + "'";
	}
	
	return str;
}

 /* Excel 익스포트 */
 function fnExportExcel() {
 	var grid = $("#grid").data("kendoGrid");
 	grid.saveAsExcel();
 }
</script>
