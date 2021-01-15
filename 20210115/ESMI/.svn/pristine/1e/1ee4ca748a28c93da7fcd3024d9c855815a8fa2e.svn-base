package com.tectone.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.tectone.web.common.session.SessionMgr;

public class RequestUtil {

	
	public static Map<String, Object> getReqParamToMap(HttpServletRequest req) throws ServletException{
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration<String> iter = req.getParameterNames();
        while(iter.hasMoreElements()){
        	String key = iter.nextElement();
        	String value = req.getParameter(key);

//        	map.put(key, value);
        	if( value.contains("|") ) {
        		map.put(key, value.split("\\|"));
        	}else {
        		map.put(key, value);
        	}
        }
        
        // 로그인 사용자 ID 저장
        SessionMgr session = new SessionMgr(req);
        if( null != session && null != session.getUserInfo() ) {
        	map.put("login_user_id", session.getUserInfo().getUser_id());
        }
        return map;
	}
}
