package com.tectone.web.business.setting.auth;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.UserAuthGrBean;

/**
 * 메뉴 관리
 * @author kookai
 *
 */
@Service
public class AuthService extends AbstractService {

	@Inject
	private AuthDao dao;


	/**
	 * 권한그룹정보 리스트 조회(parameter : 그룹 seq)
	 * @param userAuthGroupSeq
	 * @return
	 * @throws Exception
	 */
	public List<UserAuthGrBean> getUserAuthListMng(UserAuthGrBean userAuthGrBean) throws Exception {
		List<UserAuthGrBean> userAuthList = selectList("authSqlMap.getUserAuthList", userAuthGrBean); // 사용자 권한 리스트
		List<UserAuthGrBean> resultList = new ArrayList<UserAuthGrBean>();
		for (UserAuthGrBean userAuth : userAuthList) {
			if (userAuth.getMenu_depth().equals("1")) {
				setAuthWithChild(userAuthList, resultList, userAuth, "&nbsp;&nbsp;", false);
			}
		}
		return resultList;
	}

	/**
	 * 권한그룹 수정 Action(추가/수정/삭제)
	 */
	public void userauthgrAction(UserAuthGrBean userAuthGrBean, String action_type) throws Exception {
		switch (action_type) {
		case "add":
			insert("authSqlMap.insertUserAuthGr", userAuthGrBean);
			break;
		case "modify":
			update("authSqlMap.updateUserAuthGr", userAuthGrBean);
			break;
		case "delete":
			deleteUserAuthGr(userAuthGrBean);
			break;
		}
	}
	
	/**
	 * 권한그룹 삭제
	 */
	public void deleteUserAuthGr(UserAuthGrBean userAuthGrBean) throws Exception {
		// 사용자 - 권한그룹 매핑 삭제
		dao.delete("authSqlMap.deleteUserAuthMapp", userAuthGrBean);
		// 메뉴 - 권한그룹 매핑 삭제
		dao.delete("objectSqlMap.deleteAuthGrMenuMappForUpdate", userAuthGrBean.getAuth_gr_no());
		// 권한 그룹 삭제
		dao.delete("authSqlMap.deleteUserAuthGr", userAuthGrBean);
	}
	
	/**
	 * ..?
	 * @param userAuthList
	 * @param resultList
	 * @param thisAuth
	 * @param preStr
	 * @param isLast
	 */
	private void setAuthWithChild(List<UserAuthGrBean> userAuthList, List<UserAuthGrBean> resultList, UserAuthGrBean thisAuth, String preStr, boolean isLast) {
		
		if(!thisAuth.getMenu_depth().equals("1")) {
			thisAuth.setMenu_nm(isLast ? preStr + "&nbsp;&nbsp;&nbsp;&nbsp;┗    " + thisAuth.getMenu_nm() : preStr + "&nbsp;&nbsp;&nbsp;&nbsp;┠&nbsp;" + thisAuth.getMenu_nm());
		}else{ // 디자인 추가
			thisAuth.setMenu_nm("<span class='tableTreeFolder'>" + thisAuth.getMenu_nm() + "</span>");
		}
		resultList.add(thisAuth);
		if (Integer.parseInt(thisAuth.getMenu_depth()) < 4) {
			int totCnt = 0;
			for (UserAuthGrBean userAuth : userAuthList) {
				if(String.valueOf(thisAuth.getMenu_no()).equals(userAuth.getP_menu_no())) totCnt++;
			}
			int cnt = 0;
			for (UserAuthGrBean userAuth : userAuthList) {
				if (String.valueOf(thisAuth.getMenu_no()).equals(userAuth.getP_menu_no())) {
					cnt++;
					setAuthWithChild(userAuthList, resultList, userAuth, (thisAuth.getMenu_depth().equals("1") || isLast ? (preStr + "&nbsp;&nbsp;&nbsp;&nbsp;") : (preStr + "&nbsp;&nbsp;&nbsp;&nbsp;" + "┃")), ((totCnt == cnt) ? true : false));
				}
			}
		}
	}
}