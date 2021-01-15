<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script>
$(document).ready(function() {

	// 캐시삭제
	$.ajaxSetup({
		cache : false
	});

	loadInfo();

	$('input').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			if($("#IdStr").val() != "" && $("#PwdStr").val() != ""){
				e.preventDefault();
				goLogin();
			}else{
				if($("#IdStr").val() != "") $("#PwdStr").focus();
			}
		}
	});
	
	var dropdownlist = $("#lang").data("kendoDropDownList");
	dropdownlist.select(function(dataItem) {
	    return dataItem.value === "${lang}".toUpperCase();
	});
	
	
})
function goLogin() {
	if($("#IdStr").val() == ""){
		alert("<spring:message code='MESSAGE.ENTERID' text='ID를 입력해 주세요.' />")
		$("#IdStr").focus();
		return;
	}
	if($("#PwdStr").val() == ""){
		alert("<spring:message code='MESSAGE.ENTERPW' text='패스워드를 입력해 주세요.' />")
		$("#PwdStr").focus();
		return;
	}
	cookieCheck();
	
	
	kendo.ui.progress($('body'), true);
	
	$.ajax({
		url: "${rootPath}/normalLoginActionAjax.do",
		type: "POST",
		data: {
			IdStr: 	$("#IdStr").val(),
			PwdStr: $("#PwdStr").val(),
			lang : $("#lang").val(),
		},
		success:function(data){
			if(data.result == true){
				var url = "${rootPath}/" +  data.location;
// 				url += (url.indexOf("?") == -1 ? "?_t=" : "&_t=") + (new Date()).getTime();
				location.replace(url);
			}else{
				kendo.ui.progress($('body'), false);

				alert(data.msg);
				if(data.data && "yes" == data.data.pwdchange) {
					$("#PwdStr").val("");
					ClPopup.fnOnClickModalOpen('/loginPwdChg.do', 'IdStr='+$("#IdStr").val());
					//fnShowPopup(500, 320, '${rootPath}/loginPwdChg.do?IdStr='+$("#IdStr").val(), 'userpwdchangepopupwin');
				}else{
					$("#PwdStr").val("").focus();
				}
			}
		},
		error:function(data){
			kendo.ui.progress($('body'), false);
			ClAjax.fnAjaxErrHandle(data);
		},
		complete:function(data){
		}
	})

}

// Cookie에 저장된 정보 load
function loadInfo() {
	var c_user_id = $.cookie("fog-IdStr");
	//저장된 값이 있다면 입력 요소에 값 출력
	if (c_user_id) {
		$("#IdStr").val(c_user_id);
		$("#PwdStr").focus();

		//체크박스는 다시 체크
		$("#remember").prop("checked", true);
	}else{
		$("#IdStr").focus();
	}
}

// Submit 액션시, 정보 저장 체크
function cookieCheck() {
	if ($("#remember").is(":checked")) {
		//체크 되어있다면, 해당 정보를 1년간 유효하도록 쿠키 저장
		$.cookie("fog-IdStr", $("#IdStr").val(), {
			"expires" : 365
		});
	} else {
		//체크가 해제되었다면 쿠키 삭제.
		$.removeCookie("fog-IdStr");
	}
}

/**
 * 다른 사이트로 이동 selectbox
 */
function selSite(){
	var v = $("#selSite").val();
	if(v == "") return;
	var win = window.open(v, "_blank")
	
	$("#selSite").data("kendoDropDownList").value("");
}

//뒤로가기 막기
history.forward(1);

//All Selectbox init
$("select").not('.notKendoDropdownList').kendoDropDownList();
</script>
