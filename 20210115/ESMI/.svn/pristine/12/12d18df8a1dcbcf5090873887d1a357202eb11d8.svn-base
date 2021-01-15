package com.tectone.web.business.alarm;


import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.AlarmBean;
import com.tectone.web.model.AlarmRuleCondBean;

/**
 * 레이아웃 관리
 */
@Service
public class AlarmService extends AbstractService {

	@Inject
	private AlarmDao dao;
	
	@Resource(name="config")
	private Properties config;
	
	
	/**
	 * 알람 룰 추가/수정/삭제
	 * @param alarmBean
	 * @param action_type
	 * @throws Exception
	 */
	public void alarmRuleAction(AlarmBean alarmBean, String action_type) throws Exception{
		switch (action_type) {
		case "add":
			insertAlarmRule(alarmBean);
			break;
		case "modify":
			updateAlarmRule(alarmBean);
			break;
		case "delete":
			deleteAlarmRule(alarmBean);
			deleteAlarmRuleCond(alarmBean);
			break;
		}
	}
	
	public void alarmRuleAction(AlarmBean alarmBean, 
								List<AlarmRuleCondBean> condBeanList, 
								String action_type) throws Exception{
//		if(action_type =="add") {
//			deleteAllEqmAlarmRule(alarmBean);
//		}
		alarmRuleAction(alarmBean, action_type);
		alarmRuleCondAction(alarmBean, condBeanList);
		
	}
	
	private void updateAlarmCondRule(AlarmBean alarmBean, 
									 List<AlarmRuleCondBean> condBeanList) {
		int ruleSeq = alarmBean.getAlarm_rule_seq();
		
		dao.delete("alarmSqlMap.deleteAlarmRuleCondInfo", ruleSeq);
		for(AlarmRuleCondBean condBean : condBeanList) {
			condBean.setAlarm_rule_seq(ruleSeq);
			dao.insert("alarmSqlMap.insertAlarmRuleCondInfo", condBean);
		}
	}
	
	private void alarmRuleCondAction(AlarmBean alarmBean,
								     List<AlarmRuleCondBean> condBeanList) {
		int ruleSeq = alarmBean.getAlarm_rule_seq();
		dao.delete("alarmSqlMap.deleteAlarmRuleCondInfo", ruleSeq);
		for(AlarmRuleCondBean condBean : condBeanList) {
			condBean.setAlarm_rule_seq(ruleSeq);
			dao.insert("alarmSqlMap.insertAlarmRuleCondInfo", condBean);
		}
	}
	
	

	/**
	 * 알람 룰 insert
	 * @param alarmBean
	 */
	private void insertAlarmRule(AlarmBean alarmBean) throws Exception {
		
		dao.insert("alarmSqlMap.insertAlarmRuleInfo", alarmBean);
		
		// 장치 및 변수 맵핑
		String dvcIdStr = alarmBean.getDvc_id_str();
		String varIdStr = alarmBean.getVar_id_str();
//		dao.delete("alarmSqlMap.deleteAlarmRuleMapp", alarmBean);
		if( "N".equals(alarmBean.getTot_dvc_yn()) ){
			String[] arrDvcId = dvcIdStr.split(",");
			for( String dvcId : arrDvcId ){
				if( "".equals(dvcId) ) continue;
				alarmBean.setVar_seq(null);
				alarmBean.setDvc_seq(Integer.valueOf(dvcId));
				dao.insert("alarmSqlMap.insertAlarmRuleMapp", alarmBean);
			}
		}
		String[] arrVarId = varIdStr.split(",");
		for( String varId : arrVarId ){
			if( "".equals(varId) ) continue;
			alarmBean.setVar_seq(Integer.valueOf(varId));
			alarmBean.setDvc_seq(null);
			dao.insert("alarmSqlMap.insertAlarmRuleMapp", alarmBean);
		}
		
		// 통지정보
//		dao.delete("alarmSqlMap.deleteAlarmRuleNotiMapp", alarmBean);
//		dao.insert("alarmSqlMap.insertAlarmRuleNotiMapp", alarmBean);
		if(!alarmBean.getNoti_yn().equals("N")) {
			String notiSeqStr = alarmBean.getNoti_seq_str();
			String[] arrNotiSeq = notiSeqStr.split(",");
			for( String notiSeq : arrNotiSeq ){
				if( "".equals(notiSeq) ) continue;
				alarmBean.setNoti_seq(Integer.valueOf(notiSeq));
				dao.insert("alarmSqlMap.insertAlarmRuleNotiMapp", alarmBean);
			}
		}
	}
	

