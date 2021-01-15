package com.tectone.web.business.helper;


import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.HelperBean;
import com.tectone.web.object.ObjectCont;


@Controller
@RequestMapping("/helper/*")
public class HelperCont extends ObjectCont {
	
	@Inject
	private HelperService service;
	
	/**
	 * 자동완성 요청을 받는다
	 * @param UserInfoBean
	 * @return
	 */
	@RequestMapping(value = "getAutoComplete.do")
	public @ResponseBody AjaxBean getUserAutoComplete(HelperBean bean) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			if(!StringUtils.isEmpty(bean.getSearch_value())) {
				ajaxBean.setData("list", service.getAutoCompleteResult(bean));
			}
			
			ajaxBean.setResult(true);
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
}
