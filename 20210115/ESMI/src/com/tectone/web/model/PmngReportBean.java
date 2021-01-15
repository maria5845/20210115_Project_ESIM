package com.tectone.web.model;

public class PmngReportBean extends CommonBean {
	
	private Integer rule_seq;
	private String stime;
	private String etime;
	private String sdate;
	private String edate;
	private String st_md;
	private String et_md;
	private String dvc_id;
	private String var_id;
	private String var_gr;
	private String data_tm;
	private String data_val;
	private String data_str_val;
	private Integer history_seq;
	private String change_reason;
	private String curr_data_val;
	private String change_cnt;
	private String checked;
	private String var_id_str;
	private String dvc_id_str;
	private String last_mdfy_dt;
	private String chart_jsn;
	private String based_var_id;
	private String set_type;
	private String unit;
	private Double green_min;
	private Double green_max;
	private Double yellow_min;
	private Double yellow_max;
	private Double red_min;
	private Double red_max;
	private String folder_nm;
	private Integer sample_size;
	private String lot_id;
	private String varIdQuery;
	
	
	
	
	@Override
	public String toString() {
		return "PmngReportBean [rule_seq=" + rule_seq + ", stime=" + stime + ", etime=" + etime + ", sdate=" + sdate
				+ ", edate=" + edate + ", st_md=" + st_md + ", et_md=" + et_md + ", dvc_id=" + dvc_id + ", var_id="
				+ var_id + ", var_gr=" + var_gr + ", data_tm=" + data_tm + ", data_val=" + data_val + ", data_str_val="
				+ data_str_val + ", history_seq=" + history_seq + ", change_reason=" + change_reason
				+ ", curr_data_val=" + curr_data_val + ", change_cnt=" + change_cnt + ", checked=" + checked
				+ ", var_id_str=" + var_id_str + ", dvc_id_str=" + dvc_id_str + ", last_mdfy_dt=" + last_mdfy_dt
				+ ", chart_jsn=" + chart_jsn + ", based_var_id=" + based_var_id + ", set_type=" + set_type + ", unit="
				+ unit + ", green_min=" + green_min + ", green_max=" + green_max + ", yellow_min=" + yellow_min
				+ ", yellow_max=" + yellow_max + ", red_min=" + red_min + ", red_max=" + red_max + ", folder_nm="
				+ folder_nm + ", sample_size=" + sample_size + ", lot_id=" + lot_id + ", varIdQuery=" + varIdQuery
				+ "]";
	}
	public Integer getRule_seq() {
		return rule_seq;
	}
	public void setRule_seq(Integer rule_seq) {
		this.rule_seq = rule_seq;
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
	
	public String getData_str_val() {
		return data_str_val;
	}
	public void setData_str_val(String data_str_val) {
		this.data_str_val = data_str_val;
	}
	public String getVar_gr() {
		return var_gr;
	}
	public void setVar_gr(String var_gr) {
		this.var_gr = var_gr;
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
	public String getCurr_data_val() {
		return curr_data_val;
	}
	public void setCurr_data_val(String curr_data_val) {
		this.curr_data_val = curr_data_val;
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
	public String getLast_mdfy_dt() {
		return last_mdfy_dt;
	}
	public void setLast_mdfy_dt(String last_mdfy_dt) {
		this.last_mdfy_dt = last_mdfy_dt;
	}
	public String getChange_cnt() {
		return change_cnt;
	}
	public void setChange_cnt(String change_cnt) {
		this.change_cnt = change_cnt;
	}
	public String getSt_md() {
		return st_md;
	}
	public void setSt_md(String st_md) {
		this.st_md = st_md;
	}
	public String getEt_md() {
		return et_md;
	}
	public void setEt_md(String et_md) {
		this.et_md = et_md;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getChart_jsn() {
		return chart_jsn;
	}
	public void setChart_jsn(String chart_jsn) {
		this.chart_jsn = chart_jsn;
	}
	public String getBased_var_id() {
		return based_var_id;
	}
	public void setBased_var_id(String based_var_id) {
		this.based_var_id = based_var_id;
	}
	public String getSet_type() {
		return set_type;
	}
	public void setSet_type(String set_type) {
		this.set_type = set_type;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Double getGreen_min() {
		return green_min;
	}
	public void setGreen_min(Double green_min) {
		this.green_min = green_min;
	}
	public Double getGreen_max() {
		return green_max;
	}
	public void setGreen_max(Double green_max) {
		this.green_max = green_max;
	}
	public Double getYellow_min() {
		return yellow_min;
	}
	public void setYellow_min(Double yellow_min) {
		this.yellow_min = yellow_min;
	}
	public Double getYellow_max() {
		return yellow_max;
	}
	public void setYellow_max(Double yellow_max) {
		this.yellow_max = yellow_max;
	}
	public Double getRed_min() {
		return red_min;
	}
	public void setRed_min(Double red_min) {
		this.red_min = red_min;
	}
	public Double getRed_max() {
		return red_max;
	}
	public void setRed_max(Double red_max) {
		this.red_max = red_max;
	}
	public Integer getHistory_seq() {
		return history_seq;
	}
	public void setHistory_seq(Integer history_seq) {
		this.history_seq = history_seq;
	}
	public String getChange_reason() {
		return change_reason;
	}
	public void setChange_reason(String change_reason) {
		this.change_reason = change_reason;
	}
	public String getFolder_nm() {
		return folder_nm;
	}
	public void setFolder_nm(String folder_nm) {
		this.folder_nm = folder_nm;
	}
	public String getLot_id() {
		return lot_id;
	}
	public void setLot_id(String lot_id) {
		this.lot_id = lot_id;
	}
	public Integer getSample_size() {
		return sample_size;
	}
	public void setSample_size(Integer sample_size) {
		this.sample_size = sample_size;
	}
	public String getVarIdQuery() {
		return varIdQuery;
	}
	public void setVarIdQuery(String varIdQuery) {
		this.varIdQuery = varIdQuery;
	}
	
}
