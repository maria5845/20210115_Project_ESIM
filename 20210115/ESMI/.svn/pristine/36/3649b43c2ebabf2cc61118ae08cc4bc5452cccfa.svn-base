<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="${rootPath}/resource/ext/ace1.3.3/ace.js"></script>

<%-- <link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/kendo/css/kendo.common-material.min.css"> --%>
<%-- <link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/resource/ext/kendo/css/kendo.material.min.css"> --%>


<script type="text/javascript">
//************************************************

<c:if test="${action_type eq 'modify'}">
	var sel_var_id = '${var_id}';
	var based_var_id = '${based_var_id}';
</c:if>

<c:if test="${!empty variable_list}">
	var vari_list = ${variable_list};
	var sv_vari_list = ${sv_variable_list};
	var pv_vari_list = ${pv_variable_list};
</c:if>

var set_type = '${set_type}'

//************************************************




/**
 * 저장
 */
function fnVarRuleAction() {
	// 	Validation 체크
	if(!$("#actionForm").parsley().validate())return false;

	ClAjax.fnCallAjax({
		url: "${rootPath}/pmng/varRuleActionAjax.do",
		paramJsn: {
			action_type	: $("#action_type").val()
			, var_id : $("#var_id").val()
			, set_type : $("#set_type").val()
			, based_var_id : $("#based_var_id").val()
			, green_max : $("#green_max").val()
			, green_min	: $("#green_min").val()
			, yellow_max : $("#yellow_max").val()
			, yellow_min : $("#yellow_min").val()
			, red_max : $("#red_max").val()
			, red_min : $("#red_min").val()
			, rule_seq : $("#rule_seq").val()
		},
		sucFn: function(data){
			if(data.result == true){
				$(".is-close:eq(0)").trigger("click");
				ClLayout.$owner().ClCRUD.fnListSearchIt({selector: '#grid', url: '/pmng/varRulemngAjax.do'});
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


$(document).ready(function(){
	if(set_type == 'SV'){
		$("#var_id").kendoDropDownList({
	        dataTextField: "var_id",
	        dataValueField: "var_id",
	        filter: "contains",
	        dataSource: sv_vari_list
	    });
	}
	
	if(set_type == 'PV'){
		$("#var_id").kendoDropDownList({
	        dataTextField: "var_id",
	        dataValueField: "var_id",
	        filter: "contains",
	        dataSource: pv_vari_list
	    });
		$("#based_var_id").kendoDropDownList({
	        dataTextField: "var_id",
	        dataValueField: "var_id",
	        filter: "contains",
	        dataSource: sv_vari_list
	    });
	}

	
	if("${action_type}" == 'modify'){
	    var varIdList = $("#var_id").data("kendoDropDownList");
	    
	    if(set_type == 'CTQ'){
	    	$('#var_id option[value='+sel_var_id+']').attr('selected', 'selected');
	    }else{
		    varIdList.select(function (dataItem) {
		        return dataItem.var_id === sel_var_id;
		    });
			
		    if(set_type == 'PV'){
				var baseVarIdList = $("#based_var_id").data("kendoDropDownList");
			    
			    baseVarIdList.select(function (dataItem) {
			        return dataItem.var_id === based_var_id;
			    });
		    }    		    	
	    }
	}
});

// 사용자 ID
// ClKendo.fnCreateAutoComplete({
//  	selector: '#var_id',
//  	dataSource:{
// 		transport: {
//             parameterMap: function(data, operation) {
//                 var filter = $('#var_id').data('kendoAutoComplete').dataSource.filter();
//                 data.search_type = "var_id";
//                 if( filter.filters.length > 0 ){
//              	   data.search_value = filter.filters[0].value;
//                 }
// 				return data;
//             },
//         },
// 	},
// });


// if('PV' == '${set_type}'){
// 	//사용자 ID
// 	ClKendo.fnCreateAutoComplete({
// 	 	selector: '#based_var_id',
// 	 	dataSource:{
// 			transport: {
// 	            parameterMap: function(data, operation) {
// 	                var filter = $('#var_id').data('kendoAutoComplete').dataSource.filter();
// 	                data.search_type = "var_id";
// 	                if( filter.filters.length > 0 ){
// 	             	   data.search_value = filter.filters[0].value;
// 	                }
// 					return data;
// 	            },
// 	        },
// 		},
// 	});
// }

</script>

