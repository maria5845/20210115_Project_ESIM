<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko" class="login-type2 k-webkit k-webkit60">
<head>
	<%@include file="../common/inc/config.jsp" %>
</head>


<body>

    <div class="l-wrap">

        <div class="l-login">
            <header>
                <h2>Login</h2>
            </header>

            <div class="contains">
                <label>
                    <i class="lab">ID</i>
                    <input type="text" name="IdStr" autocomplete="off" class="itx" id="IdStr" autofocus />
                </label>
                <label>
                    <i class="lab">PW</i>
                    <input type="password" name="PwdStr" autocomplete="off" class="itx" id="PwdStr" />
                </label>
            </div>

            <footer>

                <div class="action">
                    <button type="button" onclick="goLogin()" class="btn btn-lg btn-x303"><spring:message code="BUTTON.LOGIN" text="Sign In"/></button>
                </div>
                <!-- // .action -->

                <div class="option" style="height: 30px; line-height: 30px;">

                    <input type="checkbox" id="remember" class="k-checkbox" name="remember">
                    <label class="k-checkbox-label" for="remember" style="transform: translate(57px,0);">Save ID</label>
<!--                     <select id="selSite" style="float:right;width:200px;margin-right:20px" onchange="javascript:selSite()"> -->
<!-- 						<option value="">== 다른 사이트로 이동 ==</option> -->
<!-- 						<option value="http://localhost/control/controlmain.do">설비상태 관제</option> -->
<!-- 						<option value="http://tectone.iptime.org:8680/control/controlmain.do">설비상태 관제</option> -->
<!-- 						<option value="http://192.168.56.206:8080/control/controlmain.do">설비상태 관제</option> -->
<!-- 					</select> -->
			
					<select id="lang" name="lang" style="width: 120px; visibility:hidden " class="fr pd-r10">
						<c:forEach items="${lang_list }" var="i">
							<%-- //<option value="${i.cd }"><c:out value="${i.cd_val }"></c:out></option> --%>
							<option value="${i.cd }"><spring:message code="CODE.LANG_CD.${i.cd }" text="한국어" /></option>
						</c:forEach>
                   	</select> 


                </div>
                <!-- // .option -->

            </footer>
        </div>

    </div>
    
    <%@ include file="../login/loginJs.jsp" %>

</body>
</html>



