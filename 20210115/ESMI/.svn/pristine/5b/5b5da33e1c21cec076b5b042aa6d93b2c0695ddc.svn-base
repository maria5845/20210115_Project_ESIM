package com.tectone.web.business.setting.lang;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.LangBean;

@Controller
@RequestMapping("/lang/*")
public class LangCont {

	@Inject
	private LangService service;

	
	/**
	 * 다국어 목록
	 */
	@RequestMapping(value = "langmng.do")
	public ModelAndView langMng(
			LangBean langBean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("lang_cd_list", service.getCmcdList("LANG_CD", "Y"));
			
			mv.addObject("viewName", "../../setting/lang/langmng");
			mv.setViewName("/common/layout/mng_layout_lnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 다국어 목록 Ajax
	 */
	@RequestMapping(value = "langmngAjax.do")
	public @ResponseBody AjaxBean langmngAjax(
			LangBean langBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("langSqlMap.getLangList", langBean));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 다국어 관리 상세(추가/수정)
	 */
	@RequestMapping(value = "langdetail.do")
	public ModelAndView langDetail(
			LangBean langBean
			, @RequestParam(value = "action_type", defaultValue = "add") String actionType
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("action_type", actionType);
			mv.addObject("lang_cd_list", service.getCmcdList("LANG_CD", "Y"));
			
			if(actionType.equals("modify")) {
				mv.addObject("bean", service.selectOne("langSqlMap.getLang", langBean));
			}
			
			mv.addObject("viewName", "../../setting/lang/langdetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 다국어 Action(추가/수정/삭제)
	 */
	@RequestMapping(value = "langActionAjax.do")
	public @ResponseBody AjaxBean langActionAjax(
			LangBean langBean,
			@RequestParam(value = "action_type", defaultValue = "add") String actionType
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			service.langAction(langBean, actionType);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 다국어 변경내용 적용
	 */
	@RequestMapping(value = "applyChangesLangAjax.do")
	public @ResponseBody AjaxBean applyChangesLangAjax(
			HttpServletRequest req, HttpServletResponse res
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			service.applyChangesLang(req);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
}
