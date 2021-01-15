<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript">
var isProcessing = false;
/**
 *  추가/수정 Action
 */
function submitCheck(){
	if(isProcessing) return;
	isProcessing = true;
	
	if($("#actionForm").parsley().validate()){
		if(confirm("<spring:message code='MESSAGE.SAVE' text='저장하시겠습니까?'/>")){
			$.ajax({
				url: "${rootPath}/setting/authgrActionAjax.do",
				type: "POST",
				data: $("#actionForm").serialize(),
				success:function(data){
					if(data.result == true){
						$(".is-close:eq(0)").trigger("click");
						ClLayout.$owner().location.href = '${rootPath}/setting/authgrmng.do';
// 						fnSearchIt();
					}else{
						ClAjax.fnAjaxSuccessErrHandle(data);
					}
				},
				error:function(data){
					console.log(data);
					ClAjax.fnAjaxErrHandle(data);
				},
				complete:function(data){
					isProcessing = false;
				}
			})
		}else{
			isProcessing = false;
		}
	}else{
		isProcessing = false;
	}
}


<c:if test="${action_type != 'add'}">
	// 메뉴 정보 데이터 저장
	var parentData = ${pMenuList};
	var childData = ${menuList};
	
// 	console.log(childData);
	
	// 선택된 메뉴 정보
	var ccdata = '';
	var ppdata = '';
	
	if(parentData != null){
		
			ccdata = ${bean.home_menu_no};
			
			var tempData = childData.filter(function (childData) { return childData.menu_no == ccdata });
			if(ppdata == null || ppdata == "" && tempData != '') {
// 				console.log("ccdata : "+ccdata);	
// 				console.log("childData : "+childData);	
// 				console.log("tempData : "+tempData[0]);	
				ppdata = tempData[0].p_menu_no;
			} else {
				ppdata = 1;
			}
// 			console.log("ppdata : "+ppdata);
			
			var pMenu = $("#pMenuSel").kendoDropDownList({
			    dataTextField: "menu_nm",
			    dataValueField: "menu_no",
			    noDataTemplate: 'No Data! Please check the menu data.',
			    dataSource: parentData
			});
			var pMenuList = $("#pMenuSel").data("kendoDropDownList");
			
			if(pMenuList.dataSource._data.length == 0) {
				var menu = $("#menuSel").kendoDropDownList({
					noDataTemplate: 'No Data! Please choose another menu.'
				});
			}else {
				var menu = $("#menuSel").kendoDropDownList({
					cascadeFrom: "pMenuSel",
				    cascadeFromField: "p_menu_no",
				    cascadeFromParentField: "menu_no",
				    dataTextField: "menu_nm",
				    dataValueField: "menu_no",
				    noDataTemplate: 'No Data! Please choose another menu.',
				    dataSource: childData
				});
			}
			
		
	}else{
		alert('please check menu information');
	}
	
	// 메뉴 번호 선택된 정보 불러오기.
	if(ccdata != null){
		
		pMenuList.select(function(dataItem) {
		    return dataItem.menu_no === ppdata;
		});
		
		var menuList = $("#menuSel").data("kendoDropDownList");
		menuList.select(function(dataItem) {
		    return dataItem.menu_no === ccdata;
		});
		
	}
</c:if>

// 홈 여부 미사용시 셀렉트 박스 disable
$(document).ready(function() {
	var radioVal = $('input[name="home_yn"]:checked').val();
	if(radioVal == "N") {
// 		console.log('radioVal : N');
		$("#pMenuSel").attr("required", false);
    	$("#menuSel").attr("required", false);
		$("#pMenuSel").data("kendoDropDownList").enable(false);
		$("#menuSel").data("kendoDropDownList").enable(false);
    	$("#pMenuSel").data("kendoDropDownList").value("");
    	$("#menuSel").data("kendoDropDownList").value("");
	} 
	
	$('input[name=home_yn]').click(function () {
        var radioVal = $('input[name="home_yn"]:checked').val();
        if (radioVal == "Y") {
//         	console.log('radioVal : Y222222');
        	$("#pMenuSel").attr("required", true);
        	$("#menuSel").attr("required", true);
        	$("#pMenuSel").data("kendoDropDownList").enable(true);
        	$("#menuSel").data("kendoDropDownList").enable(true);
        } else {
//     		console.log('radioVal : N222222');
        	$("#pMenuSel").attr("required", false);
        	$("#menuSel").attr("required", false);
        	$("#pMenuSel").data("kendoDropDownList").enable(false);
        	$("#menuSel").data("kendoDropDownList").enable(false);
        	$("#pMenuSel").data("kendoDropDownList").value("");
        	$("#menuSel").data("kendoDropDownList").value("");
        }
     });
});


</script>

