<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
// 사용자 추가시, 비밀번호 0000 고정
<c:if test="${action_type eq 'add'}">
$("#actionForm").find("input[name=user_pwd]").val("0000");
$("#actionForm").find("input[name=user_pwd_confirm]").val("0000");
$("#pwd_div").css("display","none");
$("#pwd_cf_div").css("display","none");
</c:if>


//대상 사용자 탭 생성
ClKendo.fnCreateTab({
	selector: '#tabstrip',
	tabPosition: "left",
	animation: { open: { effects: "" } }
});

//========================================== 탭내부 권한그룹/PIE목록 테이블
ClKendo.fnCreateGrid({
	selector: '#grid_authgr',
	height: 340,
	toolbar: null,
	columns: [
				{headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template-authgr").html()), attributes:{ 'class':"text-center"},  width:45},
                { field: "auth_gr_nm",		title: "<spring:message code='TABLE.COLUMN.AUTH_GR_NM' text='권한 그룹 명'/>",			width: 150, attributes:{ 'class':"text-center"}},
                { field: "auth_gr_desc",	title: "<spring:message code='TABLE.COLUMN.AUTH_GR_DESC' text='권한 그룹 설명'/>",		width: 200, attributes:{ 'class':"text-center"}},
	],
	dataSource: ${authGr_list},
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	pageable: false,
});

// ClKendo.fnCreateGrid({
// 	selector: '#grid_pielist',
// 	height: 340,
// 	toolbar: null,
// 	columns: [
// 				{headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template-pielist").html()), attributes:{ 'class':"text-center"},  width:45},
// 	            { field: "pie_nm",	title: "<spring:message code='TABLE.COLUMN.PIE_NM' text='PIE 명'/>",		width: 180, attributes:{ 'class':"text-center"}},
// 	            { field: "pie_ip",	title: "<spring:message code='TABLE.COLUMN.PIE_IP' text='PIE IP'/>",		width: 140, attributes:{ 'class':"text-center"}},
// 	],
// 	dataSource: ${pie_list},
// 	scrollable: {
// 	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
// 	},
// 	pageable: false,
// });
//========================================== 탭내부 권한그룹/PIE목록 테이블


/**
 * 저장
 */
function fnUserAction() {
	var p = $('#actionForm').serializeObject();
	
	var authgr_arr = [];
	$.each($('#grid_authgr tbody > tr input[type=checkbox]:checked'), function(){
		authgr_arr.push({
			user_id: p.user_id,
			auth_gr_no: this.value,
		});
	});
	
	var pielist_arr = [];
	$.each($('#grid_pielist tbody tr input[type=checkbox]:checked'), function(){
		pielist_arr.push({
			user_id: p.user_id,
			pie_id: this.value
		});
	});
	
	p.authgr_arr = authgr_arr;
	p.pielist_arr = pielist_arr;
	
	ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/setting/userActionAjax.do', 
		param: p, 
		validFnc: function(){return fnValidUser();}, 
		mdClsBool: true,
	});
}

/**
 * Validate
 */
function fnValidUser(){
// 	var validate_PASSWORD = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W])(?!.*\s)(?!.*\\t).{8,20}$/;
	var password_1 = $("#actionForm").find("input[name=user_pwd]").val();
	var password_2 = $("#actionForm").find("input[name=user_pwd_confirm]").val();

 	if(password_1 != password_2) {
		alert("<spring:message code='MESSAGE.USER_PW' text='비밀번호와 비밀번호 확인이 일치하지 않습니다.'/>");
		$("#actionForm").find("input[name=user_pwd_confirm]").focus();
		return false;
	} else if($("#actionForm").find("input[name=user_nm]").val() == "") {
		alert("<spring:message code='MESSAGE.USER_NM' text='이름을 입력해 주세요.'/>");
		$("#actionForm").find("input[name=user_nm]").focus();
		return false;
	}
 
 	if($('#grid_authgr').find('input[type=checkbox]:checked').length < 1){
 		alert("<spring:message code='MESSAGE.AUTH_NEED' text='권한 그룹은 최소 1개 이상 선택해주세요.'/>");
		return false;
 	}
 	
//  	if($('#grid_pielist').find('input[type=checkbox]:checked').length < 1){
//  		alert("<spring:message code='MESSAGE.AUTH_NEED' text='PIE 목록에서 최소 1개 이상 선택해주세요.'/>");
// 		return false;
//  	}
 	
	if(!$('#actionForm').parsley().validate()){
		alert("<spring:message code='MESSAGE.VALID_USER' text='사용자정보 탭에 잘못 입력된 항목이 있습니다.'/>");
		return false;
	}
	
	return true;
}


/**
 * 메뉴 체크 변경시 상위/하위의 메뉴 체크 상태 자동 변경
 */
// function fnChkChange(t){
// 	var chk = t.checked;
	
// 	//상위로 에스컬레이션
// 	fnChkChangeParent($(t).attr("p_tree_seq"), chk);
// 	//하위로 에스컬레이션
// 	fnChkChangeChild($(t).val(), chk);
// }
// function fnChkChangeParent(p_tree_seq, chk){
// 	//체크 해제인 경우는 상위로 에스컬레이션 안함
// 	if(!chk) return;
// 	if(p_tree_seq == "0") return;
// 	var $p = $("#grid_tree tbody tr input[name=tree_seq][value=" + p_tree_seq + "]");
// 	$p.each(function(idx,ele){
// 		$(ele).prop("checked", chk);
// 		fnChkChangeParent($(ele).attr("p_tree_seq"), chk);
// 	})
// }
// function fnChkChangeChild(tree_seq, chk){
// 	var $c = $("#grid_tree tbody tr input[name=tree_seq][p_tree_seq="+tree_seq+"]");
// 	if($c.length == 0) return;
// 	$c.each(function(idx,ele){
// 		$(ele).prop("checked", chk);
// 		fnChkChangeChild($(ele).val(), chk);
// 	})
// }
</script>

<style>
#tabstrip-2, #tabstrip-3{
padding-bottom : 0px;
}
</style>