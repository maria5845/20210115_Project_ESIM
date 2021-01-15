<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="cont-header">
	<hgroup>
	    <h1>SV History Detail</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->

<div class="cont-body" style="padding: 10px;">
	<input type="hidden" name="history_seq" id="history_seq" value="${bean.history_seq}" />
	<table class="tb2">
		<colgroup>
			<col width="70px">
			<col width="130px">
		</colgroup>
		<thead>
			<tr>
				<th><spring:message code="TABLE.COLUMN.VAR_ID" text="수집항목 ID" /></th>
				<td>${bean.var_id}</td>
			</tr>
			<tr>
				<th><spring:message code='TABLE.COLUMN.LAST_MDFY_DT' text='변경일시'/></th>
				<td>${bean.last_mdfy_dt}</td>
			</tr>
			<tr>
				<th><spring:message code='TABLE.COLUMN.CURR_DATA_VAL' text='현재 값' /></th>
				<td>${bean.curr_data_val}</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th><spring:message code='TABLE.COLUMN.CHANGE_REASON' text='변경 이유'/></th>
				<td><input id="change_reason" name="change_reason" style="width: 100%"></td>
			</tr>
		</tbody>
	</table>    
</div>

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fr">
        	<button type="button" class="btn btn-lg btn-x90" onclick="javascript:fnVarHistAction();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>
    
