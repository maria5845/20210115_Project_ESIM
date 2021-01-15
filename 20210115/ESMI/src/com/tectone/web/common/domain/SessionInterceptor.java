package com.tectone.web.common.domain;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.tectone.util.DateUtil;
import com.tectone.util.RequestUtil;
import com.tectone.util.StringUtil;
import com.tectone.web.common.session.SessionMgr;
import com.tectone.web.model.MenuBean;
import com.tectone.web.model.UserInfoBean;
import com.tectone.web.object.ObjectService;

public class SessionInterceptor implements HandlerInterceptor {
	
	@Inject
	MessageSource messageSource;
	
	@Inject
	private ObjectService objectService;
	
	protected List<Map<String, String>> excludeSessUrlList;
	protected List<Map<String, String>> excludeAuthUrlList;
	
	@Inject
	public void setExcludeSessUrlList(List<Map<String, String>> excludeSessUrlList) {
		this.excludeSessUrlList = excludeSessUrlList;
	}
	
	@Inject
	public void setExcludeAuthUrlList(List<Map<String, String>> excludeAuthUrlList) {
		this.excludeAuthUrlList = excludeAuthUrlList;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exception)
			throws Exception {
	}

	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv
		) throws Exception {

		Map<String, Object> map = RequestUtil.getReqParamToMap(request);
		
		if(mv != null) {
			// 세션 체크 필요없는 url 제외 & Ajax url 제외 & mv가 null이 아닐때
			// Navigetion(최대 3뎁스)을 우측상단에 보여주기위해 현재 URI에 DB에서 가져온다.
			if(!excludeSessUrl(request) && !isAjaxRequest(request)){
				List<Map<String, Object>> l = objectService.selectList("objectSqlMap.getMenuNavi", map.get("menu_no"));
				if(l.size() > 0){
					// 네비게이션
					mv.addObject("menuNavi", l);
					// 현재 메뉴의 이름
					mv.addObject("curMenuNm", l.get(l.size()-1).get("menu_nm"));
					// 현재 메뉴의 No
					mv.addObject("curMenuNo", l.get(l.size()-1).get("menu_no"));
				}
			}
			
			mv.addObject("lastweek", DateUtil.formatDate(DateUtil.addDay(DateUtil.getCurrentDate("yyyy-MM-dd"), -7), "-"));
			mv.addObject("today", DateUtil.getCurrentDate("yyyy-MM-dd"));
			mv.addObject("currentTime", DateUtil.getCurrentTime("HH:mm"));
			mv.addObject("page", map.get("page"));
		}
		
	}

	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler
		) throws Exception {
		
		boolean result = false;

		response.setHeader("Cache-Control", "no-cache, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", -1); //prevents caching at the proxy server
		
		
		Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		if( null == locale ) {
			request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, LocaleContextHolder.getLocale());
		}
		
		// 1. 세션 체크 필요없는 url 제외
		if(excludeSessUrl(request)){
			result = true;
		}else{
			
			SessionMgr ems_session = new SessionMgr(request);
			UserInfoBean userInfo = ems_session.getUserInfo();
			// 2. 세션 체크
			if(userInfo == null){
				result = false;
				if(isAjaxRequest(request)){
					// 2-1. Ajax 일때 Action
					response.sendError(HttpServletResponse.SC_UNAUTHORIZED); // 401을 세션만료로 하기.
				}else{
					// 2-2. Ajax가 아닐때 Action
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					// 스스로가 아닌 상위 프로젝트로 가기 위해 / 처리

					String msgSessionOut = messageSource.getMessage("MESSAGE.SESSION_OUT", null, "세션이 만료되었습니다. 다시 로그인해주세요.", locale);
						
					out.println("<script>alert('" + msgSessionOut + "'); parent.location.href='/login.do';</script>");
					out.flush();
					out.close();
				}
			}else{
				
				// 3. 메뉴권한 체크 필요없는 URL 제외
				if(excludeAuthUrl(request)){
					result = true;
				}else{
					
					String access_scces_yn = "N";
					String logWrite = "N";
					
					String uriAddr = request.getRequestURI();
					if(!"/".equals(request.getContextPath())) {
						uriAddr = uriAddr.substring(request.getContextPath().length());
					}
					
					Map<String, Object> param = RequestUtil.getReqParamToMap(request);
					MenuBean nowMenu = null;
					// 상단 메뉴는 항상 'header_menu'가 넘어온다.
					if(param.get("header_menu") == null || StringUtil.isEmpty(param.get("header_menu").toString())) {
						// header_menu가 넘어오지 않으면, url로 체크한다.
						// Action인 경우엔 action_type이 넘어오니 add/modify/delete를 확인하여, 해당 메뉴의 cud 권한이 있는지 체크
						nowMenu = objectService.getUserMenuAuth(userInfo.getUser_id(), uriAddr, null, param.get("action_type"));
					}else {
						// header_menu가 넘어오는 곳은, 상단의 메뉴만 해당된다.
						nowMenu = objectService.getUserMenuAuth(userInfo.getUser_id(), null, param.get("menu_no").toString(), null);
					}
					
					// 4. 메뉴권한 체크
					if(nowMenu != null){
						access_scces_yn = "Y";
						logWrite = nowMenu.getLog_record_yn();
						result = true;
					}else {
						if(isAjaxRequest(request)){
							// 4-1. Ajax 일때 Action
							response.sendError(HttpServletResponse.SC_FORBIDDEN); // 403을 권한없음으로 하기.
						}else{
							// 4-2. Ajax가 아닐때 Action
							response.setContentType("text/html; charset=UTF-8");
							PrintWriter out = response.getWriter();
							
							String msgNoauth = messageSource.getMessage("MESSAGE.NOAUTH", null, "해당 페이지 접속 권한이 없습니다. 관리자에게 문의해 주세요.", locale);
							
							out.println("<script>alert('"+ msgNoauth +"'); "
									// 팝업이 없어지고 모달만 남았으므로 모달만 체크
									// 모달일땐, 가장 최신 모달창 닫기
									+ "if($('.ipop').length > 0){$('.ipop').last().remove();}"
									// 일반 메뉴일땐, 탭 닫기
									+ "else"
									+"{var frameId = window.frameElement.parentElement.id;"
									+ "window.parent.document.querySelector('.k-tabstrip-items li[aria-controls='+frameId+'] button[data-type=remove]').click();}"
									+ "</script>");
							out.flush();
							out.close();
						}
						result = false;
					}
					
					// 5. 사용자 접근 로그 체크, 저장
					if("Y".equals(logWrite)){
						objectService.insertMenuAccessLog(nowMenu.getMenu_no(), userInfo.getUser_id(), getClientIpAddr(request), access_scces_yn);
					}
				}
			}
		}
	
		return result;
	}

	/**
	 * 세션 체크 필요없는 URL
	 *  - context-core.xml에 property로 정의되어있음
	 * @param request
	 * @return boolean : true(세션체크필요없음)
	 */
	private boolean excludeSessUrl(HttpServletRequest request) {
		String uri = request.getRequestURI().toString().trim();
		for(Map<String, String> map : this.excludeSessUrlList){
			if(uri.indexOf(map.get("excludeUrl")) > -1){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 권한 체크 필요없는 URL
	 *  - do-servlet.xml에 property로 정의되어있음
	 * @param request
	 * @return boolean : true(권한체크필요없음)
	 */
	private boolean excludeAuthUrl(HttpServletRequest request) {
		String uri = request.getRequestURI().toString().trim();
		for(Map<String, String> map : this.excludeAuthUrlList){
			if(uri.indexOf(map.get("excludeUrl")) > -1){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Ajax URL 인지 체크
	 * @param request
	 * @return boolean : true(Ajax URL)
	 */
	private boolean isAjaxRequest(HttpServletRequest request) {
		if(request.getRequestURI().toLowerCase().indexOf("ajax") >= 0){
			return true;
		}
		return false;
	}


	protected List<Map<String, Object>> reverseMenuList(List<Map<String, Object>> menuList) {
		List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
		for(int i = menuList.size() - 1; i >= 0; i--) {
			retList.add(menuList.get(i));
		}
		
		return retList;
	}
	
	protected String getClientIpAddr(HttpServletRequest request) {
		//tomcat VM aguments에 추가 -Djava.net.preferIPv4Stack=true
		String ip = request.getHeader("X-Forwarded-For");
		
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}	 
		return ip;
	}

}
