<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="${rootPath}/resource/ext/ace1.3.3/ace.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/kendo/css/kendo.common-material.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/kendo/css/kendo.material.min.css">


<script type="text/javascript">
//탭 생성
ClKendo.fnCreateTab({
	selector: '#alarmTabstrip',
	tabPosition: "left",
	animation: { open: { effects: "" } }
});

// datepicker 생성 (체크 시간)
$("#chk_start_tm").kendoTimePicker({
    dateInput: false
});
$("#chk_finish_tm").kendoTimePicker({
    dateInput: false
});

// 장치탭 활성화/비활성화
fnTabChange('dvc');
// 통지여부 탭
fnTabChange('noti');
// 알람 타입에 맞게 UI 설정
fnChangeAlarmTypeAction();

// chk_time 데이터 설정
fnSetCheckTime("start", "${bean.chk_start_tm}");
fnSetCheckTime("finish", "${bean.chk_finish_tm}");
fnShowTimeInput();

//========================================== 기본정보 스크립트
/**
 * 알람 시간체크를 위한 시간 보여주기 
 */
function fnShowTimeInput(){
	var chkTimeYn = $("#chk_tm_yn option:selected").val();
	if( "Y" == chkTimeYn ){
		$("#tm_input_div").show();
	}else{
		$("#tm_input_div").hide();
	}
}
//======================================= end 기본정보 스크립트

