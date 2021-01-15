<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript">
	
//시작시 자동 권한그룹 선택
$("input[type=radio]:checked").click();

/**
 * 권한 그룹 radio Onclick 액션
 */
function fnOnclickUserAuthGr(selectedTr, _authGroupName) {
	
	// 선택된 권한그룹에 해당하는 메뉴권한 목록을 조회
	getUserAuthList($(selectedTr).val());
	
	// 우측 메뉴 상단에, 선택한 권한그룹 이름 표시
	$('#leftAuthListText').html(' - ' + _authGroupName);
}

/**
 * 선택된 권한그룹에 해당하는 메뉴권한 목록을 조회
 */
function getUserAuthList(_auth_gr_no) {
	
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url: '/setting/getauthgrlistAjax.do',
		paramJsn: {
			auth_gr_no: _auth_gr_no,
		},
		sucFn: function(data){
			var userAuthList = JSON.parse(data.data.list);
    		var htmlStr = "";
    		for(var i = 0; i < userAuthList.length; i++) {
    			
    			// 권한 줄때는 표출여부가 N인것도 권한을 줘야하므로 제거
    			htmlStr += '<tr><td>'
	    			+ userAuthList[i].menu_nm
	    			+ '</td><td>'
	    			+ userAuthList[i].menu_desc
	    			+ '</td><td class="text-right">'
	    			+ userAuthList[i].menu_depth
	    			+ '</td><td class="text-center">'
	    			+ '<input type="checkbox" name="chk_menu_no" ';
	    		
				if(userAuthList[i].auth_gr_no != null && userAuthList[i].auth_gr_no != '') htmlStr += ' checked ';
				
				htmlStr += ' value="' + userAuthList[i].menu_no + '"'
					+ ' p_menu_no="' + userAuthList[i].p_menu_no + '"'
    				+ ' onchange="fnChkChange(this)" />'
					+ '</td></tr>';
    		}

    		$("#userAuthList").html(htmlStr);
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
		},
	});
}

/**
 * 권한그룹 - 메뉴 매핑 저장
 */
function fnSaveUserAuthMenuMapp() {
	
	var userAuthGroupSeq = $("input[type=radio]:checked").val();
	/* var userAuthGroupChk = $("input[type=checkbox]:checked").val();
		
	if(userAuthGroupChk == null) {
		alert("권한을 선택해 주세요.");
	} else  */
	if(userAuthGroupSeq == null) {
		alert('<spring:message code="MESSAGE.AUTH_NEED" text="권한 그룹은 최소 1개 이상 선택해주세요."/>')
	} else {
		
		if(confirm("<spring:message code='MESSAGE.AUTH_SAVE' text='선택된 메뉴들로 권한을 수정하시겠습니까?'/>")){
			
			kendo.ui.progress($('body'), true);
			
			var bean_arr = [];
			$.each($('input[name=chk_menu_no]:checked'), function(){
				bean_arr.push({
					auth_gr_no: userAuthGroupSeq,
					menu_no: $(this).val(),
				});
			});
			
			ClAjax.fnCallAjax({
				url: '/setting/authgrmenuActionAjax.do',
				paramJsn: {
					auth_gr_no: userAuthGroupSeq,
					bean_arr: bean_arr,
				},
				sucFn: function(data){
					alert('<spring:message code="MESSAGE.APPLY.COMPLETE" text="적용이 완료되었습니다."/>')
				},
				errHandle: true,
				compltFn: function(){
					kendo.ui.progress($('body'), false);
				},
			});
		}
	}
}

/**
 * 권한부분 클릭, 전체선택
 */
function fnCheckAll(){
	var chk = $("input[name=chk_menu_no]:eq(0)").is(":checked");
	$("input[name=chk_menu_no]").prop("checked", !chk);
}

/**
 * 메뉴 체크 변경시 상위/하위의 메뉴 체크 상태 자동 변경
 */
function fnChkChange(t){
	var chk = t.checked;
	
	//상위로 에스컬레이션
	fnChkChangeParent($(t).attr("p_menu_no"), chk);
	//하위로 에스컬레이션
	fnChkChangeChild($(t).val(), chk);
}
function fnChkChangeParent(p_menu_no, chk){
	//체크 해제인 경우는 상위로 에스컬레이션 안함
	if(!chk) return;
	if(p_menu_no == "0") return;
	var $p = $("input[name=chk_menu_no][value=" + p_menu_no + "]");
	$p.each(function(idx,ele){
		$(ele).prop("checked", chk);
		fnChkChangeParent($(ele).attr("p_menu_no"), chk);
	})
}
function fnChkChangeChild(menu_no, chk){
	var $c = $("input[name=chk_menu_no][p_menu_no="+menu_no+"]");
	if($c.length == 0) return;
	$c.each(function(idx,ele){
		$(ele).prop("checked", chk);
		fnChkChangeChild($(ele).val(), chk);
	})
}


//권한그룹 삭제시 페이지 리로드
function reload() {
	$.ajax({
		url: '/setting/authgrmng.do',
		type: "GET",
		success:function(data){
			location.replace('/setting/authgrmng.do');
		},
		error:function(data){
			console.log(data);
		},
	})
}

</script>
