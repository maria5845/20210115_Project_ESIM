package com.tectone.web.business.alarm.data;


import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.util.RequestUtil;
import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.DataBean;
import com.tectone.web.object.ObjectCont;


@Controller
@RequestMapping("/data/*")
public class DataCont extends ObjectCont {
	
	@Inject
	private DataService service;
	
	/**
	 * 데이터 조회 화면 
	 * @param bean
	 */
	@RequestMapping(value = "datasearchmng.do")
	public ModelAndView datasearchmng(
			DataBean bean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("viewName", "../../alarm/data/datasearchmng");
			mv.setViewName("/common/layout/mng_layout_nolnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 데이터 조회 리스트 
	 * @param bean
	 */
	@RequestMapping("datasearchmngAjax.do")
	public @ResponseBody AjaxBean datasearchmngAjax(
			DataBean bean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			bean.setStart_t_md(bean.getStartdate().substring(4, 8));
			bean.setEnd_t_md(bean.getEnddate().substring(4, 8));
			
			ajaxBean.setData("page", service.selectRawDataPageing(bean));
			ajaxBean.setData("list", service.selectList("dataSqlMap.getRawDataList", bean));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 데이터 엑셀 다운로드
	 * @param req
	 * @param res
	 * @return
	 * @throws ServletException 
	 */
	@RequestMapping("getRawDataToExcelAjax.do")
	public @ResponseBody AjaxBean getRawDataToExcelAjax( HttpServletRequest req, HttpServletResponse res ) throws ServletException {
		
		AjaxBean ajaxBean = new AjaxBean();
		Map<String, Object> map = RequestUtil.getReqParamToMap(req);
		try{
			// 엑셀 파일 생성
			map.put("start_t_md", map.get("startdate").toString().substring(4, 8));
			map.put("end_t_md", map.get("enddate").toString().substring(4, 8));
			service.getRawDataToExcel(map, res);
		}catch( Exception e ){
			e.printStackTrace();
		}
		return ajaxBean;
	}
}
