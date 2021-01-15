package com.tectone.web.model;

import java.util.List;

public class AlarmBean extends CommonBean {
	private Integer alarm_rule_seq;
	private String alarm_rule_nm;
	private String alarm_msg;
	private String tot_dvc_yn;
	private String alarm_type;
	private String alarm_type_nm;
	private String chk_attr_1;
	private float chk_data_1;
	private String chk_attr_2;
	private float chk_data_2;
	private Integer chk_duration;
	private String chk_tm_yn;
	private String chk_start_tm;
	private String chk_finish_tm;
	private String alarm_lvl;
	private String alarm_lvl_nm;
	private String alarm_state;
	private String alarm_state_nm;
	private Integer alarm_interval;
	private String noti_yn;
	private String use_yn;
	private String gen_by;
	private String gen_by_nm;
	private String gen_dt;
	private String mdfy_by;
	private String mdfy_by_nm;
	private String mdfy_dt;
	private String cep_str;
	private String alarm_rule_type;
	
	
	private String chk_op_label;
	private String chk_time_label;
	
	private Integer alarm_rule_mapp_seq;
	private Integer dvc_seq;
	private String dvc_id;
	private String dvc_id_str;
	private String dvc_nm;
	private Integer var_seq;
	private String var_id;
	private String var_id_str;
	private String var_nm;
	private Integer noti_seq;
	private String noti_seq_str;
	private String noti_type;
	private String noti_type_nm;
	private String noti_attr;
	private String noti_attr_1;
	private String noti_attr_2;
	private String noti_attr_3;
	private String noti_attr_4;
	
	private List<AlarmBean> mappList;
	private List<AlarmBean> notiMappList;
	
	private boolean isMappChanged;
	
	private String checked;
	
	// alarm_list
	private Integer alarm_seq;
	private String alarm_seq_str;
	private String alarm_data_val;
	private Integer accu_cnt;
	private String cnfrm_msg;
	
	private String startdate;
	private String enddate;
	
	// alarm - noti mapping count
	private String mapping_yn;
	private String noti_nm;
	// 통지 사용자 맵핑 str
	private String noti_user_id;
	private String noti_user_id_str;
	
	// 경고음
	private Integer beep_sec;
	
	
	@Override
	public String toString() {
		return "AlarmBean [alarm_rule_seq=" + alarm_rule_seq + ", alarm_rule_nm=" + alarm_rule_nm + ", alarm_msg="
				+ alarm_msg + ", tot_dvc_yn=" + tot_dvc_yn + ", alarm_type=" + alarm_type + ", alarm_type_nm="
				+ alarm_type_nm + ", chk_attr_1=" + chk_attr_1 + ", chk_data_1=" + chk_data_1 + ", chk_attr_2="
				+ chk_attr_2 + ", chk_data_2=" + chk_data_2 + ", chk_duration=" + chk_duration + ", chk_tm_yn="
				+ chk_tm_yn + ", chk_start_tm=" + chk_start_tm + ", chk_finish_tm=" + chk_finish_tm + ", alarm_lvl="
				+ alarm_lvl + ", alarm_lvl_nm=" + alarm_lvl_nm + ", alarm_state=" + alarm_state + ", alarm_state_nm="
				+ alarm_state_nm + ", alarm_interval=" + alarm_interval + ", noti_yn=" + noti_yn + ", use_yn=" + use_yn
				+ ", gen_by=" + gen_by + ", gen_by_nm=" + gen_by_nm + ", gen_dt=" + gen_dt + ", mdfy_by=" + mdfy_by
				+ ", mdfy_by_nm=" + mdfy_by_nm + ", mdfy_dt=" + mdfy_dt + ", cep_str=" + cep_str + ", chk_op_label="
				+ chk_op_label + ", chk_time_label=" + chk_time_label + ", alarm_rule_mapp_seq=" + alarm_rule_mapp_seq
				+ ", dvc_seq=" + dvc_seq + ", dvc_id=" + dvc_id + ", dvc_id_str=" + dvc_id_str + ", dvc_nm=" + dvc_nm
				+ ", var_seq=" + var_seq + ", var_id=" + var_id + ", var_id_str=" + var_id_str + ", var_nm=" + var_nm
				+ ", noti_seq=" + noti_seq + ", noti_seq_str=" + noti_seq_str + ", noti_type=" + noti_type
				+ ", noti_type_nm=" + noti_type_nm + ", noti_attr=" + noti_attr + ", noti_attr_1=" + noti_attr_1
				+ ", noti_attr_2=" + noti_attr_2 + ", noti_attr_3=" + noti_attr_3 + ", noti_attr_4=" + noti_attr_4
				+ ", mappList=" + mappList + ", notiMappList=" + notiMappList + ", isMappChanged=" + isMappChanged
				+ ", checked=" + checked + ", alarm_seq=" + alarm_seq + ", alarm_seq_str=" + alarm_seq_str
				+ ", alarm_data_val=" + alarm_data_val + ", accu_cnt=" + accu_cnt + ", cnfrm_msg=" + cnfrm_msg
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", mapping_yn=" + mapping_yn + ", noti_nm="
				+ noti_nm + ", noti_user_id=" + noti_user_id + ", noti_user_id_str=" + noti_user_id_str + ", beep_sec="
				+ beep_sec + "]";
	}



