<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../inc/config.jsp" %>
</head>

<body>

	<div class="l-wrap responsive">

		<!--Area header -->
		<%@ include file="../inc/inc_header.jsp" %>

		<div class="l-container">

			<!-- 컨텐츠영역 -->
			<div class="l-content" style="height: 853px !important;">
				<div class="section" id="iframeSection">
					<iframe src="" id='ifrm_tab_0' frameborder='0' class='include tab_iframe' style="display:none;"></iframe>
				</div>
			</div>
				
			
			<!-- 하단 탭부분 -->
			<div class="l-aside">
				<div class="l-tabs" id="tabContainer">
					<input type="hidden" name="hometab" value="${hometab.cd_val }"/>
					<div id="tabAllClose" style="float:right; margin: 8px 0 0 20px; font-size: 14px; display:none;">
						<button type="button" onclick="ClLayout.fnTabAllClose()">
							<span class="k-icon k-i-close k-i-x"></span>
							<spring:message code='BUTTON.ALLTABCLOSE' text='Close all tab' />
						</button>
					</div>
					<p class="copyright fr">Copyright &copy; 2020 LG Electronics. allright reserved.</p>
					<ul class="items fl" id="tabGroup">
						<li class="act" id="li_tab_0" topMenuId="Home0">
							<c:if test="${!empty hometab && hometab.cd_val eq 'Y' }">
								<a href="javascript:ClLayout.fnTabSelect(0);void(0);">Home</a>
							</c:if>
						</li>
					</ul>
				</div>
			</div>


			<!-- global iframe -->
			<iframe id="winPrintFrame" name="winPrintFrame" src="" frameborder="0" scrolling="no" style="width:0px; height:0px; overflow:auto; position:absolute; border:none; top: -9999px;"></iframe>
			<iframe id="winExcelFrame" name="winExcelFrame" src="" frameborder="0" scrolling="no" style="display:none;width:0px;height:0px;position:absolute;left:0;top:0;border:none;"></iframe>
			
			
			<!--Area footer -->
			<%@ include file="../inc/inc_footer.jsp" %>
		</div>
		
		<!-- Kendo Notification -->
		<div id="kendoNotification">
			<span id="popupNoti"></span>
		</div>
	</div>

	<!-- Common Js File -->
	<script>var frameBool = true;</script>
	<%@include file="../inc/config_commonJs.jsp" %>

</body>
</html>
