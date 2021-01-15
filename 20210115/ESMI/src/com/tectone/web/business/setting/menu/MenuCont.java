package com.tectone.web.business.setting.menu;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.MenuBean;
import com.tectone.web.object.ObjectCont;
import com.tectone.web.object.ObjectService;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/setting/*")
public class MenuCont extends ObjectCont {
	
	@Inject
	private ObjectService objectService;
	
	@Inject
	private MenuService service;
	
	/**
	 * 메뉴정보 리스트 조회화면
	 * @param MenuBean
	 * @return
	 */
	@RequestMapping(value = "menumng.do")
	public ModelAndView menuMng(
			MenuBean menu
			) {
		ModelAndView mv = new ModelAndView();
		try {
			//상위 메뉴 선택된게 없을 시 root 메뉴만 표시
			if(menu.getP_menu_no()==null){
				menu.setP_menu_no(0);
			}
			
			mv.addObject("menu_list", service.selectList("menuSqlMap.getAllMenuList"));
			mv.addObject("list", service.selectList("menuSqlMap.getMenuListByParentMenuSeq", menu));
			mv.addObject("parentMenu", service.selectOne("menuSqlMap.getMenuByMenuSeq", menu.getP_menu_no()));
			mv.addObject("bean",menu);
			mv.addObject("viewName", "../../setting/menu/menumng");
			mv.setViewName("/common/layout/mng_layout_nolnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	/**
	 * 메뉴관리 Ajax
	 * @param MenuBean
	 * @return
	 */
	@RequestMapping("menuAjax.do")
	public @ResponseBody AjaxBean menuAjax(
			MenuBean menu
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			//상위 메뉴 선택된게 없을 시 root 메뉴만 표시
			if( null == menu.getP_menu_no() ){
				menu.setP_menu_no(0);
			}
			
			ajaxBean.setData("list", service.selectList("menuSqlMap.getMenuListByParentMenuSeq", menu));
			ajaxBean.setData("parentMenu", service.selectOne("menuSqlMap.getMenuByMenuSeq", menu.getP_menu_no()));
			ajaxBean.setData("settingMenuHierarchyList", JSONArray.fromObject(reverseMenuList(objectService.getMenuHierarchyList(menu.getP_menu_no()))));
			ajaxBean.setData("settingMenuList", reverseMenuList(objectService.getMenuHierarchyList(menu.getP_menu_no())));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	
	/**
	 * 메뉴정보 상세조회화면
	 * @param MenuBean
	 * @param actionType
	 * @return
	 */
	@RequestMapping("menudetail.do")
	public ModelAndView menuDetail(
			MenuBean menu
			, @RequestParam(value = "action_type", defaultValue = "add") String actionType
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			if (actionType.equals("add")) {
				mv.addAllObjects(service.menuAddMng(menu));
			} else if (actionType.equals("modify")) {
				mv.addAllObjects(service.menuModifyMng(menu));
			}
			
			mv.addObject("viewName", "../../setting/menu/menudetail");
			mv.setViewName("/common/layout/mng_modal");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	
	/**
	 * 메뉴 Action(추가,수정,삭제) Ajax
	 * @param menu
	 * @return
	 */
	@RequestMapping("menuActionAjax.do")
	public @ResponseBody AjaxBean menuActionAjax(
			MenuBean menu
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			objectService.menuAction(menu);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
}