	public Integer getAlarm_rule_seq() {
		return alarm_rule_seq;
	}



	public void setAlarm_rule_seq(Integer alarm_rule_seq) {
		this.alarm_rule_seq = alarm_rule_seq;
	}



	public String getAlarm_rule_nm() {
		return alarm_rule_nm;
	}



	public void setAlarm_rule_nm(String alarm_rule_nm) {
		this.alarm_rule_nm = alarm_rule_nm;
	}



	public String getAlarm_msg() {
		return alarm_msg;
	}



	public void setAlarm_msg(String alarm_msg) {
		this.alarm_msg = alarm_msg;
	}



	public String getTot_dvc_yn() {
		return tot_dvc_yn;
	}



	public void setTot_dvc_yn(String tot_dvc_yn) {
		this.tot_dvc_yn = tot_dvc_yn;
	}



	public String getAlarm_type() {
		return alarm_type;
	}



	public void setAlarm_type(String alarm_type) {
		this.alarm_type = alarm_type;
	}



	public String getAlarm_type_nm() {
		return alarm_type_nm;
	}



	public void setAlarm_type_nm(String alarm_type_nm) {
		this.alarm_type_nm = alarm_type_nm;
	}



	public String getChk_attr_1() {
		return chk_attr_1;
	}



	public void setChk_attr_1(String chk_attr_1) {
		this.chk_attr_1 = chk_attr_1;
	}



	public float getChk_data_1() {
		return chk_data_1;
	}



	public void setChk_data_1(float chk_data_1) {
		this.chk_data_1 = chk_data_1;
	}



	public String getChk_attr_2() {
		return chk_attr_2;
	}



	public void setChk_attr_2(String chk_attr_2) {
		this.chk_attr_2 = chk_attr_2;
	}



	public float getChk_data_2() {
		return chk_data_2;
	}



	public void setChk_data_2(float chk_data_2) {
		this.chk_data_2 = chk_data_2;
	}



	public String getChk_tm_yn() {
		return chk_tm_yn;
	}



	public void setChk_tm_yn(String chk_tm_yn) {
		this.chk_tm_yn = chk_tm_yn;
	}



	public String getChk_start_tm() {
		return chk_start_tm;
	}



	public void setChk_start_tm(String chk_start_tm) {
		this.chk_start_tm = chk_start_tm;
	}



	public String getChk_finish_tm() {
		return chk_finish_tm;
	}



	public void setChk_finish_tm(String chk_finish_tm) {
		this.chk_finish_tm = chk_finish_tm;
	}



	public String getAlarm_lvl() {
		return alarm_lvl;
	}



	public void setAlarm_lvl(String alarm_lvl) {
		this.alarm_lvl = alarm_lvl;
	}



	public String getAlarm_lvl_nm() {
		return alarm_lvl_nm;
	}



	public void setAlarm_lvl_nm(String alarm_lvl_nm) {
		this.alarm_lvl_nm = alarm_lvl_nm;
	}



	public String getAlarm_state() {
		return alarm_state;
	}



	public void setAlarm_state(String alarm_state) {
		this.alarm_state = alarm_state;
	}



	public String getAlarm_state_nm() {
		return alarm_state_nm;
	}



