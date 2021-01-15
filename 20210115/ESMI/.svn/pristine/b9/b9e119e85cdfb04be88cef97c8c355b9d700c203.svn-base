<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
//Default로 오늘 선택
ClKendo.fnCreateDatePicker({selector: "#startdate", value: '${today}', min: null});
ClKendo.fnCreateDatePicker({selector: "#enddate",   value: '${today}', min: null});
var currentTimeArr = '${currentTime}'.split(/\:/gi);
//datepicker 생성 (체크 시간)
$("#start_tm").kendoTimePicker({
    dateInput: false
    , value: new Date(2011, 0, 1, currentTimeArr[0], 00)
});
$("#end_tm").kendoTimePicker({
    dateInput: false
    , value: new Date(2011, 0, 1, currentTimeArr[0], 59)
});

// ClLayout.fnGetTabJsn().urlList.push('/data/datasearchmngAjax.do');

// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 700,
	columns: [
                 { field: "dvc_id",			title: "<spring:message code='TABLE.COLUMN.DVC_ID' text='장치 ID' />",			width: 100, attributes:{ 'class':"text-center"}},
                 { field: "dvc_nm",			title: "<spring:message code='TABLE.COLUMN.DVC_NM' text='장치 명' />",			width: 150, attributes:{ 'class':"text-center" }},
                 { field: "var_id",			title: "<spring:message code='TABLE.COLUMN.VAR_ID' text='수집항목 ID' />",		width: 150, attributes:{ 'class':"text-center"}},
                 { field: "data_tm",		title: "<spring:message code='TABLE.COLUMN.DATA_TM' text='데이터 수집시간' />",	width: 180, attributes:{ 'class':"text-center"}},
                 { field: "data_val",		title: "<spring:message code='TABLE.COLUMN.DATA_VAL' text='데이터 값' />",			width: 150, attributes:{ 'class':"text-right"}},
	],
	toolbar: null,
// 	excelExportBtnSelector: "#kendoExlExpBtn",
	dataSource : {
		pageSize: 100,
        serverPaging: true,
        schema: {
            data: function(response) {
               if(response && response.data && response.data.list){
                  return response.data.list;
               }else{
                  return [];
               }
            },
            total: function(response) {
               if(response && response.data && response.data.page && response.data.page.cnt) {
                  return response.data.page.cnt;
               }
               return Number.MAX_VALUE;
            },
        },
        transport: {
        	read: {
        		url: '${rootPath}/data/datasearchmngAjax.do'
			},
			parameterMap: function(data, operation) {
// 				console.log($('#startdate').val().replace(/\-/gi, "") + fnGetTm("start_tm") + " ~ "+ $('#enddate').val().replace(/\-/gi, "") + fnGetTm("end_tm"));
            	data.startdate = $('#startdate').val().replace(/\-/gi, "") + fnGetTm("start_tm");
				data.enddate = $('#enddate').val().replace(/\-/gi, "") + fnGetTm("end_tm");
            	data.dvc_nm = $('#dvc_nm').val();
            	data.var_id = $('#var_id').val();
            	return data;
         	}
        }
    },
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
});

// Server Side 페이징일땐, 조회를 따로 실행하지 않는다.
// 엔터키
ClCRUD.fnHeaderSearch({
	selector: '#hdrListSrchRfrsh',
	handle: function(){ClKendo.fnGridRefresh({selector: '#grid', page: 1});},
});


/**
 * CSV 다운로드
 */
function fnExportExcel(){
	kendo.ui.progress($('body'), true);
	
	var f = document.createElement('form');
	var _data = {
        	startdate	: $('#startdate').val().replace(/\-/gi, "") + fnGetTm("start_tm")
			, enddate		: $('#enddate').val().replace(/\-/gi, "") + fnGetTm("end_tm")
			, dvc_nm		: $('#dvc_nm').val()
			, var_id		: $('#var_id').val()
    };
	var now = new Date();
	_data.excelFileName = 'ZS_RAW_' + now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2);
	

	f.method = "POST";
	f.action = "${rootPath}/data/getRawDataToExcelAjax.do";
	f.target = "winExcelFrame";

	$.fileDownload(f.action,{
	    httpMethod: "POST",
	    data:_data,
    })
   .done(function(){ kendo.ui.progress($('body'), false);})
   .fail(function(){ kendo.ui.progress($('body'), false); alert("<spring:message code='MESSAGE.EXPORTCSV' text='CSV다운로드에 실패하였습니다.' />")});
}


/**
 * 
 */
function fnGetTm(_target){
	var tm = "";
	
	var tmVal = $("#"+_target).val().replace("오전", "AM").replace("오후", "PM");
	var arr = tmVal.split(" ");
	var hour = arr[0].split(":")[0];
	var min  = arr[0].split(":")[1];
	if("AM"==arr[1]){
		if("12" == hour){
			tm += "00" + min;
		}else if(hour.length == 1){
			tm += "0" + hour + min
		}else{
			tm += hour + min;
		}
	}else if("PM"==arr[1]){
		if("12" == hour){
			tm += hour + min;
		}else{
			tm += (12 + Number(hour)) + min;
		}
	}
	if(_target.indexOf("start") > -1){
		tm += "00000"
	}else{
		tm += "59999"
	}
	return tm;
}

</script>
