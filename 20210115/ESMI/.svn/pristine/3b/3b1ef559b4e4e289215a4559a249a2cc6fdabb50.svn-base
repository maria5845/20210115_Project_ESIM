<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">

/**
 * SV 변경 이유 저장
 */
function fnVarHistAction(){
	
	ClAjax.fnCallAjax({
		url: "${rootPath}/pmng/svHistActionAjax.do",
		paramJsn: {
			history_seq : $("#history_seq").val()
			, change_reason : $("#change_reason").val()
		},
		sucFn: function(data){
			if(data.result == true){
				$(".is-close:eq(0)").trigger("click");
				ClLayout.$owner().fnShowGridDetail(ClLayout.$owner().saved_var_arr);//부모 grid 정보 재조회
			}else{
				ClAjax.fnAjaxSuccessErrHandle(data);
			}
		},
		errHandle: true,
		compltFn: function(data){
			isProcessing = false;
		}
	});
}

</script>