	public void setAlarm_state_nm(String alarm_state_nm) {
		this.alarm_state_nm = alarm_state_nm;
	}



	public Integer getAlarm_interval() {
		return alarm_interval;
	}



	public void setAlarm_interval(Integer alarm_interval) {
		this.alarm_interval = alarm_interval;
	}



	public String getNoti_yn() {
		return noti_yn;
	}



	public void setNoti_yn(String noti_yn) {
		this.noti_yn = noti_yn;
	}



	public String getUse_yn() {
		return use_yn;
	}



	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}



	public String getGen_by() {
		return gen_by;
	}



	public void setGen_by(String gen_by) {
		this.gen_by = gen_by;
	}



	public String getGen_by_nm() {
		return gen_by_nm;
	}



	public void setGen_by_nm(String gen_by_nm) {
		this.gen_by_nm = gen_by_nm;
	}



	public Integer getAlarm_rule_mapp_seq() {
		return alarm_rule_mapp_seq;
	}



	public void setAlarm_rule_mapp_seq(Integer alarm_rule_mapp_seq) {
		this.alarm_rule_mapp_seq = alarm_rule_mapp_seq;
	}



	public Integer getDvc_seq() {
		return dvc_seq;
	}



	public void setDvc_seq(Integer dvc_seq) {
		this.dvc_seq = dvc_seq;
	}



	public String getDvc_id() {
		return dvc_id;
	}



	public void setDvc_id(String dvc_id) {
		this.dvc_id = dvc_id;
	}



	public String getDvc_nm() {
		return dvc_nm;
	}



	public void setDvc_nm(String dvc_nm) {
		this.dvc_nm = dvc_nm;
	}



	public Integer getVar_seq() {
		return var_seq;
	}



	public void setVar_seq(Integer var_seq) {
		this.var_seq = var_seq;
	}



	public String getVar_id() {
		return var_id;
	}



	public void setVar_id(String var_id) {
		this.var_id = var_id;
	}



	public String getVar_nm() {
		return var_nm;
	}



	public void setVar_nm(String var_nm) {
		this.var_nm = var_nm;
	}



	public Integer getNoti_seq() {
		return noti_seq;
	}



	public void setNoti_seq(Integer noti_seq) {
		this.noti_seq = noti_seq;
	}



	public String getNoti_type() {
		return noti_type;
	}



	public void setNoti_type(String noti_type) {
		this.noti_type = noti_type;
	}



	public String getNoti_type_nm() {
		return noti_type_nm;
	}



	public void setNoti_type_nm(String noti_type_nm) {
		this.noti_type_nm = noti_type_nm;
	}



	public List<AlarmBean> getMappList() {
		return mappList;
	}



	@SuppressWarnings("unchecked")
	public void setMappList(List<?> mappList) {
		this.mappList = (List<AlarmBean>)mappList;
	}



	public List<AlarmBean> getNotiMappList() {
		return notiMappList;
	}



	@SuppressWarnings("unchecked")
	public void setNotiMappList(List<?> notiMappList) {
		this.notiMappList = (List<AlarmBean>)notiMappList;
	}



	public boolean isMappChanged() {
		return isMappChanged;
	}



	public void setMappChanged(boolean isMappChanged) {
		this.isMappChanged = isMappChanged;
	}



	public String getChk_op_label() {
		return chk_op_label;
	}



	public void setChk_op_label(String chk_op_label) {
		this.chk_op_label = chk_op_label;
	}



	public String getChk_time_label() {
		return chk_time_label;
	}



	public void setChk_time_label(String chk_time_label) {
		this.chk_time_label = chk_time_label;
	}



	public String getDvc_id_str() {
		return dvc_id_str;
	}



	public void setDvc_id_str(String dvc_id_str) {
		this.dvc_id_str = dvc_id_str;
	}



	public String getVar_id_str() {
		return var_id_str;
	}



	public void setVar_id_str(String var_id_str) {
		this.var_id_str = var_id_str;
	}



	public String getChecked() {
		return checked;
	}



	public void setChecked(String checked) {
		this.checked = checked;
	}



	public Integer getAlarm_seq() {
		return alarm_seq;
	}


	public void setAlarm_seq(Integer alarm_seq) {
		this.alarm_seq = alarm_seq;
	}

	public String getAlarm_data_val() {
		return alarm_data_val;
	}

	public void setAlarm_data_val(String alarm_data_val) {
		this.alarm_data_val = alarm_data_val;
	}

	public Integer getAccu_cnt() {
		return accu_cnt;
	}

	public void setAccu_cnt(Integer accu_cnt) {
		this.accu_cnt = accu_cnt;
	}

	public String getCnfrm_msg() {
		return cnfrm_msg;
	}



	public void setCnfrm_msg(String cnfrm_msg) {
		this.cnfrm_msg = cnfrm_msg;
	}



	public String getMdfy_by() {
		return mdfy_by;
	}



	public void setMdfy_by(String mdfy_by) {
		this.mdfy_by = mdfy_by;
	}



	public String getMdfy_dt() {
		return mdfy_dt;
	}



	public void setMdfy_dt(String mdfy_dt) {
		this.mdfy_dt = mdfy_dt;
	}



	public String getStartdate() {
		return startdate;
	}



	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}



	public String getEnddate() {
		return enddate;
	}



	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}



	public String getNoti_attr_1() {
		return noti_attr_1;
	}



	public void setNoti_attr_1(String noti_attr_1) {
		this.noti_attr_1 = noti_attr_1;
	}



	public String getNoti_attr_2() {
		return noti_attr_2;
	}



	public void setNoti_attr_2(String noti_attr_2) {
		this.noti_attr_2 = noti_attr_2;
	}



	public String getNoti_attr_3() {
		return noti_attr_3;
	}



	public void setNoti_attr_3(String noti_attr_3) {
		this.noti_attr_3 = noti_attr_3;
	}



	public String getNoti_attr_4() {
		return noti_attr_4;
	}



	public void setNoti_attr_4(String noti_attr_4) {
		this.noti_attr_4 = noti_attr_4;
	}



	public String getNoti_user_id() {
		return noti_user_id;
	}



	public void setNoti_user_id(String noti_user_id) {
		this.noti_user_id = noti_user_id;
	}



	public String getNoti_user_id_str() {
		return noti_user_id_str;
	}



	public void setNoti_user_id_str(String noti_user_id_str) {
		this.noti_user_id_str = noti_user_id_str;
	}



	public String getMapping_yn() {
		return mapping_yn;
	}



	public void setMapping_yn(String mapping_yn) {
		this.mapping_yn = mapping_yn;
	}



	public String getNoti_seq_str() {
		return noti_seq_str;
	}



	public void setNoti_seq_str(String noti_seq_str) {
		this.noti_seq_str = noti_seq_str;
	}



	public String getAlarm_seq_str() {
		return alarm_seq_str;
	}



	public void setAlarm_seq_str(String alarm_seq_str) {
		this.alarm_seq_str = alarm_seq_str;
	}



	public String getGen_dt() {
		return gen_dt;
	}



	public void setGen_dt(String gen_dt) {
		this.gen_dt = gen_dt;
	}



	public String getMdfy_by_nm() {
		return mdfy_by_nm;
	}



	public void setMdfy_by_nm(String mdfy_by_nm) {
		this.mdfy_by_nm = mdfy_by_nm;
	}



	public String getNoti_attr() {
		return noti_attr;
	}



	public void setNoti_attr(String noti_attr) {
		this.noti_attr = noti_attr;
	}



	public String getNoti_nm() {
		return noti_nm;
	}



	public void setNoti_nm(String noti_nm) {
		this.noti_nm = noti_nm;
	}



	public Integer getBeep_sec() {
		return beep_sec;
	}



	public void setBeep_sec(Integer beep_sec) {
		this.beep_sec = beep_sec;
	}



	public String getCep_str() {
		return cep_str;
	}



	public Integer getChk_duration() {
		return chk_duration;
	}



	public void setChk_duration(Integer chk_duration) {
		this.chk_duration = chk_duration;
	}



	public void setCep_str(String cep_str) {
		this.cep_str = cep_str;
	}
	
	public void setAlarm_rule_type(String alarm_rule_type) {
		this.alarm_rule_type = alarm_rule_type;
	}
	
	public String getAlarm_rule_type() {
		return alarm_rule_type;
	}




	
}
