package com.tectone.web.object;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.tectone.web.model.MenuBean;




@Controller
public class ObjectCont {

	protected HttpServletRequest request;
	
	@Inject
	protected ObjectService objectService;
	
	@Inject
	public void setObjectService(ObjectService objectService, HttpServletRequest request) {
		this.objectService = objectService;
		this.request = request;
	} 

	
	protected static List<MenuBean> reverseMenuList(List<MenuBean> menuList) {
		List<MenuBean> retList = new ArrayList<MenuBean>();
		for(int i = menuList.size() - 1; i >= 0; i--) {
			retList.add(menuList.get(i));
		}
		
		return retList;
	}
	
	protected static ModelAndView redirectModelAndView(String url) {
		RedirectView rv = new RedirectView(url);
		rv.setExposeModelAttributes(false);
		return new ModelAndView(rv);
	}
}
