<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>LG PIE</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<!-- 호환성보기 해제(브라우저의 가장 최신 문서모드) -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<!--  -->
	<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="application"/>
	<c:set var="userSession" value="${sessionScope.userSession}" scope="session"/>
	<!--  -->	
	
 	<script src="${rootPath}/resource/ext/jquery/jquery-2.1.4.min.js"></script>
	<!-- Kendo UI -->
    <script src="${rootPath}/resource/ext/kendo/js/jszip.min.js"></script>
    <script src="${rootPath}/resource/ext/kendo/js/kendo.custom.min.js"></script>
    <script src="${rootPath}/resource/ext/kendo/js/kendo.qr_barcode.min.js"></script>

	<jsp:include page='${styleName}.jsp' flush="false"/>
	
	<script>
	var isAlerted = false;
	var defaultPrintOption = {
		portrait : true, //false; //true:세로,false:가로
		leftMargin : 15.0,
		topMargin : 20.0,
		rightMargin : 15.0,
		bottomMargin : 15.0,
		preview : true,
		printConfirm : true, //true:확인창 띄우기, false:다이렉트 인쇄
	}
	var printOption = {}
	
	function printPage(){
		var isIE = false;
		if(navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1){
			isIE = true;
		}else if(navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
			isIE = true
		}
		if(!isIE){
			alert("인쇄 기능은 Internet Explorer 브라우저에서만 사용가능합니다.")
			return;
		}
	
		if ( !factory.object ) {
			if(!isAlerted)
		    	alert("프린트 라이브러리를 설치하시면 자동으로 인쇄됩니다.");
			isAlerted = true;
			setTimeout(printPage, 1000);
		    return;
		}
		
		var opt = $.extend(true, defaultPrintOption, printOption);
	
		factory.printing.header = "";
		factory.printing.footer = "";
		//factory.printing.headerFooterFont = "font-family: Comic Sans MS; font-size: 36px; color: rgb(0,128,0); font-weight: bold;"
		factory.printing.portrait = opt.portrait;
		factory.printing.leftMargin = opt.leftMargin;
		factory.printing.topMargin = opt.topMargin;
		factory.printing.rightMargin = opt.rightMargin;
		factory.printing.bottomMargin = opt.bottomMargin;
		if(opt.preview){
			factory.printing.Preview();
		}else{
			factory.printing.Print(opt.printConfirm); //true:확인창 띄우기, false:다이렉트 인쇄
		}
		window.close();
	}
	</script>
</head>
<body onload="if(typeof printPageBefore == 'function'){printPageBefore();}printPage()" style="margin:0;padding:0;">

	<!-- MeadCo ScriptX -->
	<object id="factory" viewastext style="display:none"
	   classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
	   codebase="${rootPath}/component/scriptx/smsx.cab#Version=8,0,0,56">
	</object>

	
	<jsp:include page='${viewName}.jsp' flush="false"/>
	
</body>
</html>
