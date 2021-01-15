<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<!-- 메뉴 네비게이션 -->
	<div class="m-form">
		<div class="in">
			<table id="hdrListSrch" class="inForm">
				<tbody>
					<tr>
						<td id="menuNavi"></td>
					</tr>
					<tr class="display-none">
						<td>
							<!-- 현재 페이지의 메뉴번호(메뉴 추가시 부모번호가 될 번호) -->
							<input type="hidden" name="p_menu_no" id="p_menu_no" value="${bean.p_menu_no}">
						</td>
					</tr>
				</tbody>
            </table>
        </div>
    </div>


    <div class="grid-wrap">
        <div class="m-option top">
     		<div class="fr">
     			<button type="button" class="btn btn-add2 btn-medium btn-x60"
     				onclick="ClPopup.fnOnClickModalOpen('/setting/menudetail.do', 'menu_no=0&p_menu_no='+$('#p_menu_no').val()+'&action_type=add');"><spring:message code="BUTTON.ADD" text="추가" />
				</button>
            </div>
        </div>

		<input type="hidden" id="page" value="1">
		<div id="grid"></div>
		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
			onclick="javascript:ClPopup.fnOnClickModalOpen( '/setting/menudetail.do', 'menu_no=#:menu_no#&p_menu_no=#:p_menu_no == null ? '0' : p_menu_no#&action_type=modify')">
			<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>

			<button type="button" class="btn btn-grid-del btn-small"
			onclick="javascript:ClCRUD.fnActionIt({selector: '\\#grid', url: ClLayout.fnGetTabJsn('urlList')
				, actionUrl: '/setting/menuActionAjax.do', param: 'action_type=delete&menu_no=#:menu_no#&p_menu_no=#:p_menu_no#&before_disp_ord=#:disp_ord#'});">
			<spring:message code="BUTTON.DELETE" text="삭제" /></button>
		</script>
    </div>
