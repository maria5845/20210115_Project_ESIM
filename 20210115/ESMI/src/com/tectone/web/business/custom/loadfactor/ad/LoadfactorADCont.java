package com.tectone.web.business.custom.loadfactor.ad;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.util.DateUtil;
import com.tectone.util.RequestUtil;
import com.tectone.web.business.setting.code.CodeService;
import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.CmcdBean;
import com.tectone.web.model.CustomBean;
import com.tectone.web.object.ObjectCont;

import net.sf.json.JSONArray;

@Controller
@EnableScheduling
@RequestMapping("/custom/*")
public class LoadfactorADCont extends ObjectCont{

	
	@Inject
	private LoadfactorADService service;
	
	@Inject
	private CodeService codeService;
	
	/**
	 * 부하율(Load Factor) 메인 화면
	 * @param CustomBean
	 */
	@RequestMapping(value = "loadfactorAD.do")
	public ModelAndView loadfactor( CustomBean bean ) {
		ModelAndView mv = new ModelAndView();
		try {
			String url = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
			bean.setLoadfactor_type("LOAD_FACTOR");
			bean.setTree_nm("CWA_PKG4");
			bean.setParent_url(url);
			mv.addObject("dvcList", service.selectList("loadfactorSqlMap.getDvcList", bean));
			mv.addObject("mainUnit", codeService.getCode("LOAD_FACTOR", "MAIN_UNIT"));
			bean.setVar_id("ALL");
			String resetDateStr = service.selectOne("loadfactorSqlMap.getResetDateByVarId", bean);
			
			if(resetDateStr == null) {
				resetDateStr = "-";
			}
			
			mv.addObject("resetDate", resetDateStr);
			mv.addObject("sdate", bean.getSdate());
			mv.addObject("edate", bean.getEdate());
			
			mv.addObject("viewName", "../../anomalydetection/loadfactorAD");
			mv.addObject("bean", bean);
			mv.setViewName("/custom/loadfactor/common/layout/mng_layout");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 부하율(Load Factor) 메인 화면 - 실린더
	 * @param CustomBean
	 */
	@RequestMapping(value = "loadfactorCylinderAD.do")
	public ModelAndView loadfactorCylinder( CustomBean bean ) {
		ModelAndView mv = new ModelAndView();
		try {
			String url = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
			bean.setLoadfactor_type("LOAD_FACTOR_CYLINDER");
			bean.setTree_nm("LOAD_FACTOR_CYLINDER");
			bean.setParent_url(url);
			mv.addObject("dvcList", service.selectList("loadfactorSqlMap.getDvcList", bean));
			
			mv.addObject("mainUnit", codeService.getCode("LOAD_FACTOR", "MAIN_UNIT"));
			mv.addObject("viewName", "../../anomalydetection/loadfactorAD");
			mv.addObject("bean", bean);
			mv.setViewName("/custom/loadfactor/common/layout/mng_layout");
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
	@RequestMapping("loadfactorADAjax.do")
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
			ajaxBean.setData("list", service.selectList("loadfactorSqlMap.getLoadFactorList", m));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	@RequestMapping("loadfactorADAlarmListAjax.do")
	public @ResponseBody AjaxBean loadfactorADListAjax(HttpServletRequest req) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
//			String baseDate = (String) m.get("startDate");
//			m.put("startDate", service.convertDateToNDayBefore(baseDate, -1));
//			m.put("endDate", DateUtil.convertDate(baseDate, "", "MMdd"));
			ajaxBean.setData("list", service.selectList("loadfactorSqlMap.getADAlarmList", m));
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
	@RequestMapping(value = "loaddetailAD.do")
	public ModelAndView loaddetail(
			CustomBean bean
	) {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("YYYY", new SimpleDateFormat("YYYY").format(new Date()));
			mv.addObject("mmdd", new SimpleDateFormat("MM/dd").format(new Date()));
			mv.addObject("bean", bean);
			mv.addObject("dvcList", service.selectList("loadfactorSqlMap.getDvcList", bean));
			mv.addObject("viewName", "../../anomalydetection/loaddetailAD");
			mv.setViewName("/custom/loadfactor/common/layout/mng_layout");
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
	@RequestMapping("loaddetailADmainAjax.do")
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
			ajaxBean.setData("list", service.selectList("loadfactorSqlMap.getLoadFactorDetail", m));
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 구동부별 상세 서브 왼쪽 차트
	 */
	@RequestMapping("loaddetailADSubLeftAjax.do")
	public @ResponseBody AjaxBean loaddetailSubLeftAjax(
			HttpServletRequest req, 
			HttpServletResponse res,
			@RequestParam(value="arr[]", required=false) List<String> list
	) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			ajaxBean.setData("list", service.selectList("loadfactorSqlMap.getloadSubLeft", m));
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
	@RequestMapping("loadFactorADAlarmAjax.do")
	public @ResponseBody AjaxBean moldIndexPredAjax(
			HttpServletRequest req) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			ajaxBean.setData("list", service.selectList("loadfactorSqlMap.getLoadFactorAlarmList", m));
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
	 */
	@RequestMapping("getLoadFactorADExcelAjax.do")
	public @ResponseBody AjaxBean getLoadFactorExcelAjax( HttpServletRequest req, HttpServletResponse res ) {
		AjaxBean ajaxBean = new AjaxBean();
		try{
			// 엑셀 파일 생성
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			String baseDate = (String) m.get("edate");
			m.put("periodStr", service.convertDateToPeriodStrList(baseDate, -15));
			service.getLoadFactorDataToExcel(m, res);
		}catch( Exception e ){
			e.printStackTrace();
		}
		return ajaxBean;
	}
	
	@RequestMapping("updateADListItemStatusAjax.do")
	public @ResponseBody AjaxBean updateADListItemStatusAjax( HttpServletRequest req, HttpServletResponse res ) {
		AjaxBean ajaxBean = new AjaxBean();
		try{
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
			service.update("loadfactorSqlMap.updateADListForCheckFlag", m);
			ajaxBean.setResult(true);
		}catch( Exception e ){
			e.printStackTrace();
			ajaxBean.setResult(false);
			ajaxBean.setMsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	@RequestMapping("resetAdIndexAjax.do")
	public @ResponseBody AjaxBean resetAdIndexAjax( HttpServletRequest req, HttpServletResponse res ) {
		AjaxBean ajaxBean = new AjaxBean();
		try{
			Map<String, Object> m = RequestUtil.getReqParamToMap(req);
//			service.delete("loadfactorSqlMap.deleteADList", m);
			service.update("loadfactorSqlMap.updateADListForCheckFlag", m);
			service.update("loadfactorSqlMap.updateADResetDate", m);
			if(m.get("var_id") == null || m.get("var_id") == "") {
				service.update("loadfactorSqlMap.updateADResetDateHist", m);
				service.update("loadfactorSqlMap.insertADResetDateHist", m);
			}
			
			ajaxBean.setResult(true);
		}catch( Exception e ){
			e.printStackTrace();
			ajaxBean.setResult(false);
			ajaxBean.setMsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * Reset History Modal 
	 * @param actionType
	 * @return
	 */
	@RequestMapping(value = "modalResetAdHistList.do")
	public ModelAndView resetHistListDetail() {
		ModelAndView mv = new ModelAndView();
		try {

			mv.addObject("resetDateList", JSONArray.fromObject(service.selectList("loadfactorSqlMap.getResetDateHistList")).toString());
			
			mv.addObject("viewName", "../../custom/loadfactor/anomalydetection/resetADDetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@Scheduled(cron = "0 0 3 * * *")
//	@Scheduled(cron = "0 0/1 * * * *")
	public void updateAdList() {
		Map<String, String> paramMap = new HashMap<String, String>();
		Map<String, String> scheduleMap = new HashMap<String, String>();
		String failReason = ""; 
		
		String t_md = DateUtil.getCurrentDate("MMdd");
		paramMap.put("t_md", t_md);
		//마지막 작업 Seq
		CmcdBean statusVarIdCmcd = service.getCmcdOne("SETTING_VAR_ID", "STATUS", "Y");
		CmcdBean speedVarIdCmcd = service.getCmcdOne("SETTING_VAR_ID", "SPEED", "Y");
		//당일 가동상태가 1이 없는 경우 skip
		if(statusVarIdCmcd != null 
				&& statusVarIdCmcd.getCd_attr_1() != null
				&& !statusVarIdCmcd.getCd_attr_1().trim().equals("") 
				&& NumberUtils.isParsable(statusVarIdCmcd.getCd_attr_1())) {

			paramMap.put("status_var_id", statusVarIdCmcd.getCd_val());
			paramMap.put("status_data_val", statusVarIdCmcd.getCd_attr_1());
			Map<String, String> statusData = service.selectOne("loadfactorSqlMap.getStatusRawData", paramMap);			
			if(statusData == null){
	//			insert hist
				failReason += "Device status no 1 value";
				scheduleMap.put("fail_reason", failReason);
				scheduleMap.put("run_type", "NG");
				scheduleMap.put("dvc_run_yn", "N");
				service.insert("loadfactorSqlMap.insertScheduleRunHist", scheduleMap);
				return;
			}else {
				System.out.println("statusData is not null");
			}
		}else if(statusVarIdCmcd == null){
			System.out.println("statusVarIdCmcd is null");
		}else {
			System.out.println(statusVarIdCmcd.getCd_val());
		}
		
		//당일 공정속도 변경이 일어난 경우 skip
		if(speedVarIdCmcd != null) {
			paramMap.put("speed_var_id", speedVarIdCmcd.getCd_val());
			Map<String, String> speedHistoryData = service.selectOne("loadfactorSqlMap.getSpeedHistoryData", paramMap);
			if(speedHistoryData != null){
				//			reset 테스트 필요
				paramMap.put("type","auto");
				service.update("loadfactorSqlMap.updateADListForCheckFlag", paramMap);
				service.update("loadfactorSqlMap.updateADResetDate",paramMap);
	//			//			insert hist
				failReason += "Device process speed status is changed";
	//			insert hist
				scheduleMap.put("fail_reason", failReason);
				scheduleMap.put("run_type", "NG");
				scheduleMap.put("dvc_run_yn", "Y");
				service.insert("loadfactorSqlMap.insertScheduleRunHist", scheduleMap);
				return;
			}
		}
		//이상축 List Upsert
		service.insert("loadfactorSqlMap.insertAbnormalAxisList", paramMap);
		service.insert("loadfactorSqlMap.insertAbnormalAxisList_con", paramMap);
		service.update("loadfactorSqlMap.updateAbnormalAxisListForResetDateCnt", paramMap);
//		정상작동 날짜 insert
		scheduleMap.put("fail_reason", failReason);
		scheduleMap.put("run_type", "RUN");
		scheduleMap.put("dvc_run_yn", "Y");
		service.insert("loadfactorSqlMap.insertScheduleRunHist", scheduleMap);
	}
	
}
