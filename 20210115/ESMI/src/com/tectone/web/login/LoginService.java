package com.tectone.web.login;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.UserInfoBean;



@Service
public class LoginService extends AbstractService {
	@Inject
	private LoginDAO loginDAO;

	public UserInfoBean getUserInfo(UserInfoBean userInfo) throws Exception {
		return loginDAO.getUserInfo(userInfo);
	}

	public UserInfoBean getUserInfoByIDPW(UserInfoBean userInfo) throws Exception {
		return loginDAO.getUserInfoByIDPW(userInfo);
	}

	
	public UserInfoBean getUserInfoID(UserInfoBean userInfo) throws Exception {
		return loginDAO.getUserInfoID(userInfo);
	}

	
	public void updateLastLoginUserInfo(UserInfoBean userInfo) throws Exception {
		loginDAO.updateLastLoginUserInfo(userInfo);
	}

	
	public void updateLastLoginUserLockInfo(UserInfoBean userInfo) {
		loginDAO.updateLastLoginUserLockInfo(userInfo);
		
	}

	
	public void updatePwdLoginUserInfo(UserInfoBean userInfo) {
		loginDAO.updatePwdLoginUserInfo(userInfo);
		
	}
	
	
	public AjaxBean pwdchgpopActionAjax(UserInfoBean userinfoBean) throws Exception {
		AjaxBean ajaxBean = new AjaxBean();
		Integer cnt = updatePwdChgPopAction(userinfoBean);
		if(cnt != 1){
			ajaxBean.setMsg("Failed to modify.");
			return ajaxBean;
		}
		ajaxBean.setResult(true);
		return ajaxBean;
	}
	
	
	public Integer updatePwdChgPopAction(UserInfoBean userinfoBean) throws Exception {
		return loginDAO.updatePwdChgPopAction(userinfoBean);
	}

}
