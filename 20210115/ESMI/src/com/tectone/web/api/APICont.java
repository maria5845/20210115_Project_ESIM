package com.tectone.web.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tectone.web.model.APIBean;
import com.tectone.web.object.ObjectCont;

@Controller
@RequestMapping("/api/*")
public class APICont extends ObjectCont {
	
	/** 로그 처리용 개체 선언 */
	protected Logger logger = LogManager.getLogger(getClass());
	
	@Inject
	private APIService service;
	
	/**
	 * API 연동 인터페이스
	 * VAR_ID 목록을 리턴
	 * 
	 * @param afterLoginRedirection
	 * @return
	 */
	@RequestMapping(value = "servicelist.do")
	public @ResponseBody Map<String, Object> servicelist(APIBean bean) {
		logger.info(" - [start] servicelist.do");
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			
			result.put("listType", bean.getListType());
			
			// 요청 listType 에 해당하는 결과 list 조회
			List<String> list = service.getServiceList(bean);
			result.put("list", list);
			
			result.put("result", "success");
			
		}catch(Exception ex){
			result.put("result", "E0001");
			logger.error(ex.getMessage());
		}
		logger.info(" - [end] servicelist.do");
		return result;
	}
	
	/**
	 * API 연동 인터페이스
	 * VAR_ID의 데이터를 기간으로 조회
	 * 
	 * @param afterLoginRedirection
	 * @return
	 */
	@RequestMapping(value = "service.do", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> doGet(APIBean bean) {
		logger.info(" - [start] GET : servicelist.do");
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			
			result.put("dvcId", bean.getDvcId());
			result.put("varId", bean.getVarId());
			result.put("stime", bean.getStime());
			result.put("etime", bean.getEtime());
			
			// 요청 파라미터(dvcId, varId, stime, etime)으로 검색된 결과 데이터
			List<Map<String, Object>> list = service.selectData(bean);
			result.put("dataCount", list.size());
			result.put("datas", list);
			
			result.put("result", "success");
			
		}catch(Exception ex){
			result.put("result", "E1001");
			logger.error(ex.getMessage());
		}
		logger.info(" - [end] GET : servicelist.do");
		return result;
	}
	
	/**
	 * API 연동 인터페이스
	 * VAR_ID의 데이터를 PIE DB에 입력
	 * 
	 * @param afterLoginRedirection
	 * @return
	 */
	@RequestMapping(value = "service.do", method=RequestMethod.POST, consumes="application/json")
	public @ResponseBody Map<String, Object> doPost(@RequestBody APIBean bean) {
		logger.info(" - [start] POST : servicelist.do");
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			logger.debug(bean);
			
			result.put("dvcId", bean.getDvcId());
			result.put("varId", bean.getVarId());
			result.put("dataCount", bean.getDataCount());
			
			// 입력 요청 정보 DB 저장
			service.insertData(bean);
			result.put("result", "success");
			
		}catch(Exception ex){
			result.put("result", "E2001");
			logger.debug(bean);
			logger.error(ex.getMessage());
		}
		logger.info(" - [end] POST : servicelist.do");
		return result;
	}
}