//========================================== 장치 및 수집항목 스크립트
var loadList = ${load_list};
ClKendo.fnCreateGrid({
	selector: '#load_grid',
	height: 480,
	toolbar: null,
	columns: [
				{ headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template-load").html()), attributes:{ 'class':"text-center"},  width: 25},
                { field: "dvc_seq",	title: "장치SEQ",	width: 130, attributes:{ 'class':"text-center"}, hidden: true},
                { field: "dvc_id",	title: "<spring:message code='TABLE.COLUMN.DVC_ID' text='장치 ID' />",		width: 180, attributes:{ 'class':"text-center"}},
                { field: "dvc_nm",	title: "<spring:message code='TABLE.COLUMN.DVC_NM' text='장치 명' />",		width: 200, attributes:{ 'class':"text-center"}},
	],
	dataSource: loadList,
	pageable: false,
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
});
var variableList = ${variable_list};
ClKendo.fnCreateGrid({
	selector: '#variable_grid',
	height: 480,
	toolbar: null,
	columns: [
				{ headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template-variable").html()), attributes:{ 'class':"text-center"},  width: 25},
                { field: "var_id",	title: "<spring:message code='TABLE.COLUMN.VAR_ID' text='수집항목 ID' />",		width: 180, attributes:{ 'class':"text-center"}},
                { field: "var_nm",	title: "<spring:message code='TABLE.COLUMN.VAR_NM' text='수집항목 명' />",		width: 200, attributes:{ 'class':"text-center"}},
	],
	dataSource: variableList,
	pageable: false,
	filterable: true,
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
});

var notiList = ${noti_list};
ClKendo.fnCreateGrid({
	selector: '#noti_grid',
	height: 480,
	toolbar: null,
	columns: [
				{ headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template-noti").html()), attributes:{ 'class':"text-center"},  width: 50},
				{ field: "noti_seq",	title: "통지SEQ",		width: 130, attributes:{ 'class':"text-center"}, hidden: true},
                { field: "noti_type_nm",title: "<spring:message code='TABLE.COLUMN.NOTI_TYPE' text='통지 타입' />",	width: 90, 	attributes:{ 'class':"text-center"}},
                { field: "noti_nm",		title: "<spring:message code='TABLE.COLUMN.NOTI_NM' text='통지 명' />",		width: 250, attributes:{ 'class':"text-center"}},
                { field: "noti_attr",	title: "<spring:message code='TABLE.COLUMN.NOTIATTR' text='통지 속성' />",		width: 500, attributes:{ 'class':"text-left"}},
	],
	dataSource: notiList,
	pageable: false,
	scrollable: true,
});
//=======================================end 장치 및 수집항목 스크립트


//========================================== 모든 탭

/**
 * 저장
 */
function fnAlarmRuleAction() {
	var alarmType = $("#alarm_type option:selected").val();
	var data1 = 0; 
	var data2 = 0; 
	var attr1 = ""; 
	var attr2 = "";
	var duration = "";
	if("AT_LMT" == alarmType){// 임계치
		data1 = $("#chk_data_1").val(); 
		attr1 = $("#chk_attr_1 option:selected").val(); 
		data2 = $("#chk_data_2").val();
		if(data2 == "" || data2 == 'undefined'){
			attr2 = "";
			
			//float형일 경우 null 처리를 자동으로 해주지 않아 0으로 선언
			data2 = 0; 
		}else{
			attr2 = $("#chk_attr_2 option:selected").val(); 
		}
		duration = $("#chk_duration").val();
	}else if("AT_NORECEIVE" == alarmType){// 미수신
		attr1 = $("#chk_attr_3 option:selected").val(); 
		data1 = attr1; 
	}
	
	var notiYn = $("#noti_yn option:selected").val();
	var noti_seq_str = "";
	if(notiYn != "N"){
		noti_seq_str = getGridData('noti');
	}
	ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/alarm/alarmruleActionAjax.do'
		, param: {
			action_type		: $("#action_type").val()
			, alarm_rule_seq: $("#alarm_rule_seq").val()
			, alarm_rule_nm	: $("#alarm_rule_nm").val()
			, alarm_type	: alarmType 
			, alarm_msg		: $("#alarm_msg").val() 
			, chk_attr_1	: attr1 
			, chk_data_1	: data1 
			, chk_attr_2	: attr2 
			, chk_data_2	: data2 
			, chk_duration  : duration
			, chk_tm_yn		: $("#chk_tm_yn option:selected").val() 
			, chk_start_tm	: getTimeValue( $("#chk_start_tm").val() ) 
			, chk_finish_tm	: getTimeValue( $("#chk_finish_tm").val() ) 
			, alarm_lvl		: $("#alarm_lvl option:selected").val() 
			, alarm_state	: $("#alarm_state option:selected").val() 
			, alarm_interval: $("#alarm_interval option:selected").val() 
			, tot_dvc_yn	: $("#tot_dvc_yn option:selected").val()
			, noti_yn		: notiYn
			, use_yn		: $("#use_yn option:selected").val()
			, dvc_id_str	: getGridData('load')
			, var_id_str	: getGridData('variable')
			, noti_seq_str	: noti_seq_str
			, beep_sec		: $("#beep_sec").val()
			, cep_str		: $("#cep_str").val()
		}, validFnc: function(){return fnCheckValidation();}
		, mdClsBool: true,
	});
}

/**
 * Grid 에 checked 된 데이터 가져오기
 */
function getGridData(type){
	var grid = "";
	if ( type == 'load' ){
		grid = $("#load_grid").data("kendoGrid");
	}else if ( type == 'variable' ){
		grid = $("#variable_grid").data("kendoGrid");
	}else if ( type == 'noti' ){
		grid = $("#noti_grid").data("kendoGrid");
	} 
	var rows = grid.tbody;
	var checked = rows.find("input:checkbox:checked")
	
	var str = "";
	for(var i=0; i<checked.length; i++){
		var tr = $(checked[i]).closest("tr");
		var d = grid.dataItem(tr);
		if ( type == 'load' ){
			if( "" != str ){ str += ","; }
			str += d.dvc_seq;
		}else if ( type == 'variable' ){
			if( "" != str ){ str += ","; }
			str += d.var_seq;
		}else if ( type == 'noti' ){
			if( "" != str ){ str += ","; }
			str += d.noti_seq;
		}
	}
	
	return str;
}
/**
 * Validation 체크
 */
function fnCheckValidation(){
	
	if(!$("#actionForm").parsley().validate()) return false;
	
	var msg = "";
	// 알람 타입값에 따른 알람 설정 값 벨리데이션 체크
	var alarmType = $("#alarm_type option:selected").val();
	var data1 = ""; 
	var data2 = ""; 
	var attr1 = ""; 
	var attr2 = ""; 
	if("AT_LMT" == alarmType){// 임계치
		data1 = $("#chk_data_1").val(); 
		attr1 = $("#chk_attr_1 option:selected").val(); 
		data2 = $("#chk_data_2").val() ;
		if(data2 == "" || data2 == 'undefined'){
			attr2 = ""; 
		}else{
			attr2 = $("#chk_attr_2 option:selected").val(); 
		}
	}else if("AT_NORECEIVE" == alarmType){// 미수신
		attr1 = $("#chk_attr_3 option:selected").val(); 
		data1 = attr1; 
	}
	if("AT_CEP" != alarmType && data1 == "" && data2 == ""){
		msg = "<spring:message code='MESSAGE.ALARMCHK_CONDITION' text='알람 체크 조건을 확인해주세요.' />";
		alert( msg );
		return false;
	}
	
	var chkTmYn = $("#chk_tm_yn option:selected").val();
	if( "N" == chkTmYn ){
		$("#chk_start_tm").val("");
		$("#chk_finish_tm").val("");
	}else{
		if( $("#chk_start_tm").val() == "" || $("#chk_finish_tm").val() == "" ){
			msg = "<spring:message code='MESSAGE.CHECKTIMEVAL' text='체크 시간 값을 입력해주세요.' />";
			alert( msg );
			return false;
		}
		
		var stTime = getTimeValue( $("#chk_start_tm").val() );
		var endTime = getTimeValue( $("#chk_finish_tm").val() );
		if(stTime > endTime){
			msg = "<spring:message code='MESSAGE.CHECKTIMERNG' text='체크 시간 범위를 확인해주세요.' />";
			alert( msg );
			return false;
		}
	}
	
	if( "" == msg ){
		return true;
	} else {
		alert( msg );
		return false;
	}
}
/**
 * timepicker 값 가져오기.
 */
function getTimeValue(value){
	var chkTmYn = $("#chk_tm_yn option:selected").val();
	if( "N" == chkTmYn ){
		return "";
	}
	var ampm = value.substring(0, 3);
	if( ampm != "오후 " && ampm != "오전 " && ampm != "AM " && ampm != "PM " ){
		alert("<spring:message code='MESSAGE.CONFIRMTM' text='시간값을 확인해주세요.' />");
		return false;
	}
	var time = value.substring(3, value.length);
	var hour = time.substring(0, time.indexOf(":"));
	var min  = time.substring(time.indexOf(":")+1, time.length);
	
	
	if( ("오후 " == ampm || "PM " == ampm) && hour == "12" ){
	}else if( ("오전 " == ampm || "AM " == ampm) && hour == "12" ){
		hour = "00";
	}else if( "오후 " == ampm || "PM " == ampm ){
		hour = (Number(hour) + 12)+"";
	}else if( Number(hour) < 10 ){
		hour = "0" + hour;
	}
	
	return hour+min;
}

function fnSetCheckTime(gubun, value){
	if( "" == value || value == "undefined" ) value = gubun == "start" ? "0000" : "2330";
	var ampm = "";
	var hour = value.substring(0, 2);
	var min = value.substring(2, 4);
	if( hour == "00" ){
		ampm = "오전 ";
		hour = "12";
	}else if( hour < 10 ){
		ampm = "오전 ";
		hour = hour.replace("0", "");
	}else if( hour == 12 ){
		ampm = "오후 ";
	}else if( hour > 12 ){
		ampm = "오후 ";
		hour = (Number(hour) - 12)+"";
	} 
	//console.log(value + '/' + ampm + hour + ":" + min);
	if (gubun == "start") $("#chk_start_tm").val(ampm + hour + ":" + min);
	else if (gubun == "finish") $("#chk_finish_tm").val(ampm + hour + ":" + min);
}

/**
 * 탭 상태 변경 ( 전체 장치 대상 여부 에 따라 장치 탭 enable/disable 변경)
 */
function fnTabChange(type){
	var useYn = ""; 
	var tabStrip = $("#alarmTabstrip").data("kendoTabStrip");
	
	if(type=="dvc"){
		useYn = $("#tot_dvc_yn option:selected").val();
		if( "Y" == useYn ){
			tabStrip.enable(tabStrip.tabGroup.children("li")[1], false);
		}else{
			tabStrip.enable(tabStrip.tabGroup.children("li")[1], true);
		}
	}else if(type=="noti"){
		useYn = $("#noti_yn option:selected").val();
		if( "N" == useYn ){
			tabStrip.enable(tabStrip.tabGroup.children("li")[3], false);
		}else{
			tabStrip.enable(tabStrip.tabGroup.children("li")[3], true);
		}
	}
}


/**
 * 알람 타입 변경 액션 (UI 모양 변경)
 */
function fnChangeAlarmTypeAction(){
	var alarmType = $("#alarm_type option:selected").val();
	
	var tabStrip = $("#alarmTabstrip").data("kendoTabStrip");
	tabStrip.enable(tabStrip.tabGroup.children("li")[2], true);
	tabStrip.enable(tabStrip.tabGroup.children("li")[4], false);	
	if("AT_LMT" == alarmType){// 임계치
		$("#at_lmt").show();
		$("#at_noreceive").hide();
	}else if("AT_NORECEIVE" == alarmType){// 미수신
		$("#at_lmt").hide();
		$("#at_noreceive").show();
	}else if("AT_CEP" == alarmType){// CEP
		$("#at_lmt").hide();
		$("#at_noreceive").hide();
		tabStrip.enable(tabStrip.tabGroup.children("li")[2], false);
		tabStrip.enable(tabStrip.tabGroup.children("li")[4], true);
	}
}

/**
 * 체크속성2 onchange
 */
function fnOnchangeChkAttr2(_this){
	if($(_this).val() == ''){
		$('#chk_data_2').val(null);
		$('#chk_data_2').prop('disabled', true);
	}else{
		$('#chk_data_2').prop('disabled', false);
	}
}

//쿼리 에티터에서 SQL 보기
var editor = null;
function fnViewQueryEditor(){
    editor = ace.edit("editor");
    editor.setTheme("ace/theme/twilight");
    editor.session.setMode("ace/mode/siddhi");
    editor.session.setValue($('#cep_str').val());
    editor.gotoLine(0);
    editor.focus();
}
fnViewQueryEditor();

function fnApplyEditor() {
	var alarmType = $("#alarm_type option:selected").val();
	if("AT_CEP" == alarmType){// CEP
		$('#cep_str').val(editor.getValue());
	}else{
		$('#cep_str').val("");		
	}
}

// height로 생기는 td 줄 없애기
$("#variable_grid").css("height", "auto");
$("#alarmTabstrip-5").css("height", "525px");

</script>

<style>
#alarmTabstrip-5 {
    padding-bottom: 0px;
}
</style>