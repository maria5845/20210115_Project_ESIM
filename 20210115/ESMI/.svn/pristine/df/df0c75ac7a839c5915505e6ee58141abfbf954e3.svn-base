package com.tectone.web.business.setting.user;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tectone.util.GetSHA512;
import com.tectone.util.StringUtil;
import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.AlarmBean;
import com.tectone.web.model.TreeInfoBean;
import com.tectone.web.model.UserInfoBean;

/**
 * 메뉴 관리
 * @author kookai
 *
 */
@Service
public class UserService extends AbstractService {

	@Inject
	private UserDao dao;

	/**
	 * 사용자정보 Action(추가/수정)
	 */
	public void userAction(UserInfoBean userInfo) throws Exception {
		
		if(userInfo.getUser_pwd() != null && !"".equals(userInfo.getUser_pwd())){
			userInfo.setUser_pwd(GetSHA512.getHashcode(userInfo.getUser_id()+userInfo.getUser_pwd()));
		}
		
		switch (userInfo.getAction_type()) {
		case "add":
			insertUser(userInfo);
			break;
		case "modify":
			updateUser(userInfo);
			break;
		case "delete":
			deleteUser(userInfo);
			break;
		}
	}
	
	/**
	 * 사용자정보 등록
	 */
	public void insertUser(UserInfoBean userInfo) throws Exception {
		List<Map<String, Object>> lists = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		// 사용자 추가
		map.put("queryId", "userSqlMap.insertUserInfo");
		map.put("param", userInfo);
		map.put("CUD", "insert");
		lists.add(map);
		
		// 사용자 권한 매핑
		for(Map<String, Object> bean : userInfo.getAuthgr_arr()) {
			map = new HashMap<>();
			map.put("queryId", "authSqlMap.insertUserAuthGrMapp");
			map.put("param", bean);
			map.put("CUD", "insert");
			lists.add(map);
		}
		
		// 트리 사용자 매핑
		if(userInfo.getTree_arr() != null) {
			for(Map<String, Object> bean : userInfo.getTree_arr()) {
				map = new HashMap<>();
				map.put("queryId", "treeinfoSqlMap.insertTreeUserMapp");
				map.put("param", bean);
				map.put("CUD", "insert");
				lists.add(map);
			}
		}
		
		dao.multiBatch(lists);
	}
	
	/**
	 * 사용자 수정
	 */
	public void updateUser(UserInfoBean userInfo) throws Exception {
		List<Map<String, Object>> lists = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		// 사용자 수정
		map.put("queryId", "userSqlMap.updateUserInfo");
		map.put("param", userInfo);
		map.put("CUD", "update");
		lists.add(map);
		
		// 사용자-권한그룹 삭제
		map = new HashMap<>();
		map.put("queryId", "authSqlMap.deleteUserAuthGrMapp");
		map.put("param", userInfo);
		map.put("CUD", "delete");
		lists.add(map);
		
		// 사용자 권한 매핑
		for(Map<String, Object> bean : userInfo.getAuthgr_arr()) {
			map = new HashMap<>();
			map.put("queryId", "authSqlMap.insertUserAuthGrMapp");
			map.put("param", bean);
			map.put("CUD", "insert");
			lists.add(map);
		}
		
		// 트리-사용자 매핑 삭제
		map = new HashMap<>();
		map.put("queryId", "treeinfoSqlMap.deleteTreeUserMap");
		map.put("param", userInfo);
		map.put("CUD", "delete");
		lists.add(map);
		
		// 트리 사용자 매핑
		if(userInfo.getTree_arr() != null) {
			for(Map<String, Object> bean : userInfo.getTree_arr()) {
				map = new HashMap<>();
				map.put("queryId", "treeinfoSqlMap.insertTreeUserMapp");
				map.put("param", bean);
				map.put("CUD", "insert");
				lists.add(map);
			}
		}
		
		dao.multiBatch(lists);
	}
	
	/**
	 * 사용자 삭제 Action
	 */
	public void deleteUser(UserInfoBean userInfo) throws Exception {
		// 사용자 - 권한그룹 매핑 삭제
		dao.delete("authSqlMap.deleteUserAuthGrMapp", userInfo);
		// 트리 - 사용자 매핑 삭제
		TreeInfoBean tBean = new TreeInfoBean();
		tBean.setUser_id(userInfo.getUser_id());
		dao.delete("treeinfoSqlMap.deleteTreeUserMap", tBean);
		// 통지 - 사용자 매핑 삭제
		AlarmBean aBean = new AlarmBean();
		aBean.setUser_id(userInfo.getUser_id());
		dao.delete("alarmSqlMap.deleteAlarmNotiUserMapp", aBean);
		// 사용자 삭제(use_yn을 'N'으로)
		dao.update("userSqlMap.deleteUserInfo", userInfo);
	}
	
	/**
	 * ??
	 * @param userInfo
	 * @return
	 * @throws Exception
	 */
	public List<UserInfoBean> userPrintLabel(UserInfoBean userInfo) throws Exception {
		List<UserInfoBean> list = new ArrayList<UserInfoBean>();
		
		String[] arr = StringUtil.split(userInfo.getUser_label_str(), "|");
		for(String s : arr){
			String[] f = StringUtil.split(s, ",");
			
			UserInfoBean b = new UserInfoBean();
			b.setUser_id(f[0]);
			b.setUser_position(f[1]);
			b.setUser_nm(f[2]);
			list.add(b);
		}
		
		return list;
	}
}