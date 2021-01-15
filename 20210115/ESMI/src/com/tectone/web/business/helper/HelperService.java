package com.tectone.web.business.helper;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.HelperBean;

/**
 * 자동완성 조회
 * @author shkim
 *
 */
@Service
public class HelperService extends AbstractService {

	@Inject
	private HelperDao dao;

	/**
	 * 
	 * @param param
	 * @return
	 */
	public List<HelperBean> getAutoCompleteResult(HelperBean bean) {
		List<HelperBean> list = new ArrayList<HelperBean>();
		
		// USER NAME
		if("USER_NM".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getUserNm", bean);
		// USER ID
		}else if("USER_ID".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getUserId", bean);
		// DVC_ID	
		}else if("DVC_ID".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getDvcId", bean);
		// DVC_NAME	
		}else if("DVC_NM".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getDvcNm", bean);
		// PARAM_GR_NAME	
		}else if("PARAM_GR_NM".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getParamGrNm", bean);
		// ALARM_RULE_NAME	
		}else if("ALARM_RULE_NM".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getAlarmRuleNm", bean);
		// NOTI_ATTR_1	
		}else if("NOTI_ATTR_1".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getNotiAttr", bean);
		// VAR_ID	
		}else if("VAR_ID".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getVarId", bean);
		// DTSRC_NM
		}else if("DTSRC_NM".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getDtsrcNm", bean);
		// PNL_NM	
		}else if("PNL_NM".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getPnlNm", bean);
		// DSBD_NM	
		}else if("DSBD_NM".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getDsbdNm", bean);
		// OPER_TRIGGER
		}else if("OPER_TRIGGER".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getOperTrigger", bean);
		// PARAM_REF
		}else if("PARAM_REF".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getParamRef", bean);
		// OPER_TRIGGER_MASTER
		}else if("OPER_TRIGGER_M".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getOperTriggerMaster", bean);
		// OPER_TRIGGER_MASTER
		}else if("PARAM_REF_M".equalsIgnoreCase(String.valueOf(bean.getSearch_type()))) {
			list = dao.selectList("helperSqlMap.getParamRefMaster", bean);
		}

		return list;
	}

}