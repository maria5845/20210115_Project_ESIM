<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
var isProcessing = false;

var userList = ${user_list};
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 340,
	toolbar: null,
	columns: [
				{headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template-load").html()),  width:30},
                { field: "user_id",	title: "<spring:message code='TABLE.COLUMN.USER_ID' text='사용자 ID' />",	width: 130, attributes:{ 'class':"text-center"}},
                { field: "user_nm",	title: "<spring:message code='TABLE.COLUMN.USER_NM' text='사용자 명' />",	width: 200, attributes:{ 'class':"text-center"}},
	],
	dataSource: userList,
	scrollable: {
	    virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
	},
	pageable: false
});

/**
 * 저장
 */
function alertAndModifyMenu() {
	if(isProcessing) return;
	isProcessing = true;
	
	if( $("#actionForm").parsley().validate() ){
		var msg = "<spring:message code='MESSAGE.SAVE' text='저장하시겠습니까?' />";
		var noti_user_id_str = getGridData();
		if( noti_user_id_str.length == 0 ){
			alert("<spring:message code='MESSAGE.NOTITRGT' text='통지 대상 사용자를 선택해주세요.' />");
			return;
		}
		
		if(confirm(msg)){
			ClAjax.fnCallAjax({
				url: "${rootPath}/alarm/alarmnotiActionAjax.do",
				paramJsn: {
					action_type			: $("#action_type").val()
					, noti_seq			: $("#noti_seq").val()
					, noti_nm			: $("#noti_nm").val()
					, noti_type			: $("#noti_type option:selected").val()
					, noti_attr_1		: $("#noti_attr_1").val() 
					, noti_attr_2		: $("#noti_attr_2").val() 
					, noti_user_id_str	: getGridData()
				},
				sucFn: function(data){
					if(data.result == true){
						$(".is-close:eq(0)").trigger("click");
						ClLayout.$owner().ClCRUD.fnListSearchIt({selector: '#grid', url: '/alarm/alarmnotimngAjax.do'});
					}else{
						ClAjax.fnAjaxSuccessErrHandle(data);
					}
				},
				errHandle: true,
				compltFn: function(data){
					isProcessing = false;
				}
			});
		}else{
			isProcessing = false;
		}
	}else{
		isProcessing = false;
	}
}

/**
 * Grid 에 checked 된 데이터 가져오기
 */
function getGridData(){
	var grid = $("#grid").data("kendoGrid");
	var rows = grid.tbody;
	var checked = rows.find("input:checkbox:checked")
	
	var str = "";
	for(var i=0; i<checked.length; i++){
		var tr = $(checked[i]).closest("tr");
		var d = grid.dataItem(tr);
		if( "" != str ){ str += ","; }
		str += d.user_id;
	}
	
	return str;
}
</script>