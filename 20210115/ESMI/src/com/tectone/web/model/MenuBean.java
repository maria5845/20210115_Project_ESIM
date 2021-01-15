package com.tectone.web.model;

import java.io.Serializable;

public class MenuBean extends CommonBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3450924005068951784L;
	
	private Integer menu_no;
	private Integer p_menu_no;
	private String menu_nm;
	private String menu_addr;
	private Integer disp_ord;
	private Integer menu_depth;
	private String menu_desc;
	private String act_type;
	private String show_yn;
	private String use_yn;
	private String log_record_yn;
	private String gen_by;
	private String gen_dt;
	private String mdfy_by;
	private String mdfy_dt;
	
	private Integer before_disp_ord;
	
	
	
	public Integer getBefore_disp_ord() {
		return before_disp_ord;
	}
	public void setBefore_disp_ord(Integer before_disp_ord) {
		this.before_disp_ord = before_disp_ord;
	}
	public Integer getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(Integer menu_no) {
		this.menu_no = menu_no;
	}
	public Integer getP_menu_no() {
		return p_menu_no;
	}
	public void setP_menu_no(Integer p_menu_no) {
		this.p_menu_no = p_menu_no;
	}
	public String getMenu_nm() {
		return menu_nm;
	}
	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public String getMenu_addr() {
		return menu_addr;
	}
	public void setMenu_addr(String menu_addr) {
		this.menu_addr = menu_addr;
	}
	public Integer getDisp_ord() {
		return disp_ord;
	}
	public void setDisp_ord(Integer disp_ord) {
		this.disp_ord = disp_ord;
	}
	public Integer getMenu_depth() {
		return menu_depth;
	}
	public void setMenu_depth(Integer menu_depth) {
		this.menu_depth = menu_depth;
	}
	public String getMenu_desc() {
		return menu_desc;
	}
	public void setMenu_desc(String menu_desc) {
		this.menu_desc = menu_desc;
	}
	public String getAct_type() {
		return act_type;
	}
	public void setAct_type(String act_type) {
		this.act_type = act_type;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getLog_record_yn() {
		return log_record_yn;
	}
	public void setLog_record_yn(String log_record_yn) {
		this.log_record_yn = log_record_yn;
	}
	public String getGen_by() {
		return gen_by;
	}
	public void setGen_by(String gen_by) {
		this.gen_by = gen_by;
	}
	public String getGen_dt() {
		return gen_dt;
	}
	public void setGen_dt(String gen_dt) {
		this.gen_dt = gen_dt;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getShow_yn() {
		return show_yn;
	}
	public void setShow_yn(String show_yn) {
		this.show_yn = show_yn;
	}
	
	
}
