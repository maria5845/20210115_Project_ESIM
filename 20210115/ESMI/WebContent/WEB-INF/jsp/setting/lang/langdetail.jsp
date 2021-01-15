<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1><spring:message code="JS.MODAL.HEADER.LANG" text="다국어" /></h1>
	</hgroup>
	<button type="button" class="close-pop is-close">&nbsp;</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<form id="actionForm" method="post" action="">
			<input type="hidden" id="lang_base_seq" name="lang_base_seq" value="${bean.lang_base_seq }" />
			<input type="hidden" id="action_type" name="action_type" value="${action_type}" />
			<input type="hidden" id="lang_msg_cd_org" name="lang_msg_cd_org" value="${bean.lang_msg_cd}"/>
		    <div class="pd-a13">
		    <table class="tb2">
		    	<colgroup>
					<col width="200">
					<col>
				</colgroup>
				<tbody>
				
					<tr>
		        		<th scope="row" class="hasBg hasPad text-center">
		        			<!-- Tooltip -->
							<div class="tooltipOuter">
								<i class="fa fa-question-circle"></i>
								<span class="tooltipDesc" style="width: 350px;">
									<spring:message code="JS.DIV.TOOLTIP.LANG.LANG_MSG_CD" 
										text="다국어 메시지 코드 규칙 : 영문 대문자, 숫자, 마침표(.), 밑줄(_)만 입력 가능합니다.<br/>(최대100자리)" />
								</span>
							</div>
		        			<spring:message code="TABLE.COLUMN.LANG_MSG_CD" text="다국어 메시지 코드" /><span class="red">*</span>
		        		</th>
		        		
		        		<td class="hasPad">
		        			<input type="text" name="lang_msg_cd" class="itx itx-p100" 
			        			value="<c:out value="${bean.lang_msg_cd}"></c:out>" 
			        			pattern="^[A-Z0-9._]*$" 
			        			maxlength="100" required
			        			data-parsley-error-message='<spring:message code="JS.VALIDMSG.LANG.LANG_MSG_CD" 
			        				text="영문 대문자, 숫자, 마침표(.), 밑줄(_)만 입력 가능합니다.(최대100자리)" />'
		        			/>
						</td>
		    		</tr>
		    		
		    		
					<c:forEach var="i" items="${lang_cd_list}" varStatus="vs">
		    		<tr>
		        		<th scope="row" class="hasBg hasPad text-center">
		        			<spring:message code="CODE.${i.cat_cd}.${i.cd}" text='<c:out value="${i.cd_val}"></c:out>' /><span class="red">*</span>
		        		</th>
		        		<td class="hasPad">
		        			<c:if test="${i.cd eq 'KO' }">
			        			<textarea rows="3" name="lang_msg_ko" class="itx itx-p100"
			        				maxlength="1000" required 
			        			><c:out value="${bean.lang_msg_ko}"></c:out></textarea>
		        			</c:if>
		        			<c:if test="${i.cd eq 'EN' }">
			        			<textarea rows="3" name="lang_msg_en" class="itx itx-p100"
			        				maxlength="1000" required 
			        			><c:out value="${bean.lang_msg_en}"></c:out></textarea>
		        			</c:if>
		        			<c:if test="${i.cd eq 'CN' }">
			        			<textarea rows="3" name="lang_msg_cn" class="itx itx-p100"
			        				maxlength="1000" required 
			        			><c:out value="${bean.lang_msg_cn}"></c:out></textarea>
		        			</c:if>
		        			<c:if test="${i.cd eq 'PL' }">
			        			<textarea rows="3" name="lang_msg_pl" class="itx itx-p100"
			        				maxlength="1000" required 
			        			><c:out value="${bean.lang_msg_pl}"></c:out></textarea>
		        			</c:if>
		        		</td>
		    		</tr>
					</c:forEach>
		    		
				</tbody>
			</table>
			</div>
		</form>
	</div>
</div>

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
            <button type="button" class="btn btn-lg btn-x90" 
				onclick="javascript:ClCRUD.fnActionIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList'), actionUrl: '/lang/langActionAjax.do'
						, param: '#actionForm', validFnc: function(){return $('#actionForm').parsley().validate();}, mdClsBool: true,});">
				<spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>
