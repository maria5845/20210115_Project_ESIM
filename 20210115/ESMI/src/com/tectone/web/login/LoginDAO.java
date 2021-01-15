package com.tectone.web.login;

import org.springframework.stereotype.Repository;

import com.tectone.web.common.abstractinfo.AbstractDao;
import com.tectone.web.model.UserInfoBean;

/**
 * @author kookai
 *
 */
@Repository
public class LoginDAO extends AbstractDao {
	
    
	public UserInfoBean getUserInfo(UserInfoBean userInfo) throws Exception {
		return sqlSession.selectOne("loginSqlMap.getUserInfo", userInfo);
	}
	
	
	public UserInfoBean getUserInfoByIDPW(UserInfoBean userInfo) throws Exception {
		return sqlSession.selectOne("loginSqlMap.getUserInfoByIDPW", userInfo);
	}

	
	public UserInfoBean getUserInfoID(UserInfoBean userInfo) throws Exception {
		return sqlSession.selectOne("loginSqlMap.getUserInfoID", userInfo);
	}

	
	public void updateLastLoginUserInfo(UserInfoBean userInfo) {
		sqlSession.update("loginSqlMap.updateLastLogin", userInfo);
		
	}

	
	public void updateLastLoginUserLockInfo(UserInfoBean userInfo) {
		sqlSession.update("loginSqlMap.updateLoginUserLock", userInfo);
	}

	
	public void updatePwdLoginUserInfo(UserInfoBean userInfo) {
		sqlSession.update("loginSqlMap.updatePwd", userInfo);
	}
	
	
	public Integer updatePwdChgPopAction(UserInfoBean userinfoBean) throws Exception {
		return sqlSession.update("loginSqlMap.updatePwdChgPopAction", userinfoBean);
	}

}
