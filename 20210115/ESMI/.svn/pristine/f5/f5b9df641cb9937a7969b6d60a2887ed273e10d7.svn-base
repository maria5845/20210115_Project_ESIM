<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
$(document).ready(function() {
	
	// 컨트롤러에서 시간 가져옴
	var _todate = '${todate}';
	var _s_year = '${s_year}';
	var _s_month = '${s_month}' -1;
	var _s_day = '${s_day}';
	var _s_hour = '${s_hour}';
	var _s_minutes = '${s_minutes}';
	var _s_seconds = '${s_seconds}';
	var _format = 'yyyy-MM-dd a/p hh:mm:ss';
	
	var	to_date	= new Date();
	if(_s_year != null){
		to_date = new Date(_s_year, _s_month, _s_day, _s_hour, _s_minutes, _s_seconds, 00);
	}
	console.log("------------>"+to_date.getMonth)
	
	fnCurrentTime(_format, to_date);

	$(".divitem").on("mouseover", function(){
		$(".divitem").removeClass("hov");
		$(this).addClass("hov");
	}).on("mouseout", function(){
		$(this).removeClass("hov");
	})
	$(".info-pan").on("mouseenter", function(){
		$("#info_nick").show();
		$(".divitem:eq(0)").addClass("hov");
	})
	$(".info-pan").on("mouseleave", function(){
		$("#info_nick").hide();
		$(".divitem").removeClass("hov");
	})
	$(".language").on("mouseenter", function(){
		$("#chg_lang").show();
		$(".divitem:eq(2)").addClass("hov");
	})
	$(".language").on("mouseleave", function(){
		$("#chg_lang").hide();
		$(".divitem").removeClass("hov");
	})
	
	var lang = "${serverLocale}".toUpperCase();
	$("#baselang").text(" " + lang);
	if (lang == "EN") {
		$("#baselang").text(" " + "EN");
	}
})

// window.onload = function(){
// 	fnCurrentTime('yyyy-MM-dd a/p hh:mm:ss');
// }

/**
 * 우측 상단 날짜 출력
 */
function fnCurrentTime(_format, date){
	var clock_date = document.getElementById("nowdate");
	clock_date.innerHTML = ClDate.fnDateFormat(_format, date);
	//setTimeout("fnCurrentTime('" + _format + "')", 1000);
	setTimeout("fnCurrentTime('" + _format + "', '" + date + "')", 1000);
}

/**
 * PIE V2 테마를 선택한 테마로 변경
 * (white, black)
 */
function fnSetTheme(_param){
	$.removeCookie('PIE_theme', { path: '/' });
	$.cookie('PIE_theme', _param , { path: '/' });
	ClLayout.fnChangePIEThema();
}
</script>

<header class="l-header">
	<h1 class="l-brand">
	   	<a href="#" class="crsr-def" onclick="return false;">
   			<img src="/resource/img/logo/LGNormal.png" width="32"/>
			<span>${left_top_title.cd_val}</span>
		</a>
	</h1>

	<nav id="gnb" class="l-gnb">
		<ul class="items">
			<c:forEach items="${top1MenuList}" var="topMenuItem" varStatus="topMenuStat_1">
			<li class="item1depth" id="li_menu_<c:out value="${topMenuItem.menu_no}"></c:out>">
				<a 
					
					<c:if test="${fn:contains(topMenuItem.menu_nm, 'PKT-T')}">
					   <c:set var="dvc_gr_type" value="PKT-T"/>
					</c:if>
					<c:if test="${fn:contains(topMenuItem.menu_nm, 'PKT-EC')}">
					   <c:set var="dvc_gr_type" value="PKT-EC"/>
					</c:if>
					<c:if test="${fn:contains(topMenuItem.menu_nm, 'L&S')}">
					   <c:set var="dvc_gr_type" value="LNS"/>
					</c:if>
					<c:if test="${fn:contains(topMenuItem.menu_nm, 'N&D')}">
					   <c:set var="dvc_gr_type" value="NND"/>
					</c:if>
					<c:if test="${topMenuItem.menu_addr ne '' && topMenuItem.menu_addr ne '#'}">
                       href="${rootPath}${topMenuItem.menu_addr}?menu_no=${topMenuItem.menu_no}&header_menu=Y&dvc_gr_type=<c:out value="${dvc_gr_type}"></c:out>" 
                    </c:if>
					menu_no="<c:out value="${topMenuItem.menu_no}"></c:out>" >
					<span><spring:message code="MENU.${topMenuItem.menu_no}" text="${topMenuItem.menu_nm}" /></span>
				</a>

				<!-- Depth2 -->
				<ul class="items">
					<c:forEach items="${top2MenuList }" var="top2MenuItem" varStatus="topMenuStat_2">
				 	<c:if test="${top2MenuItem.p_menu_no == topMenuItem.menu_no }">
					 <li>
						 <a 
						    <c:if test="${fn:contains(top2MenuItem.menu_nm, 'PKG-T')}">
		                       <c:set var="dvc_gr_type" value="PKG-T"/>
		                    </c:if>
		                    <c:if test="${fn:contains(top2MenuItem.menu_nm, 'PKG-EC')}">
		                       <c:set var="dvc_gr_type" value="PKG-EC"/>
		                    </c:if>
		                    <c:if test="${fn:contains(top2MenuItem.menu_nm, 'L&S')}">
		                       <c:set var="dvc_gr_type" value="LNS"/>
		                    </c:if>
		                    <c:if test="${fn:contains(top2MenuItem.menu_nm, 'N&D')}">
		                       <c:set var="dvc_gr_type" value="NND"/>
		                    </c:if>
						 	<c:if test="${top2MenuItem.menu_addr ne '' && top2MenuItem.menu_addr ne '#'}"> 
						 	href="${rootPath}${top2MenuItem.menu_addr}?menu_no=${top2MenuItem.menu_no}&header_menu=Y&dvc_gr_type=<c:out value="${dvc_gr_type}"></c:out>" target="ifrm_tab_0"
						 	</c:if> 
						 	menu_no="<c:out value="${top2MenuItem.menu_no}"></c:out>">
						 	<spring:message code="MENU.${top2MenuItem.menu_no}" text="${top2MenuItem.menu_nm}" /> </a>
