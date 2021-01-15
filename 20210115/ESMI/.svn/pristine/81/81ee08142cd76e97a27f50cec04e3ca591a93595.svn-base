<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
<c:if test="${action_type eq 'add'}">
	var action_type = 'add';
	addAttr(1);
</c:if>
<c:if test="${action_type eq 'modify'}">
	var action_type = 'modify';
	var tmp_list = ${pie_attr};
	setAttr();
</c:if>

//대상 사용자 탭 생성
ClKendo.fnCreateTab({
	selector: '#tabstrip',
	tabPosition: "left",
	animation: { open: { effects: "" } }
});

/**
 * 속성 세팅
 */
function setAttr(){
	$("#attrContent").empty();
	
	var con = "";
	
	for(var i=0; i<tmp_list.length; i++){
		var tmp = tmp_list[i];
		
		con += "<tr class=\"attr-tr\">";
		con += "<th class=\"text-center\" scope=\"row\"><spring:message code='TABLE.COLUMN.ATTR' text='속성'/>"+(i+1)+"</th>";
		con += "<td>";
		con += "<input type=\"text\" name=\"attr_nm\" id=\"attrNm"+(i+1)+"\" data-seq="+(i+1)+" class=\"itx itx-p100\" value='"+tmp.attr_nm+"' placeholder=\"<spring:message code='TABLE.COLUMN.ATTR_NM' text='속성 명'/>\" data-parsley-type=\"attr_nm\" maxlength=\"50\" />";
		con += "</td>";
		con += "<td>";
		con += "<input type=\"text\" name=\"attr_val\" id=\"attrVal"+(i+1)+"\" class=\"itx itx-p100\" value='"+tmp.attr_val+"' placeholder=\"<spring:message code='TABLE.COLUMN.ATTR_VAL' text='속성 값'/>\" data-parsley-type=\"attr_val\" maxlength=\"50\" />";
		con += "</td>";
		con += '<td class="pd-lr15">'
					+ '<button type="button" class="btn btn-grid-del btn-small" onclick="javascript:$(this).parents(\'tr\').first().remove()">'
					+ '<spring:message code="BUTTON.DELETE" text="삭제" /></button>'
				+ '</td>'
		con += "</tr>";
	}
	
	if(tmp_list.length == 0 || tmp_list == null || tmp_list == "null"){
		con += "<tr class=\"no-data\"><td class=\"text-center\">No Data</td></tr>";
	}
	
	$("#attrContent").append(con);
}

/**
 * 속성 줄 추가
 */
 
if(action_type == "modify"){
	var trCnt = $(".attr-tr").length;
}
 
function addAttr(x){
	$(".no-data").remove();
	
	trCnt ++;
	
	if(x==1)trCnt=1;
	
	var con = "";
	
	con += "<tr>";
	con += "<th class=\"text-center\" scope=\"row\"><spring:message code='TABLE.COLUMN.ATTR' text='속성'/>"+trCnt+"</th>";
	con += "<td>";
	con += "<input type=\"text\" name=\"attr_nm\" id=\"attrNm"+trCnt+"\" data-seq="+trCnt+" class=\"itx itx-p100\" value='' placeholder=\"<spring:message code='TABLE.COLUMN.ATTR_NM' text='속성 명'/>\" data-parsley-type=\"attr_nm\" maxlength=\"50\" />";
	con += "</td>";
	con += "<td>";
	con += "<input type=\"text\" name=\"attr_val\" id=\"attrVal"+trCnt+"\" class=\"itx itx-p100\" value='' placeholder=\"<spring:message code='TABLE.COLUMN.ATTR_VAL' text='속성 값'/>\" data-parsley-type=\"attr_val\" maxlength=\"50\" />";
	con += "</td>";
	con += '<td class="pd-lr15">'
				+ '<button type="button" class="btn btn-grid-del btn-small" onclick="javascript:$(this).parents(\'tr\').first().remove()">'
				+ '<spring:message code="BUTTON.DELETE" text="삭제" /></button>'
			+ '</td>'
	con += "</tr>";
	
	$('#attrContent').append(con);
}

/**
 * 저장
 */
function fnUserAction() {
	var p = $('#actionForm').serializeObject();
	
	var pieAttr_arr = [];
	var status;
	
	$.each($('input[name=attr_nm]'), function(){
		var seq = this.dataset.seq;
		var val = $("#attrVal"+seq).val();
		
		if(this.value == "" || val == "" || this.value == null || val == null){
			alert("<spring:message code='MESSAGE.PIE_ATTR' text='빈 속성이 존재합니다. 정확히 입력해주세요.'/>");
			status = false;
			return false;
		}
		
		pieAttr_arr.push({
			pie_id: p.pie_id,
			login_user_id: p.user_id,
			attr_nm: this.value,
			attr_val: val
		});
	});
	
	if(status == false)return false;
	
	p.pieAttr_arr = pieAttr_arr;
	
	ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/setting/pieActionAjax.do', 
		param: p, 
		validFnc: function(){return fnValidUser();}, 
		mdClsBool: true,
	});
}

/**
 * Validate
 */
function fnValidUser(){

 	if($("#actionForm").find("input[name=pie_id]").val() == "") {
		alert("<spring:message code='MESSAGE.PIE_ID' text='PIE ID를 입력해 주세요.'/>");
		$("#actionForm").find("input[name=pie_id]").focus();
		return false;
	}
 	
 	if($("#actionForm").find("input[name=pie_nm]").val() == "") {
		alert("<spring:message code='MESSAGE.PIE_NM' text='PIE 명을 입력해 주세요.'/>");
		$("#actionForm").find("input[name=pie_nm]").focus();
		return false;
	}
 	
 	if($("#actionForm").find("input[name=pie_ip]").val() == "") {
		alert("<spring:message code='MESSAGE.PIE_IP' text='PIE IP를 입력해 주세요.'/>");
		$("#actionForm").find("input[name=pie_ip]").focus();
		return false;
	}
 
//  	if($('#grid_authgr').find('input[type=checkbox]:checked').length < 1){
//  		alert("<spring:message code='MESSAGE.AUTH_NEED' text='권한 그룹은 최소 1개 이상 선택해주세요.'/>");
// 		return false;
//  	}
 	
//  	if($('#grid_pielist').find('input[type=checkbox]:checked').length < 1){
//  		alert("<spring:message code='MESSAGE.AUTH_NEED' text='PIE 목록에서 최소 1개 이상 선택해주세요.'/>");
// 		return false;
//  	}
 	
// 	if(!$('#actionForm').parsley().validate()){
// 		alert("<spring:message code='MESSAGE.VALID_USER' text='사용자정보 탭에 잘못 입력된 항목이 있습니다.'/>");
// 		return false;
// 	}
	
	return true;
}
</script>

<style>
#tabstrip-2, #tabstrip-3{
	padding-bottom : 0px;
}
</style>