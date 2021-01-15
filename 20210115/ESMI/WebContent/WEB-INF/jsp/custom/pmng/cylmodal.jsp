<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="cont-header">
	<hgroup>
		<h1>Threshold History</h1>
	</hgroup>
</div>
	
<div class="cont-body">
	<div id="grid"></div>
</div>

<div class="cont-foot">
	<div class="action hasMargin">
		<div class="fr">
			<button type="button" class="btn btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
		</div>
	</div>
</div>


<script id="cmd-template" type="text/x-kendo-template">
	<button class="btn btn-lg" onclick="replaceData('#:dvc_id#','#:var_id#', '#:gen_dt#')">Select</button>
</script>