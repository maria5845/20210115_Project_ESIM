package com.tectone.web.business.custom.cwa.cwapackage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.util.DateUtil;
import com.tectone.util.JsonUtil;
import com.tectone.util.RequestUtil;
import com.tectone.web.business.alarm.data.DataService;
import com.tectone.web.business.setting.code.CodeService;
import com.tectone.web.business.setting.tree.TreeInfoService;
import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.AlarmBean;
import com.tectone.web.model.CustomBean;
import com.tectone.web.model.TreeInfoBean;
import com.tectone.web.object.ObjectCont;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/custom/*")
public class CwaPackageCont extends ObjectCont{

	
	@Inject
	private CwaPackageService service;
	
	@Inject
	private TreeInfoService treeService;

	@Inject
	private DataService dataService;
	
	@Inject
	private CodeService codeService;
	
	/**
	 * 금형 & 인덱스 고장예지
	 * @param CustomBean
	 */
	@RequestMapping(value = "moldIndexPred.do")
	public ModelAndView moldIndexPred(
			CustomBean bean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("viewName", "../../package/moldIndexPred");
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 금형 & 인덱스 고장예지 값 Ajax
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("getIndexFormingAjax.do")
	public @ResponseBody AjaxBean getIndexFormingAjax(HttpServletRequest req) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			
			ajaxBean.setData("list", service.selectList("customSqlMap.getIndexForming", m));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	/**
	 * 금형 & 인덱스 고장예지 알람 List Ajax
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("moldIndexPredAjax.do")
	public @ResponseBody AjaxBean moldIndexPredAjax(
			AlarmBean bean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("customSqlMap.getAlarmList", bean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	
	/**
	 * 단축로봇 고장예지 메인 1
	 * @param CustomBean
	 */
	@RequestMapping(value = "singleAxisMain1.do")
	public ModelAndView singleAxisMain1(
			CustomBean bean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("viewName", "../../package/singleAxisMain1");
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 단축로봇 고장예지 메인 1 Ajax
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("singleAxisMain1Ajax.do")
	public @ResponseBody AjaxBean singleAxisMain1Ajax(
			AlarmBean bean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("customSqlMap.getAlarmList", bean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	
	/**
	 * 단축로봇 고장예지 메인 2
	 * @param CustomBean
	 */
	@RequestMapping(value = "singleAxisMain2.do")
	public ModelAndView singleAxisMain2(
			CustomBean bean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("viewName", "../../package/singleAxisMain2");
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 단축로봇 고장예지 메인 2 Ajax
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("singleAxisMain2Ajax.do")
	public @ResponseBody AjaxBean singleAxisMain2Ajax(
			AlarmBean bean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("customSqlMap.getAlarmList", bean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 단축로봇 고장예지 메인 3
	 * @param CustomBean
	 */
	@RequestMapping(value = "singleAxisMain3.do")
	public ModelAndView singleAxisMain3(
			CustomBean bean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("viewName", "../../package/singleAxisMain3");
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 단축로봇 고장예지 메인 3 Ajax
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("singleAxisMain3Ajax.do")
	public @ResponseBody AjaxBean singleAxisMain3Ajax(
			AlarmBean bean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("customSqlMap.getAlarmList", bean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 패키지 단축로봇 고장예지 (시계열분석) heatmap
	 * @param CustomBean
	 */
	@RequestMapping(value = "timeSerisePred.do")
	public ModelAndView timeSerisePred(
			CustomBean bean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("tree_use_yn", "Y");
			mv.addObject("viewName", "../../package/timeSerisePred");
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 패키지 단축로봇 고장예지 (시계열분석) heatmap Ajax
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("timeSerisePredAjax.do")
	public @ResponseBody AjaxBean timeSerisePredAjax(
			AlarmBean bean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("customSqlMap.getTimeSeriseList", bean));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 패키지 단축로봇 고장예지 (시계열분석) 장치 Ajax
	 * @return
	 */
	@RequestMapping(value = "timeSeriseDvcAjax.do")
	public @ResponseBody AjaxBean timeSeriseDvcAjax() {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			TreeInfoBean bean = new TreeInfoBean();
			
			bean.setDsbd_seq(7);
			bean.setLogin_user_id("admin");
			
			ajaxBean.setData("list", JsonUtil.getRecursiveJson(JSONArray.fromObject(treeService.getLnbTreeList(bean)), "tree_seq", "p_tree_seq").toString());
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 부하율(Load Factor) 화면 출력
	 * @param CustomBean
	 */
	@RequestMapping(value = "loadfactor.do")
	public ModelAndView loadfactor( CustomBean bean ) {
		ModelAndView mv = new ModelAndView();
		try {
			String url = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
			bean.setLoadfactor_type("LOAD_FACTOR");
			bean.setTree_nm("CWA_PKG4");
			bean.setParent_url(url);
			mv.addObject("dvcList", service.selectList("customSqlMap.getDvcList", bean));
			mv.addObject("mainUnit", codeService.getCode("LOAD_FACTOR", "MAIN_UNIT"));
			mv.addObject("viewName", "../../package/loadfactor");
			mv.addObject("bean", bean);
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "loadfactorCylinder.do")
	public ModelAndView loadfactorCylinder( CustomBean bean ) {
		ModelAndView mv = new ModelAndView();
		try {
			String url = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
			bean.setLoadfactor_type("LOAD_FACTOR_CYLINDER");
			bean.setTree_nm("LOAD_FACTOR_CYLINDER");
			bean.setParent_url(url);
			mv.addObject("dvcList", service.selectList("customSqlMap.getDvcList", bean));
			mv.addObject("mainUnit", codeService.getCode("LOAD_FACTOR", "MAIN_UNIT"));
			mv.addObject("viewName", "../../package/loadfactor");
			mv.addObject("bean", bean);
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 구동부 부하 증감율 차트 데이터 조회 
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("loadfactorAjax.do")
	public @ResponseBody AjaxBean loadfactorAjax(
			HttpServletRequest req, 
			HttpServletResponse res,
			@RequestParam(value="arr[]", required=false) List<String> list
	) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			String baseDate = (String) m.get("startDate");
			m.put("startDate", service.convertDateToNDayBefore(baseDate, -1));
			m.put("endDate", DateUtil.convertDate(baseDate, "", "MMdd"));
			ajaxBean.setData("list", service.selectList("customSqlMap.getLoadFactorList", m));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 구동부 별 부하 상세 화면
	 * @param CustomBean
	 */
	@RequestMapping(value = "loaddetail.do")
	public ModelAndView loaddetail(
			CustomBean bean
	) {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("YYYY", new SimpleDateFormat("YYYY").format(new Date()));
			mv.addObject("mmdd", new SimpleDateFormat("MM/dd").format(new Date()));
			mv.addObject("bean", bean);
			mv.addObject("dvcList", service.selectList("customSqlMap.getDvcList", bean));
			mv.addObject("viewName", "../../package/loaddetail");
			mv.setViewName("/custom/cwa/common/layout/mng_layout");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 구동부별 상세 메인 차트
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("loaddetailmainAjax.do")
	public @ResponseBody AjaxBean loaddetailmainAjax(
			HttpServletRequest req, 
			HttpServletResponse res,
			@RequestParam(value="arr[]", required=false) List<String> list
	) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			String baseDate = (String) m.get("edate");
			m.put("startDate", service.convertDateToNDayBefore(baseDate, -1));
			m.put("endDate", DateUtil.convertDate(baseDate, "", "MMdd"));
			m.put("periodStr", service.convertDateToPeriodStrList(baseDate, -5));
			ajaxBean.setData("list", service.selectList("customSqlMap.getLoadFactorDetail", m));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/*
	 * 구동부별 상세 서브 왼쪽 차트
	 */
	@RequestMapping("loaddetailSubLeftAjax.do")
	public @ResponseBody AjaxBean loaddetailSubLeftAjax(
			HttpServletRequest req, 
			HttpServletResponse res,
			@RequestParam(value="arr[]", required=false) List<String> list
	) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			ajaxBean.setData("list", service.selectList("customSqlMap.getloadSubLeft", m));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/*
	 * 구동부별 상세 서브 오른쪽 차트
	 */
	@RequestMapping("loaddetailSubRightAjax.do")
	public @ResponseBody AjaxBean loaddetailSubRightAjax(
			HttpServletRequest req, 
			HttpServletResponse res,
			@RequestParam(value="arr[]", required=false) List<String> list
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			ajaxBean.setData("list", service.selectList("customSqlMap.getloadSubRight", m));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * @param AlarmBean
	 * @return
	 */
	@RequestMapping("loadFactorAlarmAjax.do")
	public @ResponseBody AjaxBean moldIndexPredAjax(
			HttpServletRequest req) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			String baseDate = (String) m.get("edate");
			m.put("periodStr", service.convertDateToPeriodStrList(baseDate, -5));
			ajaxBean.setData("list", service.selectList("customSqlMap.getLoadFactorAlarmList", m));
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
	@RequestMapping("getLoadFactorExcelAjax.do")
	public @ResponseBody AjaxBean getLoadFactorExcelAjax( HttpServletRequest req, HttpServletResponse res ) throws ServletException {
		AjaxBean ajaxBean = new AjaxBean();
		Map<String, Object> m = RequestUtil.getReqParamToMap(req);
		try{
			// 엑셀 파일 생성
			String baseDate = (String) m.get("edate");
			m.put("periodStr", service.convertDateToPeriodStrList(baseDate, -15));
			service.getLoadFactorDataToExcel(m, res);
		}catch( Exception e ){
			e.printStackTrace();
		}
		return ajaxBean;
	}
}
