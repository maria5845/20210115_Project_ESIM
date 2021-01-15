package com.tectone.web.business.setting.user;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.UserInfoBean;
import com.tectone.web.object.ObjectCont;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/setting/*")
public class UserCont extends ObjectCont {
	
	@Inject
	private UserService service;
	
	/**
	 * 사용자정보 조회화면
	 * @param UserInfoBean
	 * @return
	 */
	@RequestMapping(value = "usermng.do")
	public ModelAndView userMng(
			UserInfoBean userInfo
			) {
		ModelAndView mv = new ModelAndView();
		try {

			mv.addObject("authlist", service.selectList("authSqlMap.getUserAuthGrList"));

			mv.addObject("viewName", "../../setting/user/usermng");
			mv.setViewName("/common/layout/mng_layout_lnb");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/**
	 * 사용자정보 리스트 조회 Ajax
	 * @param UserInfoBean
	 * @return
	 */
	@RequestMapping("userAjax.do")
	public @ResponseBody AjaxBean userAjax(
			UserInfoBean userInfo
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("userSqlMap.getUserInfoList", userInfo));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 사용자정보 상세조회화면
	 * @param UserInfoBean
	 * @param actionType
	 * @return
	 */
	@RequestMapping(value = "userdetail.do")
	public ModelAndView userDetail(
			UserInfoBean userInfo
			, @RequestParam(value = "action_type", defaultValue = "add") String actionType
			) {
		ModelAndView mv = new ModelAndView();
		try {

			if (actionType.equals("modify")) {
				mv.addObject("bean", service.selectOne("userSqlMap.getUserInfo", userInfo));
			}

			mv.addObject("action_type", actionType);
			
			// 권한그룹 list
			mv.addObject("authGr_list", JSONArray.fromObject(service.selectList("userSqlMap.getAuthGrListByUserid", userInfo)).toString());
			// 트리 list
			mv.addObject("tree_list", JSONArray.fromObject(service.selectList("userSqlMap.getTreeListByUserid", userInfo)).toString());
			
			mv.addObject("viewName", "../../setting/user/userdetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 사용자정보 Action(추가/수정) Ajax
	 * @param UserInfoBean
	 * @return
	 */
	@RequestMapping(value = "userActionAjax.do")
	public @ResponseBody AjaxBean userAddAction(
			UserInfoBean userInfo
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			if(userInfo.getAction_type().equals("add")) {
				// 사용자 ID 존재여부 체크
				UserInfoBean bean = service.selectOne("userSqlMap.getUserInfo", userInfo);
				if(bean != null) {
					ajaxBean.setMsg("사용자 ID가 중복되었습니다.");
					return ajaxBean;
				}
			}
			
			service.userAction(userInfo);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 사용자 print ?
	 * @param userInfo
	 * @return
	 */
	@RequestMapping("userprint.do")
	public ModelAndView userprint(
			UserInfoBean userInfo
			) {
		ModelAndView mv = new ModelAndView();
		try {

			mv.addObject("list", service.userPrintLabel(userInfo));
			
			mv.addObject("viewName", "../../setting/user/userprint");
			mv.addObject("styleName", "../../setting/user/userprintStyle");
			mv.setViewName("/common/layout/mng_print");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
}
