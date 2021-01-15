package com.tectone.web.model;

import java.util.List;
import java.util.Map;

public class PimReportBean extends CommonBean {
	
	private String stime;
	private String etime;
	private String sdate;
	private String edate;
	private String dvc_id;
	private String var_id;
	private String data_tm;
	private String data_val;
	private String var_id_str;
	private String dvc_id_str;
	private String day_time_str;
	private String night_time_str;
	
	private String corp_nm;
	private String sheet_nm;
	private String excel_type;
	private String selected_date;
	
	private String dvc_gr_type;
	
	private List<Map<String, Object>> lami_trend_arr;
	private List<Map<String, Object>> lami_fail_arr;
	private List<Map<String, Object>> lami_error_arr;
	
	private List<Map<String, Object>> stack_trend_arr;
	private List<Map<String, Object>> stack_fail_arr;
	private List<Map<String, Object>> stack_error_arr;
	
	private List<Map<String, Object>> trend_arr;
	private List<Map<String, Object>> fail_arr;
	private List<Map<String, Object>> error_arr;
	
	
//	repo_seq int4 NOT NULL,
//	repo_type varchar(50) NOT NULL,
//	file_nm varchar(150) not null,
//	sdate varchar(17) not null,
//	edate varchar(17) not null,
//	gen_by varchar(30) NOT NULL,
//	gen_dt timestamp NOT NULL DEFAULT now(),
	private Integer repo_seq;
	private String repo_type;
	private String file_nm;
	
	
	public String getCorp_nm() {
		return corp_nm;
	}
	public void setCorp_nm(String corp_nm) {
		this.corp_nm = corp_nm;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getDvc_id() {
		return dvc_id;
	}
	public void setDvc_id(String dvc_id) {
		this.dvc_id = dvc_id;
	}
	public String getVar_id() {
		return var_id;
	}
	public void setVar_id(String var_id) {
		this.var_id = var_id;
	}
	public String getData_tm() {
		return data_tm;
	}
	public void setData_tm(String data_tm) {
		this.data_tm = data_tm;
	}
	public String getData_val() {
		return data_val;
	}
	public void setData_val(String data_val) {
		this.data_val = data_val;
	}
	public String getVar_id_str() {
		return var_id_str;
	}
	public void setVar_id_str(String var_id_str) {
		this.var_id_str = var_id_str;
	}
	public String getDvc_id_str() {
		return dvc_id_str;
	}
	public void setDvc_id_str(String dvc_id_str) {
		this.dvc_id_str = dvc_id_str;
	}
	public String getDay_time_str() {
		return day_time_str;
	}
	public void setDay_time_str(String day_time_str) {
		this.day_time_str = day_time_str;
	}
	public String getNight_time_str() {
		return night_time_str;
	}
	public void setNight_time_str(String night_time_str) {
		this.night_time_str = night_time_str;
	}
	public String getSheet_nm() {
		return sheet_nm;
	}
	public void setSheet_nm(String sheet_nm) {
		this.sheet_nm = sheet_nm;
	}
	public String getSelected_date() {
		return selected_date;
	}
	public void setSelected_date(String selected_date) {
		this.selected_date = selected_date;
	}
	public String getRepo_type() {
		return repo_type;
	}
	public void setRepo_type(String repo_type) {
		this.repo_type = repo_type;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public String getExcel_type() {
		return excel_type;
	}
	public void setExcel_type(String excel_type) {
		this.excel_type = excel_type;
	}
	public Integer getRepo_seq() {
		return repo_seq;
	}
	public void setRepo_seq(Integer repo_seq) {
		this.repo_seq = repo_seq;
	}
	public List<Map<String, Object>> getLami_trend_arr() {
		return lami_trend_arr;
	}
	public void setLami_trend_arr(List<Map<String, Object>> lami_trend_arr) {
		this.lami_trend_arr = lami_trend_arr;
	}
	public List<Map<String, Object>> getLami_fail_arr() {
		return lami_fail_arr;
	}
	public void setLami_fail_arr(List<Map<String, Object>> lami_fail_arr) {
		this.lami_fail_arr = lami_fail_arr;
	}
	public List<Map<String, Object>> getLami_error_arr() {
		return lami_error_arr;
	}
	public void setLami_error_arr(List<Map<String, Object>> lami_error_arr) {
		this.lami_error_arr = lami_error_arr;
	}
	public List<Map<String, Object>> getStack_trend_arr() {
		return stack_trend_arr;
	}
	public void setStack_trend_arr(List<Map<String, Object>> stack_trend_arr) {
		this.stack_trend_arr = stack_trend_arr;
	}
	public List<Map<String, Object>> getStack_fail_arr() {
		return stack_fail_arr;
	}
	public void setStack_fail_arr(List<Map<String, Object>> stack_fail_arr) {
		this.stack_fail_arr = stack_fail_arr;
	}
	public List<Map<String, Object>> getStack_error_arr() {
		return stack_error_arr;
	}
	public void setStack_error_arr(List<Map<String, Object>> stack_error_arr) {
		this.stack_error_arr = stack_error_arr;
	}
	public String getDvc_gr_type() {
		return dvc_gr_type;
	}
	public void setDvc_gr_type(String dvc_gr_type) {
		this.dvc_gr_type = dvc_gr_type;
	}
	public List<Map<String, Object>> getTrend_arr() {
		return trend_arr;
	}
	public void setTrend_arr(List<Map<String, Object>> trend_arr) {
		this.trend_arr = trend_arr;
	}
	public List<Map<String, Object>> getFail_arr() {
		return fail_arr;
	}
	public void setFail_arr(List<Map<String, Object>> fail_arr) {
		this.fail_arr = fail_arr;
	}
	public List<Map<String, Object>> getError_arr() {
		return error_arr;
	}
	public void setError_arr(List<Map<String, Object>> error_arr) {
		this.error_arr = error_arr;
	}
}
