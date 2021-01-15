package com.tectone.web.business.setting.auth;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.UserAuthGrBean;
import com.tectone.web.object.ObjectCont;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/setting/*")
public class AuthCont extends ObjectCont {
	
	@Inject
	private AuthService service;
	
	
	/**
	 * 권한그룹정보 리스트 조회화면
	 * @param
	 * @return
	 */
	@RequestMapping(value = "authgrmng.do")
	public ModelAndView authgrmng() {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("userAuthGroupList", service.selectList("authSqlMap.getUserAuthGrList"));
			
			mv.addObject("viewName", "../../setting/auth/authgrmng");
			mv.setViewName("/common/layout/mng_layout_lnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 그룹 권한정보 리스트 조회
	 * @param userAuthGroupSeq
	 * @return
	 */
	@RequestMapping(value = "getauthgrlistAjax.do")
	public @ResponseBody AjaxBean getauthgrlistAjax(
			UserAuthGrBean userAuthGrBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", JSONArray.fromObject(service.getUserAuthListMng(userAuthGrBean)).toString());
			ajaxBean.setResult(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ajaxBean;
	}
	
	/**
	 * 권한그룹정보 상세조회화면
	 * @param userAuthGroupSeq
	 * @param actionType
	 * @return
	 */
	@RequestMapping(value = "authgrdetail.do")
	public ModelAndView authgrdetail(
			UserAuthGrBean userAuthGrBean
			, @RequestParam(value = "action_type", defaultValue = "add") String actionType
			) {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("action_type", actionType);
			
						
			if(actionType.equals("modify")) {
				mv.addObject("bean", service.selectOne("authSqlMap.getUserAuthGr", userAuthGrBean));
				
				//메뉴 선택
//			mv.addObject("pMenuList", service.selectList("authSqlMap.getParentmenuList", userAuthGrBean));
//			mv.addObject("menuList", service.selectList("authSqlMap.getmenuList", userAuthGrBean));
				mv.addObject("pMenuList", JSONArray.fromObject(service.selectList("authSqlMap.getParentmenuList", userAuthGrBean)).toString());
				mv.addObject("menuList", JSONArray.fromObject(service.selectList("authSqlMap.getmenuList", userAuthGrBean)).toString());
			}
			
			mv.addObject("viewName", "../../setting/auth/authgrdetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 권한그룹정보 Action(추가/수정/삭제)
	 */
	@RequestMapping("authgrActionAjax.do")
	public @ResponseBody AjaxBean authgrActionAjax(
			UserAuthGrBean userAuthGrBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			service.userauthgrAction(userAuthGrBean, action_type);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 그룹 권한리스트 수정
	 * @param userAuthGrBean
	 * @return
	 */
	@RequestMapping("authgrmenuActionAjax.do")
	public @ResponseBody AjaxBean authgrmenuActionAjax(
			UserAuthGrBean userAuthGrBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			objectService.userAuthGrMenuAction(userAuthGrBean);
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
}

