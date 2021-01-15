<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>

var isProcessing = false;
function fnPwdChgAction(){
	if(isProcessing) return;
	isProcessing = true;
	
	if($("#actionForm").parsley().validate()){
		if(confirm("<spring:message code='MESSAGE.SAVE' text='저장하시겠습니까?' />")){
			ClAjax.fnCallAjax({
				url: '/pwdchgpopActionAjax.do',
				paramJsn: $("#actionForm").serialize(),
				sucFn: function(data){
					alert("<spring:message code='MESSAGE.SAVECOMPLETE' text='저장이 완료되었습니다.' />");
					$("#PwdStr").focus();
					$(".is-close").eq(-1).trigger("click");
				},
				errHandle: true,
				compltFn: function(){
					isProcessing = false;
				},
			});
		}else{
			isProcessing = false;
		}
	}else{
		isProcessing = false;
	}
	
}

</script>
