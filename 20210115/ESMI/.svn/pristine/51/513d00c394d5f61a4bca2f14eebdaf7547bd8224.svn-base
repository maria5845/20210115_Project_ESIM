package com.tectone.web.login;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.tectone.util.DateUtil;
import com.tectone.util.GetSHA512;
import com.tectone.web.common.session.SessionMgr;
import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.MenuBean;
import com.tectone.web.model.PolicyBean;
import com.tectone.web.model.UserInfoBean;
import com.tectone.web.object.ObjectCont;

@Controller
@RequestMapping("/*")
public class LoginCont extends ObjectCont {
	
	@Inject
	private LoginService service;
	
	@Inject
	MessageSource messageSource;

	/**
	 * 페이지 지정 없이 접근시 첫 페이지 주소로 사용자를 전환 시킨다.
	 * 
	 * @param afterLoginRedirection
	 * @return
	 */
	@RequestMapping(value = "index.do")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		try {
			Locale locale = (Locale) request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			
			SessionMgr ems_session = new SessionMgr(request);
			PolicyBean bean = service.getPolicyInfo("MAIN_PAGE_URL");
			if(bean == null || StringUtils.isEmpty(bean.getSys_polcy_data())) {
				if (ems_session.getUserInfo() == null) {
					mv = redirectModelAndView(request.getContextPath() + "/login.do?lang="+locale);
				} else {
					mv = redirectModelAndView(request.getContextPath() + "/frame.do?lang="+locale);
				}
			}else {
				mv = redirectModelAndView(request.getContextPath() + bean.getSys_polcy_data());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 로그인 화면
	 * 
	 * @param afterLoginRedirection
	 * @return
	 */
	@RequestMapping(value = "login.do")
	public ModelAndView loginForm(
			@RequestParam(value = "lang", required = false, defaultValue = "EN") String lang,
			@RequestParam(value = "afterLoginRedirection", required = false, defaultValue = "null") String afterLoginRedirection
			) {
		ModelAndView mv = new ModelAndView();
		try {
			Locale locale = (Locale) request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			mv.addObject("left_top_title", service.getCmcdOne("LEFT_TOP_TITLE", "TITLE", "Y"));
			
			SessionMgr ems_session = new SessionMgr(request);
			if (ems_session.getUserInfo() == null) {
				mv.addObject("afterLoginRedirection", afterLoginRedirection);
				mv.addObject("lang", lang);
				mv.addObject("lang_list", service.getCmcdList("LANG_CD", "Y"));
				mv.setViewName("/login/login");
			} else {
				mv = redirectModelAndView("frame.do?lang="+locale);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "ssoLogin.do")
	public @ResponseBody AjaxBean ssoLoginAjax(
			@RequestParam(value = "lang", required = false, defaultValue = "EN") String lang,
			@RequestParam(value = "hmi_no", required = false) String hmiNo,
			HttpServletResponse response
			) throws Exception {
		AjaxBean ajaxBean = new AjaxBean();
		Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale("EN".equals(lang) ? "en_US" : "ko_KR"));
		request.getSession().setAttribute("hmi_no", hmiNo);
		UserInfoBean userInfo = new UserInfoBean();
		userInfo.setUser_id("user");
		userInfo.setUser_pwd(GetSHA512.getHashcode(String.valueOf("user" + "user")));
		
//		UserInfoBean userInfo = new UserInfoBean();
//		userInfo.setUser_id(userinfoBean.getUser_id());
//		userInfo.setUser_pwd(GetSHA512.getHashcode(String.valueOf(userinfoBean.getUser_id() + oldPwdStr)));
//		System.out.println("[encrypt: ]"+ encrypt);
//		System.out.println("[유저 설정완료]");
		
		try {
			// 비밀번호까지 체크c
			userInfo = service.getUserInfoByIDPW(userInfo);
			
			if (userInfo == null) {
				String msgWronguser = messageSource.getMessage("MESSAGE.WRONGUSER", null, "현재 입력하신 아이디가 등록되어 있지 않거나, 아이디 또는 비밀번호를 잘못 입력하였습니다.", locale);
				ajaxBean.setMsg(msgWronguser);
				return ajaxBean;
			}else {
				SessionMgr upSession = null;
				upSession = new SessionMgr(request);
				upSession.setUserInfo(userInfo);
				// 마지막 로그인 time 저장
				service.updateLastLoginUserInfo(userInfo);
				ajaxBean.setResult(true);
				response.sendRedirect("frame.do?hmi_no="+hmiNo);

			}
		}catch(Exception ex){
			ajaxBean.setResult(false);
			String msgSyserr = messageSource.getMessage("MESSAGE.SYSERROR", null, "시스템 오류가 발생했습니다.", locale);
			ajaxBean.setMsg(msgSyserr);
			ajaxBean.setSysmsg(ex.getMessage());
		}
		return ajaxBean;
	}
	
	@RequestMapping(value = "demo.do")
	public @ResponseBody AjaxBean ssoLoginAjaxDemo(HttpServletResponse response) throws Exception {
		String lang = "EN";
		String hmiNo = "1-1";
		AjaxBean ajaxBean = new AjaxBean();
		Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale("EN".equals(lang) ? "en_US" : "ko_KR"));
		request.getSession().setAttribute("hmi_no", hmiNo);
		UserInfoBean userInfo = new UserInfoBean();
		userInfo.setUser_id("user");
		userInfo.setUser_pwd(GetSHA512.getHashcode(String.valueOf("user" + "user")));
		
//		UserInfoBean userInfo = new UserInfoBean();
//		userInfo.setUser_id(userinfoBean.getUser_id());
//		userInfo.setUser_pwd(GetSHA512.getHashcode(String.valueOf(userinfoBean.getUser_id() + oldPwdStr)));
//		System.out.println("[encrypt: ]"+ encrypt);
//		System.out.println("[유저 설정완료]");
		
		try {
			// 비밀번호까지 체크c
			userInfo = service.getUserInfoByIDPW(userInfo);
			
			if (userInfo == null) {
				String msgWronguser = messageSource.getMessage("MESSAGE.WRONGUSER", null, "현재 입력하신 아이디가 등록되어 있지 않거나, 아이디 또는 비밀번호를 잘못 입력하였습니다.", locale);
				ajaxBean.setMsg(msgWronguser);
				return ajaxBean;
			}else {
				SessionMgr upSession = null;
				upSession = new SessionMgr(request);
				upSession.setUserInfo(userInfo);
				// 마지막 로그인 time 저장
				service.updateLastLoginUserInfo(userInfo);
				ajaxBean.setResult(true);
				response.sendRedirect("frame.do?hmi_no="+hmiNo);
				
			}
		}catch(Exception ex){
			ajaxBean.setResult(false);
			String msgSyserr = messageSource.getMessage("MESSAGE.SYSERROR", null, "시스템 오류가 발생했습니다.", locale);
			ajaxBean.setMsg(msgSyserr);
			ajaxBean.setSysmsg(ex.getMessage());
		}
		return ajaxBean;
	}

	/**
	 * 로그아웃 액션. 이후 login화면으로 이동
	 * 
	 * @return
	 */
	@RequestMapping(value = "logout.do")
	public ModelAndView logoutForm() {
		ModelAndView mv = new ModelAndView();
		try {

			Locale locale = (Locale) request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			
			SessionMgr upSession = new SessionMgr(request);
			upSession.setLogOut();

			mv = redirectModelAndView(request.getContextPath() + "/login.do?lang="+locale);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	/**
	 * 로그인 액션
	 * 
	 * @param idStr
	 * @param pwdStr
	 * @param afterLoginRedirection
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "normalLoginActionAjax.do")
	public @ResponseBody AjaxBean normalLoginAction(@RequestParam(value = "IdStr", required = false) String idStr,
			@RequestParam(value = "PwdStr", required = false) String pwdStr,
			@RequestParam(value = "lang", required = false) String lang,
			@RequestParam(value = "afterLoginRedirection", required = false, defaultValue = "null") String afterLoginRedirection)
					throws Exception {
		
		AjaxBean ajaxBean = new AjaxBean();
		Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		//로그인 시에 선택한 언어로 설정
		request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale("EN".equals(lang) ? "en_US" : "ko_KR"));
		
		if (idStr == null || pwdStr == null || idStr.equals("") || pwdStr.equals("")) {
			String msgEnteridpw = messageSource.getMessage("MESSAGE.ENTERIDPW", null, "아이디나 패스워드를 입력해 주세요.", locale);
			ajaxBean.setMsg(msgEnteridpw);
			return ajaxBean;
		}

		UserInfoBean userInfo = new UserInfoBean();
		userInfo.setUser_id(idStr);
		userInfo.setUser_pwd(GetSHA512.getHashcode(String.valueOf(idStr + pwdStr)));

		try {
			
			// ID 일치여부 체크
			if(service.getUserInfoID(userInfo) == null) {
				String msgWronguser = messageSource.getMessage("MESSAGE.WRONGUSER", null, "현재 입력하신 아이디가 등록되어 있지 않거나, 아이디 또는 비밀번호를 잘못 입력하였습니다.", locale);
				ajaxBean.setMsg(msgWronguser);
				return ajaxBean;
			}
			
			// 비밀번호까지 체크
			userInfo = service.getUserInfoByIDPW(userInfo);
			
			if (userInfo == null) {
				String msgWronguser = messageSource.getMessage("MESSAGE.WRONGUSER", null, "현재 입력하신 아이디가 등록되어 있지 않거나, 아이디 또는 비밀번호를 잘못 입력하였습니다.", locale);
				ajaxBean.setMsg(msgWronguser);
				return ajaxBean;
			}else if(userInfo.getUser_pwd().equals(GetSHA512.getHashcode(String.valueOf(idStr + "0000")))){
				String msgChangepw = messageSource.getMessage("MESSAGE.CHANGEPW", null, "패스워드를 변경해 주세요.", locale);
				ajaxBean.setMsg(msgChangepw);
				ajaxBean.setData("pwdchange", "yes");
				return ajaxBean;
			}else {
				
				SessionMgr upSession = null;
				upSession = new SessionMgr(request);

				upSession.setUserInfo(userInfo);
	
				// 마지막 로그인 time 저장
				service.updateLastLoginUserInfo(userInfo);
				
				if (afterLoginRedirection == null || afterLoginRedirection.equals("")
						|| "null".equals(afterLoginRedirection)) {
					afterLoginRedirection = "frame.do?lang="+locale;
				}
				ajaxBean.setLocation(afterLoginRedirection);
				ajaxBean.setResult(true);
			}
		}catch(Exception ex){
			ex.printStackTrace();
			ajaxBean.setResult(false);
			String msgSyserr = messageSource.getMessage("MESSAGE.SYSERROR", null, "시스템 오류가 발생했습니다.", locale);
			ajaxBean.setMsg(msgSyserr);
			ajaxBean.setSysmsg(ex.getMessage());
		}
		return ajaxBean;

	}

	/**
	 * 로그인 후 패스워드 변경 화면
	 * 
	 * @param afterLoginRedirection
	 * @return
	 */
	@RequestMapping(value = "loginPwdChg.do")
	public ModelAndView loginPwdChgForm(
			@RequestParam(value = "IdStr", required = false) String idStr) {
		ModelAndView mv = new ModelAndView();
		try {
			
			SessionMgr upSession = null;
			upSession = new SessionMgr(request);
			
			if(upSession.getUserInfo() != null){
				mv.addObject("idStr", upSession.getUserInfo().getUser_id());
			}else{
				mv.addObject("idStr", idStr);
			}

			mv.addObject("viewName", "../../login/loginPwdChg");
			mv.addObject("jsName", "../../login/loginPwdChgJs");
			mv.setViewName("/common/layout/mng_modal");


		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping(value = "pwdchgpopActionAjax.do")
	public @ResponseBody AjaxBean pwdchgpopActionAjax(
			UserInfoBean userinfoBean,
			@RequestParam(value = "oldPwdStr", required = true) String oldPwdStr
			) throws Exception {

		AjaxBean ajaxBean = new AjaxBean();
		Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);

		UserInfoBean userInfo = new UserInfoBean();
		userInfo.setUser_id(userinfoBean.getUser_id());
		userInfo.setUser_pwd(GetSHA512.getHashcode(String.valueOf(userinfoBean.getUser_id() + oldPwdStr)));

		try {
			userInfo = service.getUserInfoID(userInfo);
			
			if (userInfo == null) {
				String msgNouserinfo = messageSource.getMessage("MESSAGE.NOUSERINFO", null, "일치하는 사용자 정보가 없습니다.", locale);
				ajaxBean.setMsg(msgNouserinfo);
				return ajaxBean;
			}else if("0000".equals(userinfoBean.getUser_pwd())){
				String msgNewpassword = messageSource.getMessage("MESSAGE.NEWPW", null, "새로운 패스워드로 변경해 주십시요.", locale);
				ajaxBean.setMsg(msgNewpassword);
				return ajaxBean;
			}else {
				userinfoBean.setUser_pwd(GetSHA512.getHashcode(String.valueOf(userinfoBean.getUser_id() + userinfoBean.getUser_pwd())));
				ajaxBean = service.pwdchgpopActionAjax(userinfoBean);
			}
		}catch(Exception ex){
			ajaxBean.setResult(false);
			String msgSyserr = messageSource.getMessage("MESSAGE.SYSERROR", null, "시스템 오류가 발생했습니다.", locale);
			ajaxBean.setMsg(msgSyserr);
			ajaxBean.setSysmsg(ex.getMessage());
		}
		return ajaxBean;
		
		
	}
	
	/**
	 * MainFrame
	 * @param layoutChartInfoBean
	 * @return
	 */
	@RequestMapping(value = "frame.do")
	public ModelAndView frame(
			) {
		ModelAndView mv = new ModelAndView();
		try {
			SessionMgr ems_session = new SessionMgr(request);
			
			// 메뉴 List들(상단1뎁스, 상단2뎁스, 상단3뎁스) 조회
			mv.addObject("left_top_title", service.getCmcdOne("LEFT_TOP_TITLE", "TITLE", "Y"));
			mv.addObject("hometab", service.getCmcdOne("HOME_TAB_USE_YN", "Y", "Y"));
			mv.addObject("top1MenuList", objectService.getTopMenuList(ems_session.getUserInfo().getUser_id(), 1));
			mv.addObject("top2MenuList", objectService.getTopMenuList(ems_session.getUserInfo().getUser_id(), 2));
			mv.addObject("top3MenuList", objectService.getTopMenuList(ems_session.getUserInfo().getUser_id(), 3));
			
			// 사용자 탭정보
			UserInfoBean userInfo = service.selectOne("userSqlMap.getUserTabInfo", ems_session.getUserInfo());
			mv.addObject("userTabInfo", userInfo.getTab_info());
			mv.addObject("user_id", userInfo.getUser_id());
			mv.addObject("home_yn", userInfo.getHome_yn());
			mv.addObject("home_menu_no", userInfo.getHome_menu_no());
			
			
			String todate =	DateUtil.getCurrentDate("yyyy-MM-dd aa HH:mm:ss");
			if(todate != null && todate.length()>=19) {
				String s_year =	todate.substring(0,4);
				String s_month = todate.substring(5,7);	
				String s_day = todate.substring(8,10);	
				String s_aa =	todate.substring(11,13);
				String s_hour = todate.substring(14,16);
				String s_minutes = todate.substring(17,19);
				String s_seconds= todate.substring(20,22);
				
				mv.addObject("todate", todate);
				mv.addObject("s_year", s_year);
				mv.addObject("s_month", s_month);
				mv.addObject("s_aa", s_aa);
				mv.addObject("s_day", s_day);
				mv.addObject("s_hour", s_hour);
				mv.addObject("s_minutes", s_minutes);
				mv.addObject("s_seconds", s_seconds);
			}
			
			mv.setViewName("/common/layout/mng_frame");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * Main화면
	 * @param layoutChartInfoBean
	 * @return
	 */
	@RequestMapping(value = "main.do")
	public ModelAndView main(
			MenuBean menu
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("viewName", "../../home");
			mv.setViewName("/common/layout/mng_layout_lnb");
			return mv;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}


	@RequestMapping("working.do")
	public ModelAndView Working(
			MenuBean menu
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("viewName", "../../working");
			mv.addObject("jsName", "../../workingJs");
			mv.setViewName("/common/layout/mng_layout_nolnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("updateUserTabInfoActionAjax.do")
	public @ResponseBody AjaxBean updateUserTabInfo(
			UserInfoBean userInfoBean
			){
		
		AjaxBean ajaxBean = new AjaxBean();
		try {
			service.update("userSqlMap.updateUserTabInfo", userInfoBean);
			ajaxBean.setResult(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ajaxBean;
	}
	
	/**
	 * 단순 메세지를 Modal로 보여준다.
	 * @param msg
	 * @return
	 */
	@RequestMapping("msgdetail.do")
	public ModelAndView msgdetail(
			@RequestParam(value = "msg", defaultValue = "") String msg
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("msg", msg);
			
			mv.addObject("viewName", "../../commonmodal/msg/msgdetail");
			mv.addObject("jsName", "../../commonmodal/msg/msgdetailJs");
			mv.setViewName("/common/layout/mng_modal");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