	/**
	 * 알람 룰 update
	 * @param alarmBean
	 */
	private void updateAlarmRule(AlarmBean alarmBean) throws Exception {
		
		dao.update("alarmSqlMap.updateAlarmRuleInfo", alarmBean);

		// 장치 및 변수 맵핑
		String dvcIdStr = alarmBean.getDvc_id_str();
		String varIdStr = alarmBean.getVar_id_str();
		dao.delete("alarmSqlMap.deleteAlarmRuleMapp", alarmBean);
		if( "N".equals(alarmBean.getTot_dvc_yn()) ){
			String[] arrDvcId = dvcIdStr.split(",");
			for( String dvcId : arrDvcId ){
				if( "".equals(dvcId) ) continue;
				alarmBean.setVar_seq(null);
				alarmBean.setDvc_seq(Integer.valueOf(dvcId));
				dao.insert("alarmSqlMap.insertAlarmRuleMapp", alarmBean);
			}
		}
		String[] arrVarId = varIdStr.split(",");
		for( String varId : arrVarId ){
			if( "".equals(varId) ) continue;
			alarmBean.setVar_seq(Integer.valueOf(varId));
			alarmBean.setDvc_seq(null);
			dao.insert("alarmSqlMap.insertAlarmRuleMapp", alarmBean);
		}
		
		// 통지정보
		dao.delete("alarmSqlMap.deleteAlarmRuleNotiMapp", alarmBean);
//		dao.insert("alarmSqlMap.insertAlarmRuleNotiMapp", alarmBean);
		if(!alarmBean.getNoti_yn().equals("N")) {
			String notiSeqStr = alarmBean.getNoti_seq_str();
			String[] arrNotiSeq = notiSeqStr.split(",");
			for( String notiSeq : arrNotiSeq ){
				if( "".equals(notiSeq) ) continue;
				alarmBean.setNoti_seq(Integer.valueOf(notiSeq));
				dao.insert("alarmSqlMap.insertAlarmRuleNotiMapp", alarmBean);
			}
		}
	}

	/**
	 * 알람 룰 delete
	 * @param alarmBean
	 */
	private void deleteAlarmRule(AlarmBean alarmBean) throws Exception {
		dao.delete("alarmSqlMap.deleteAlarmRuleInfo", alarmBean);
		dao.delete("alarmSqlMap.deleteAlarmRuleMapp", alarmBean);
		dao.delete("alarmSqlMap.deleteAlarmRuleNotiMapp", alarmBean);
	}
	
	private void deleteAlarmRuleCond(AlarmBean alarmBean) throws Exception {
		dao.delete("alarmSqlMap.deleteAlarmRuleCondInfo", alarmBean);
	}
	
	

	/**
	 * 통지 관리 추가 / 수정 / 삭제
	 * @param alarmBean
	 * @param action_type
	 * @throws Exception
	 */
	public void alarmNotiAction(AlarmBean alarmBean, String action_type) throws Exception {
		switch (action_type) {
		case "add":
			insertAlarmNoti(alarmBean);
			break;
		case "modify":
			updateAlarmNoti(alarmBean);
			break;
		case "delete":
			deleteAlarmNoti(alarmBean);
			break;
		}		
	}
	
	/**
	 * 통지 관리 insert
	 * @param alarmBean
	 */
	private void insertAlarmNoti(AlarmBean alarmBean) throws Exception {
		dao.insert("alarmSqlMap.insertAlarmNotiInfo", alarmBean);
		
		// 통지 관리 사용자 맵핑
		dao.delete("alarmSqlMap.deleteAlarmNotiUserMapp", alarmBean);
		String notiUserStr = alarmBean.getNoti_user_id_str();
		String[] arrUserId = notiUserStr.split(",");
		for( String userId : arrUserId ){
			if( "".equals(userId) ) continue;
			alarmBean.setNoti_user_id(userId);
			dao.insert("alarmSqlMap.insertAlarmNotiUserMapp", alarmBean);
		}
	}
	

	/**
	 * 알람 룰 update
	 * @param alarmBean
	 */
	private void updateAlarmNoti(AlarmBean alarmBean) throws Exception {
		dao.insert("alarmSqlMap.updateAlarmNotiInfo", alarmBean);
		
		// 통지 관리 사용자 맵핑
		dao.delete("alarmSqlMap.deleteAlarmNotiUserMapp", alarmBean);
		String notiUserStr = alarmBean.getNoti_user_id_str();
		String[] arrUserId = notiUserStr.split(",");
		for( String userId : arrUserId ){
			if( "".equals(userId) ) continue;
			alarmBean.setNoti_user_id(userId);
			dao.insert("alarmSqlMap.insertAlarmNotiUserMapp", alarmBean);
		}
	}

	/**
	 * 알람 룰 delete
	 * @param alarmBean
	 */
	private void deleteAlarmNoti(AlarmBean alarmBean) throws Exception {
		dao.insert("alarmSqlMap.deleteAlarmNotiInfo", alarmBean);
		dao.delete("alarmSqlMap.deleteAlarmNotiUserMapp", alarmBean);
	}

	/**
	 * 알람 리스트 수정
	 * @param alarmBean
	 * @param action_type
	 */
	public void alarmlistAction(AlarmBean alarmBean, String action_type) {
		dao.update("alarmSqlMap.updateAlarmList", alarmBean);
	}

}