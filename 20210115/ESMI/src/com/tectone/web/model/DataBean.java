package com.tectone.web.model;

public class DataBean extends CommonBean {

	private Integer stats_raw_seq;
	private String dvc_id;
	private String dvc_nm;
	private String var_id;
	private String var_nm;
	private String data_val;
	private String data_tm;
	
	private String start_t_md;
	private String end_t_md;
	
	private String startdate;
	private String enddate;
	
	public Integer getStats_raw_seq() {
		return stats_raw_seq;
	}
	public void setStats_raw_seq(Integer stats_raw_seq) {
		this.stats_raw_seq = stats_raw_seq;
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
	public String getData_val() {
		return data_val;
	}
	public void setData_val(String data_val) {
		this.data_val = data_val;
	}
	public String getData_tm() {
		return data_tm;
	}
	public void setData_tm(String data_tm) {
		this.data_tm = data_tm;
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
	public String getStart_t_md() {
		return start_t_md;
	}
	public void setStart_t_md(String start_t_md) {
		this.start_t_md = start_t_md;
	}
	public String getEnd_t_md() {
		return end_t_md;
	}
	public void setEnd_t_md(String end_t_md) {
		this.end_t_md = end_t_md;
	}
	
}
