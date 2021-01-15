package com.tectone.web.common.session;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tectone.util.DateUtil;
import com.tectone.web.model.UserInfoBean;


/**
 * 세션정보 관리
 * @author kookai
 *
 */
public class SessionMgr {
	//컨텍스트간에 세션을 공유하는 경우에만 true로 설정
	private final static boolean USE_CONTEXT_SESSION_SHARE = false;
	
	
	public static String MAIN_CONTEXT_PATH = "/";
	public static String SHARED_USER_KEY = "sharedUserKey";
	public static String USER_SESSION_NAME = "userSession";
	
	private static Logger logger = LogManager.getLogger(SessionMgr.class);
	
	private 	HttpSession		session 				= 	null;
    private 	UserInfoBean 	userInfo 				= 	null;
    
    public SessionMgr(HttpServletRequest request) throws ServletException{
    	session = request.getSession();
		if(USE_CONTEXT_SESSION_SHARE) {
			userInfo = readUserInfoFromMainContext();
	    	if(userInfo == null) {//메인 컨텍스트에 입력 안된 경우
	    		if(session.getAttribute(USER_SESSION_NAME) != null){
	    			userInfo = (UserInfoBean) session.getAttribute(USER_SESSION_NAME);
	    			setUserInfoIntoMainContext(userInfo);
	    		}
	    	}else if(userInfo != null){
	    		if(userInfo.getUser_id() == null){//다른 컨텍스트에서 로그 아웃된 경우 
	    			session.removeAttribute(USER_SESSION_NAME);
	    			userInfo = null;
	    		}
	    	}
		}else {
			userInfo = (UserInfoBean) session.getAttribute(USER_SESSION_NAME);
		}
    	session.setAttribute(USER_SESSION_NAME, userInfo);
	}
	
	public void setUserInfo(UserInfoBean user){
		userInfo = user;
		session.setAttribute(USER_SESSION_NAME, user);
		if(USE_CONTEXT_SESSION_SHARE) {
			setUserInfoIntoMainContext(userInfo);
		}
	}    
		
	public UserInfoBean getUserInfo(){
		return this.userInfo;
	}
	
	public void setLogOut(){
		if(USE_CONTEXT_SESSION_SHARE) {
			setUserInfoIntoMainContext(null);
		}
		if(session != null){
			session.removeAttribute(USER_SESSION_NAME);
			session.invalidate();
		}
	}
	
	@SuppressWarnings("unchecked")
	private void setUserInfoIntoMainContext(UserInfoBean user){
		ServletContext ctx2 = session.getServletContext();
		ServletContext ctx = ctx2 == null ? null : ctx2.getContext(MAIN_CONTEXT_PATH);
		if(ctx2 == null || ctx == null) return;
		
		Map<String,Map<String,String>> ctxMap = (Map<String,Map<String,String>>) ctx.getAttribute(SHARED_USER_KEY);
		if(ctxMap == null) ctxMap = new HashMap<String,Map<String,String>>();
		try {
			if(user == null) {
				Map<String,String> map = new HashMap<String,String>();
				map.put("logout", "Y");
				map.put("lastTime", DateUtil.getCurrentDate("yyyyMMddHHmmss"));
				ctxMap.put(session.getId(), map);
			}else{
				ObjectMapper mapper = new ObjectMapper();
				
				Map<String,String> map = new HashMap<String,String>();
				map.put("lastTime", DateUtil.getCurrentDate("yyyyMMddHHmmss"));
				map.put("userInfo", mapper.writeValueAsString(user));
				
				ctxMap.put(session.getId(), map);
				ctx.setAttribute(SHARED_USER_KEY, ctxMap);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	private UserInfoBean readUserInfoFromMainContext(){
		ServletContext ctx2 = session.getServletContext();
		ServletContext ctx = ctx2 == null ? null : ctx2.getContext(MAIN_CONTEXT_PATH);
		if(ctx2 == null || ctx == null) {
			return (UserInfoBean) session.getAttribute(USER_SESSION_NAME);
		}
		Map<String,Map<String,String>> ctxMap = (Map<String,Map<String,String>>) ctx.getAttribute(SHARED_USER_KEY);
		if(ctxMap == null) return null;
		logger.debug("Session Context Size =>>> " + Integer.toString(ctxMap.size()));
		try {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String,String> map = ctxMap.get(session.getId());
			if(map == null) return null;
			if("Y".equals(map.get("logout"))) return new UserInfoBean();
			map.put("lastTime", DateUtil.getCurrentDate("yyyyMMddHHmmss"));
			return mapper.readValue(map.get("userInfo"),  UserInfoBean.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
