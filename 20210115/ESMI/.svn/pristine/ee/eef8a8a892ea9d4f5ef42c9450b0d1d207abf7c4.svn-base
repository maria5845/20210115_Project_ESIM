package com.tectone.web.business.setting.code;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.CmcdBean;
import com.tectone.web.object.ObjectCont;

@Controller
@RequestMapping("/setting/*")
public class CodeCont extends ObjectCont   {
	
	@Inject
	private CodeService service;
	
	@Inject
	MessageSource messageSource;

	
	/**
	 * 코드 카테고리 관리
	 * @param cmcdBean
	 * @return
	 */
	@RequestMapping("codecategorymng.do")
	public ModelAndView codecategorymng(
			CmcdBean cmcdBean
			) {
		ModelAndView mv = new ModelAndView();
		try {

			mv.addObject("bean", cmcdBean);
			
			mv.addObject("viewName", "../../setting/code/category/codecategorymng");
			mv.setViewName("/common/layout/mng_layout_lnb");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 코드 카테고리 관리 Ajax
	 * @param cmcdBean
	 * @return
	 */
	@RequestMapping("codecategoryAjax.do")
	public @ResponseBody AjaxBean codecategoryAjax(
			CmcdBean cmcdBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
//			ajaxBean.setData("list", service.selectList("codeSqlMap.getCmCdList", cmcdBean));
			ajaxBean.setData("list", service.selectList("codeSqlMap.getCmCategoryList", cmcdBean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	
	/**
	 * 코드 카테고리 상세
	 * @param cmcdBean
	 * @param action_type
	 * @return
	 */
	@RequestMapping("codecategorydetail.do")
	public ModelAndView codecategorydetail(
			CmcdBean cmcdBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("action_type", action_type);
			mv.addObject("cmcatlist", service.selectList("codeSqlMap.getCmCategoryList"));
			
			// 수정일때만
			if(action_type.equals("modify")){
				mv.addObject("bean", service.selectOne("codeSqlMap.getCmCategoryOne", cmcdBean));
			}

			mv.addObject("viewName", "../../setting/code/category/codecategorydetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 코드 카테고리 Action(추가/수정/삭제) Ajax
	 * @param cmcdBean
	 * @param action_type
	 * @return
	 */
	@RequestMapping("codecategoryActionAjax.do")
	public @ResponseBody AjaxBean codecategoryActionAjax(
			CmcdBean cmcdBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			service.codecategoryAction(cmcdBean, action_type);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			if (e.getMessage().contains("중복")) {
				Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
				String msgExistcode = messageSource.getMessage("MESSAGE.EXISTCODE", null, "이미 존재하는 코드 값입니다.", locale);
				ajaxBean.setSysmsg(msgExistcode);
			} else {
				ajaxBean.setSysmsg(e.getMessage());
			}
		}
		return ajaxBean;
	}

	/**
	 * 코드 관리
	 * @param cmcdBean
	 * @return
	 */
	@RequestMapping("codesmng.do")
	public ModelAndView codesMng(
			CmcdBean cmcdBean
			) {
		ModelAndView mv = new ModelAndView();
		try {

			mv.addObject("catlist", service.selectList("codeSqlMap.getCmCategoryList"));
			mv.addObject("bean", cmcdBean);
			
			mv.addObject("viewName", "../../setting/code/codesmng");
			mv.setViewName("/common/layout/mng_layout_lnb");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 코드 관리 Ajax
	 * @param cmcdBean
	 * @return
	 */
	@RequestMapping("codesAjax.do")
	public @ResponseBody AjaxBean codesAjax(
			CmcdBean cmcdBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		
		try {
			
			ajaxBean.setData("list", service.selectList("codeSqlMap.getCmCdList", cmcdBean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 코드 상세
	 * @param cmcdBean
	 * @param action_type
	 * @return
	 */
	@RequestMapping("codesdetail.do")
	public ModelAndView codesdetail(
			CmcdBean cmcdBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			int cnt = service.selectOne("codeSqlMap.getCmCdCount", cmcdBean);
			mv.addObject("action_type", action_type);
			mv.addObject("cmcatlist", service.selectList("codeSqlMap.getCmCategoryList"));
			mv.addObject("cmcdlist", service.selectList("codeSqlMap.getCmCdList"));
			
			// 수정일때만
			if(action_type.equals("modify")){
				mv.addObject("cnt", cnt);
				mv.addObject("bean", service.selectOne("codeSqlMap.getCmCdOne", cmcdBean));
			}else if(action_type.equals("add")){
				mv.addObject("cnt", cnt + 1);
				mv.addObject("bean", cmcdBean);
			}

			mv.addObject("viewName", "../../setting/code/codesdetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 해당 코드 카테고리 하위의 코드 갯수 Ajax
	 * @param cmcdBean
	 * @return
	 */
	@RequestMapping("getcmcdcntAjax.do")
	public @ResponseBody AjaxBean getcmcdcntAjax(
			CmcdBean cmcdBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			int cnt = service.selectOne("codeSqlMap.getCmCdCount", cmcdBean);
			ajaxBean.setData("cnt", cnt + 1);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 코드 Action(추가/수정/삭제) Ajax
	 * @param cmcdBean
	 * @param action_type
	 * @return
	 */
	@RequestMapping("codesActionAjax.do")
	public @ResponseBody AjaxBean codesActionAjax(
			CmcdBean cmcdBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			service.codesAction(cmcdBean, action_type);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			if (e.getMessage().contains("중복")) {
				Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
				String msgExistcode = messageSource.getMessage("MESSAGE.EXISTCODE", null, "이미 존재하는 코드 값입니다.", locale);
				ajaxBean.setSysmsg(msgExistcode);
			} else {
				ajaxBean.setSysmsg(e.getMessage());
			}
		}
		return ajaxBean;
	}
	
	/**
	 * code 등록 페이지 
	 * @param cmcdBean
	 * @return
	 */
	@RequestMapping("codemaster.do")
	public ModelAndView codemaster(CmcdBean cmcdBean) {
		ModelAndView mv = new ModelAndView();
		try {
			
//			mv.addObject("bean", cmcdBean);
			mv.addObject("bean", service.selectOne("codeSqlMap.getCmCdOne", cmcdBean));
			
			//display_order
			int cnt = service.selectOne("codeSqlMap.getCmCdCount", cmcdBean);
			mv.addObject("cnt", cnt+1);
			// parent cd
			mv.addObject("cmcdlist", service.selectList("codeSqlMap.getCmCdList"));
			
			mv.addObject("viewName", "../../setting/code/codemaster");
			mv.setViewName("/common/layout/mng_popup");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 코드 카테고리 관리 Ajax
	 * @param cmcdBean
	 * @return
	 */
	@RequestMapping("codemasterAjax.do")
	public @ResponseBody AjaxBean codemasterAjax(
			CmcdBean cmcdBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			ajaxBean.setData("bean", cmcdBean);
			ajaxBean.setData("list", service.selectList("codeSqlMap.getCmCdList", cmcdBean));
//			ajaxBean.setData("list", service.selectList("codeSqlMap.getCmCategoryList", cmcdBean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
}
