package com.tectone.web.common.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.mvc.method.annotation.ServletModelAttributeMethodProcessor;

import com.tectone.web.common.session.SessionMgr;
import com.tectone.web.model.CommonBean;
import com.tectone.web.model.UserInfoBean;

public class UserSessionArgumentResolver implements HandlerMethodArgumentResolver  {

	final ServletModelAttributeMethodProcessor sm = new ServletModelAttributeMethodProcessor(false);
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
            NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		Object obj = sm.resolveArgument(parameter, mavContainer, webRequest, binderFactory);
//		
//		
//		
//		String name = ModelFactory.getNameForParameter(parameter);
//		System.out.println("1");
//		if(mavContainer.containsAttribute(name)) {
//			obj = mavContainer.getModel().get(name);
//		}
//		
//		System.out.println("2");
//		if(obj == null) {
//			Iterator<Entry<String, Object>> it = mavContainer.getModel().entrySet().iterator();
//			while(it.hasNext()) {
//				Entry<String, Object> entry = it.next();
//				if(parameter.getParameterType().isAssignableFrom(entry.getValue().getClass())){
//					obj = entry.getValue();
//					System.out.println("3");
//					break;
//				}
//			}
//		}
		
		if(obj != null) {
			//System.out.println("4");
			HttpServletRequest req = webRequest.getNativeRequest(HttpServletRequest.class);
			HttpSession ses = req.getSession();
			UserInfoBean user = (UserInfoBean) ses.getAttribute(SessionMgr.USER_SESSION_NAME);
			
			if(user != null) {
				((CommonBean)obj).setLogin_user_id(user.getUser_id());
			}
		}
	
		return obj == null ? parameter.getParameterType().newInstance() : obj;
	}

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		//System.out.println("supportsParameter = " + CommonBean.class.isAssignableFrom(parameter.getParameterType()));
		return CommonBean.class.isAssignableFrom(parameter.getParameterType());
	}

}