<%-- 						 	<c:out value="${top2MenuItem.menu_nm}"></c:out> </a> --%>

						 <!-- // depth3 -->
						 <ul class="items">
						 	<c:forEach items="${top3MenuList}" var="top3MenuItem" varStatus="topMenuStat_3">
						 		<c:if test="${top3MenuItem.p_menu_no == top2MenuItem.menu_no }">
							 		<li><a href="${rootPath}<c:out value="${top3MenuItem.menu_addr}"></c:out>?menu_no=${top3MenuItem.menu_no}&header_menu=Y"
							 				menu_no="<c:out value="${top3MenuItem.menu_no}"></c:out>">
							 				<i class="fa fa-angle-double-right"></i>
							 				<spring:message code="MENU.${top3MenuItem.menu_no}" text="${top3MenuItem.menu_nm}" /></a>
<%-- 							 				<c:out value="${top3MenuItem.menu_nm}"></c:out></a> --%>
							 		</li>
							 	</c:if>
							 </c:forEach>
						 </ul>

					 </li>
					 </c:if>
				 </c:forEach>
				</ul>
			</li>
			</c:forEach>
		</ul>
	</nav>

	<div class="nav-slide-box">
		<div class="gnb-btn left"><span class="k-icon k-i-arrow-60-left"></span></div>
		<div class="gnb-btn right"><span class="k-icon k-i-arrow-60-right"></span></div>
	</div>
	
	<div class="l-member-info fr">
		<div class="in">
			<div class="info-pan">
				<p class="info info-nick" style="padding-bottom: 5px;"><c:out value="${sessionScope.userSession.user_nm}"></c:out>&nbsp;(<c:out value="${sessionScope.userSession.auth_gr_nm}"/>)</p>
				<p id="nowdate" class="info info-date"></p>
				<p id="nowtime" class="info info-date"></p>
				<!-- 미사용 기능
				<div id="myAlarmArea" style="position: absolute;right: -35px;top: 16px;cursor:pointer;display:none;"
					onclick="ClAlarm.fnGoUserAlarmPage()">
					<span class="fa-stack fa-1x">
						<img alt="alarm" src="${rootPath}/resource/img/alarm.png" width="28">
					</span>
				</div>				
				<div id="info_nick">
					<div align="left" 
						class="divitem"
						onclick="javascript:ClPopup.fnOnClickModalOpen('${rootPath}/loginPwdChg.do', null, 500);$('#info_nick').hide();">
						Change Password
					</div>
					<div align="left"
						class="divitem" 
						onclick="location.href='${rootPath}/logout.do'" title="Sign Out">
						Sign Out
					</div>
					<div align="left"
						class="divitem" 
						onclick="fnSetTheme('white');" title="theme test">
						Theme White
					</div>
					<div align="left"
						class="divitem" 
						onclick="fnSetTheme('black');" title="theme test">
						Theme Black
					</div>
				</div>
			</div>
			<div class="language"><i class="fa fa-globe fa-2" style="font-size:1.3em;"></i><br/><span id ="baselang" style="font-size:11px;position:relative;left:2px;top:-4px;"></span>
			<div id="chg_lang">
				<div align="left"
					class="divitem" 
					onclick="location.href='${rootPath}?lang=KO'" title="Korean">
					Korean
				</div>
				<div align="left"
					class="divitem" 
					onclick="location.href='${rootPath}?lang=EN'" title="English">
					English
				</div>
			</div>
			-->
			</div>
			<div class="signout">
				<button type="button" title="Sign Out" onclick="location.href='${rootPath}/logout.do'">
					<i class="fa fa-sign-out" style="font-size:1.7em;padding:2px 2px 2px 5px;border:1.3px solid #a7a9ac;border-radius:7px;"></i><br/>
				</button>
			</div>
		</div>
	</div>

</header>
