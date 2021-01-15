package com.tectone.web.date;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.CustomBean;
import com.tectone.web.object.ObjectCont;

@RequestMapping("/date/*")
public class DateCont extends ObjectCont {

	@RequestMapping(value = "getDateTimeAjax.do")
	public @ResponseBody AjaxBean dateSet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException {
		AjaxBean ajaxBean = new AjaxBean();
		Date today = new Date();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
			String date = sdf.format(today);
			ajaxBean.setData("list", date);
			ajaxBean.setResult(true);
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean; 
	}
}
