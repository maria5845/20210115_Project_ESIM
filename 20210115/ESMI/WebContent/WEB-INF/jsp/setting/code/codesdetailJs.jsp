<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- <script src="${rootPath}/resource/ext/jquery/jquery.mask.min.js"></script> --%>


<script type="text/javascript">
/**
* 코드 카테고리 Selectbox onchange 액션
*/
function fnchangeCmcat(cat_cd){

	ClAjax.fnCallAjax({
		url: '/setting/getcmcdcntAjax.do',
		paramJsn: {cat_cd: cat_cd},
		sucFn: function(data){
			
			$("#disp_ord > option").remove();
			for(var i = 1; i <= data.data.cnt; i++){
				$("#disp_ord").append("<option value='" + i + "'>" + i + "</option>")
			}
			$("#disp_ord").kendoDropDownList();
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
		},
	});
}

</script>
