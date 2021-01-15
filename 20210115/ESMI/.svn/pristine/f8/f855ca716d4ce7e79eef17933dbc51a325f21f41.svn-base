<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
//******************************************************************
<c:if test="${!empty id}">
	var id = '${id}';
	id = id.replaceAll("[", "");
	id = id.replaceAll("]", "");
</c:if>

<c:if test="${!empty ctq_list}">
	var ctqList = ${ctq_list};
</c:if>

//기본으로 설정되어 있는 chartParamJsn
<c:if test="${empty chart_jsn}">
	chartParamJsn = [{"id":"chart1","title":"A1U/A2U","var_arr":["A1U","A2U"]},{"id":"chart2","title":"A2U/A3U","var_arr":["A2U","A3U"]},{"id":"chart3","title":"A4U/TS_U","var_arr":["A4U","TS_U"]},{"id":"chart4","title":"A5U/A6U","var_arr":["A5U","A6U"]},{"id":"chart5","title":"A2L/A3L/A4L/TS_U","var_arr":["A2L","A3L","A4L","TS_U"]},{"id":"chart6","title":"TW_I/TW/A5L/A6L","var_arr":["TW_I","TW","A5L","A6L"]},{"id":"chart7","title":"A5L/A6L/TH_A/TW","var_arr":["A5L","A6L","TH_A","TW"]},{"id":"chart8","title":"A6L/TH_A","var_arr":["A6L","TH_A"]},{"id":"9","title":"SM2/SM3/SM4","var_arr":["SM2","SM3","SM4"]}];
</c:if>

//아이디별로 설정되어 있는 chartParamJsn
<c:if test="${!empty chart_jsn}">
	chartParamJsn = ${chart_jsn[0].chart_jsn};
</c:if>
//******************************************************************

//Grid 그리기
ClKendo.fnCreateGrid({
	selector: '#ctpGrid',
	height: 500,
	toolbar: null,
	columns: [
		{ template: kendo.template($("#pk-template").html()),  width:45, attributes:{ 'class':"text-center"}},
		{ field: "var_id",	title: '<spring:message code="TABLE.COLUMN.VAR_ID" text="수집항목 ID" />', 			width: 200},
	],
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	pageable: false,
	dataSource:  ctqList,
});

//선택된 json으로 만든 후 저장
function fnSetCtq(){
	var selected = "";
    var var_arr = [];
    
    $("input.varId:checked").each(function(idx, ele){
        var val = $(ele).val();
        var_arr.push(val);
    })
    
    if(var_arr.length <= 0){
    	alert("Please select variables.");
    	return;
    }
    
    if(var_arr.length > 4){
    	alert("Please select 4 variables.");
    	return;
    }
    
    chartParamJsn[id-1].title = var_arr.join("/");
    chartParamJsn[id-1].var_arr = var_arr;
    
	ClAjax.fnCallAjax({
		url : '/pmng/errTrackCtpJsonAjax.do',
		paramJsn : {
			chart_jsn : JSON.stringify(chartParamJsn),
		},
		sucFn : function(data) {
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			$(".is-close").eq(-1).trigger("click");
			//모달 부모창 함수 호출 - 차트 json 가져오기
			ClLayout.$owner().fnGetChartJsn();
		},
	}); 
}

</script>
