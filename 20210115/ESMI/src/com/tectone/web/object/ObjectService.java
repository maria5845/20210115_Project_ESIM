package com.tectone.web.object;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.MenuBean;
import com.tectone.web.model.UserAuthGrBean;

@Service
public class ObjectService extends AbstractService {

	@Inject
	private ObjectDAO dao;
	
	/**
	 * 메뉴-사용자 접속 권한 체크
	 */
	public MenuBean getUserMenuAuth(String user_id, String uri, String menu_no, Object action_type) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("menu_addr", uri);
		paramMap.put("menu_no", menu_no);
		paramMap.put("action_type", action_type);
		return dao.selectOne("objectSqlMap.getUserMenuAuth", paramMap);
	}

	/**
	 * 메뉴 접근 log 저장
	 */
	public MenuBean insertMenuAccessLog(Integer menu_no, String user_id, String access_ip, String access_scces_yn) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menu_no", menu_no);
		paramMap.put("user_id", user_id);
		paramMap.put("access_ip", access_ip);
		paramMap.put("access_scces_yn", access_scces_yn);
		return dao.selectOne("objectSqlMap.insertMenuAccessLog", paramMap);
	}
	
	public List<MenuBean> getTopMenuList(String user_id, int menu_depth) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("menu_depth", menu_depth);
		return dao.selectList("objectSqlMap.getTopMenuList", paramMap);
	}

	
	public List<MenuBean> getMenuHierarchyList(String user_id, String uriAddr) throws Exception {
		Integer seqNo = dao.selectOne("objectSqlMap.getLowestMenuSeqByUriAddr", uriAddr);
		int thisMenuSeq = (seqNo == null) ? 0 : seqNo;
		return getMenuHierarchyList(thisMenuSeq);
	}

	
	public List<MenuBean> getMenuHierarchyList(int menu_seq) throws Exception {
		List<MenuBean> retList = new ArrayList<MenuBean>();
		MenuBean tmpMenu;

		tmpMenu = dao.selectOne("objectSqlMap.getMenuByMenuSeq", menu_seq);
		if(tmpMenu != null) retList.add(tmpMenu);
		while(tmpMenu != null && tmpMenu.getMenu_depth() > 1) {
			tmpMenu = dao.selectOne("objectSqlMap.getMenuByMenuSeq", tmpMenu.getP_menu_no());
			retList.add(tmpMenu);
		}
		return retList;
	}
	
	/**
	 * 선택된 권한그룹에, 선택된 메뉴들 저장
	 */
	public void userAuthGrMenuAction(UserAuthGrBean userAuthGrBean) throws Exception {
		List<Map<String, Object>> lists = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		// 맵핑 메뉴 전체 삭제
		map.put("queryId", "objectSqlMap.deleteAuthGrMenuMappForUpdate");
		map.put("param", userAuthGrBean.getAuth_gr_no());
		map.put("CUD", "delete");
		lists.add(map);
		
		if( null == userAuthGrBean.getBean_arr()){
			//체크된 항목을 체크해제 할때 매핑 삭제
			dao.delete("objectSqlMap.deleteAuthGrMenuMappForUpdate", userAuthGrBean);
		} else {
			// 권한그룹-메뉴 매핑 저장
			for(Map<String, Object> bean : userAuthGrBean.getBean_arr()) {
				map = new HashMap<>();
				map.put("queryId", "objectSqlMap.insertAuthGrMenuMapp");
				map.put("param", bean);
				map.put("CUD", "insert");
				lists.add(map);
			}
		}
		
		dao.multiBatch(lists);
	}
	
	/**
	 * 메뉴 Action(추가/수정/삭제)
	 * @param menu
	 * @throws Exception
	 */
	public void menuAction(MenuBean menu) throws Exception {
		switch (menu.getAction_type()) {
		case "add":
			insertMenu(menu);
			break;
		case "modify":
			updateMenu(menu);
			break;
		case "delete":
			deleteMenu(menu);
			break;
		}
	}
	
	/**
	 * 메뉴 추가
	 * @param menu
	 * @throws Exception
	 */
	public void insertMenu(MenuBean menu) throws Exception {
		
		// 메뉴 순서, 한칸씩 뒤로
		dao.update("objectSqlMap.shiftBackMenuOrder", menu);
		
		// 메뉴 추가
		dao.insert("objectSqlMap.insertMenu", menu);
		
		// 해당 메뉴의 상위 메뉴에 권한 부여된 권한그룹 or 전체메뉴권한여부가 Y인 권한그룹에 해당 메뉴를 자동 추가
		dao.insert("objectSqlMap.insertAuthGroupMappingForNewMenu", menu);
	}
	
	/**
	 * 메뉴 수정
	 * @param menu
	 * @throws Exception
	 */
	public void updateMenu(MenuBean menu) throws Exception {
		
		// 메뉴 순서, 한칸씩 앞으로
		dao.update("objectSqlMap.shiftForwardMenuOrder", menu);
		
		// 메뉴 순서, 한칸씩 뒤로
		dao.update("objectSqlMap.shiftBackMenuOrder", menu);
		
		// 메뉴 수정
		dao.update("objectSqlMap.updateMenu", menu);
	}
	
	/**
	 * 메뉴 삭제
	 * @param menu
	 * @throws Exception
	 */
	public void deleteMenu(MenuBean menu) throws Exception {
		
		// 메뉴 순서, 한칸씩 앞으로
		dao.update("objectSqlMap.shiftForwardMenuOrder", menu);
		
		// 권한그룹 메뉴매핑 에서 해당 메뉴 삭제
		dao.delete("objectSqlMap.deleteAuthGroupMappingMenu", menu);
		
//		// 대시보드-메뉴 맵핑 정보 삭제
//		LayoutBean lBean = new LayoutBean();
//		lBean.setMenu_no(menu.getMenu_no());
//		dao.delete("layoutSqlMap.deleteDsbdMenuMapp", lBean);
		
		// 메뉴 삭제
		dao.delete("objectSqlMap.deleteMenu", menu);
	}
}
