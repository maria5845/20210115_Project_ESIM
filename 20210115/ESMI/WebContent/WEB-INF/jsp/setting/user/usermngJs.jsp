<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
//페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/setting/userAjax.do');
	
// Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 680,
	toolbar: null,
	columns: [
// 				{ headerTemplate: '<input type="checkbox" id="checkAll" />',	template: kendo.template($("#pk-template").html()),  width:44, attributes:{ 'class':"text-center"}},
				{ field: "auth_gr_nm",		title: "<spring:message code='TAB.BUTTON.AUTHGROUP' text='권한 그룹' />",				width: 120, attributes:{ 'class':"text-center"}},
				{ field: "user_id",			title: "ID",					width: 150},
				{ field: "user_nm",			title: "User Name",				width: 200},
// 				{ field: "empno",			title: "사번",					width: 170},
// 				{ field: "dept_nm",			title: "부서",					width: 170},
// 				{ field: "user_position",	title: "직책",					width: 150},
				{ field: "mobile_tel_no",	title: "<spring:message code='TABLE.COLUMN.MOBILE_TEL_NO' text='전화번호' />",				width: 150, attributes:{ 'class':"text-center"}},
				{ field: "user_email",		title: "<spring:message code='CODE.NOTI_TYPE.EMAIL' text='E-Mail' />",				width: 200},
				{ field: "user_desc",		title: "Note",					width: 397 },
				{ title: "<spring:message code='GRID.HEADER.WORK' text='작업' />", template: kendo.template($("#cmd-template").html()), 	width:90, attributes:{ 'class':"text-center"}},
       ],
       scrollable: {
           virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
       },
});

ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList')});

/**
 * 검색 자동완성 기능
 */
// 사용자 명
ClKendo.fnCreateAutoComplete({
 	selector: '#user_nm',
 	dataSource:{
 		transport:{
 			parameterMap: function(data, oper){
				var filter = $("#user_nm").data('kendoAutoComplete').dataSource.filter();
                data.search_type = "user_nm";
                if( filter.filters.length > 0 ){
              	   data.search_value = filter.filters[0].value;
                }
				return data;
 			}
 		}
 	}
});
// 사용자 ID
ClKendo.fnCreateAutoComplete({
 	selector: '#user_id',
 	dataSource:{
		transport: {
            parameterMap: function(data, operation) {
                var filter = $('#user_id').data('kendoAutoComplete').dataSource.filter();
                data.search_type = "user_id";
                if( filter.filters.length > 0 ){
             	   data.search_value = filter.filters[0].value;
                }
				return data;
            },
        },
	},
});


// -- 검색 자동완성 기능
</script>

