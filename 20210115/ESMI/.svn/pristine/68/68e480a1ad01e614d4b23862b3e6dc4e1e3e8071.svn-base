<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	
<c:forEach items="${list}" var="i" varStatus="vs" >
	<c:if test="${(vs.index) % 12 == 0}">
	<div style="page-break-after: always;height:0px;"></div>
	</c:if>

	<!-- 용지 사이즈 : 100mm X 102.5mm => pixcel : 377 X 387 -->
	<!-- 상하좌우 여백 5mm = 18px -->	
	<!-- pixel to mm 단위 변환 -->
	<!-- http://www.translatorscafe.com/unit-converter/typography/compact/ -->
	<div style="float:left;width:70mm;height:31mm;margin:5mm;overflow:hidden;">
	<table style="table-layout:fixed;width:100%;height:100%;border:1px solid #000;">
		<colgroup>
			<col width="" />
		</colgroup>
		<tr>
			<td colspan="3" rowspan="3"><div id="td_qr_${vs.index}"></div></td>
		</tr>
		<tr>
			<td colspan="4"><img src="${rootPath}/resource/img/header_logo_green_41.png" style="width: 45mm" alt="로그"></td>
		</tr>
		<tr>
			<td style="font-size:18px;height:18mm;line-height:105%;"><c:out value="${i.user_position}"></c:out></td>
			<td colspan="3"><c:out value="${i.user_nm}"></c:out></td>
		</tr>
	</table>
	</div>
</c:forEach>
<script>
//프린트 옵션 변경
printOption = {
	//portrait : true, //false; //true:세로,false:가로
	leftMargin : 10.0,
	topMargin : 10.0,
	rightMargin : 10.0,
	bottomMargin : 10.0,
	preview : true,
	printConfirm : false, //true:확인창 띄우기, false:다이렉트 인쇄
}

//인쇄 시작전에 수행할 js는 여기에 넣는다.
function printPageBefore(){
	<c:forEach items="${list}" var="i" varStatus="vs" >
		$("#td_qr_${vs.index}").kendoQRCode({
			value: "U=${i.user_id}",
			size: 108,
			color: "#000000",
// 			encoding: "UTF_8",
			errorCorrection: "H",
		})
	</c:forEach>
}
</script>	