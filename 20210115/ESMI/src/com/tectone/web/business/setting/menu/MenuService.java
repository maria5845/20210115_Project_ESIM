package com.tectone.web.business.setting.menu;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.MenuBean;

/**
 * 메뉴 관리
 * @author kookai
 *
 */
@Service
public class MenuService extends AbstractService {

//	@Inject
//	private MenuDao dao;

	/**
	 * 메뉴 추가
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> menuAddMng(MenuBean menu) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("action_type", "add");
		map.put("cnt", (Integer)selectOne("menuSqlMap.getMenuListCountByParentMenuSeq", menu) + 1);
		map.put("parentMenu", selectOne("menuSqlMap.getMenuByMenuSeq", menu.getP_menu_no()));
		map.put("crudTypeCodeList", getCmcdList("MENU_ACT_TYPE", "Y"));
		return map;
	}
	
	/**
	 * 메뉴 수정
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> menuModifyMng(MenuBean menu) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("action_type", "modify");
		map.put("cnt", (Integer)selectOne("menuSqlMap.getMenuListCountByParentMenuSeq", menu));
		map.put("menu", selectOne("menuSqlMap.getMenuByMenuSeq", menu.getMenu_no()));
		map.put("parentMenu", selectOne("menuSqlMap.getMenuByMenuSeq", menu.getP_menu_no()));
		map.put("crudTypeCodeList", getCmcdList("MENU_ACT_TYPE", "Y"));

		return map;
	}
}