package com.tectone.web.model;

import java.util.List;
import java.util.Map;

public class UserInfoBean extends CommonBean  implements java.io.Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8363092018520037900L;
	
	
	private String user_id;
	private String user_nm;
	private String user_pwd;
	private String user_type;
	private String empno;
	private String dept_nm;
	private String user_email;
	private String mobile_tel_no;
	private String user_desc;
	private String pwd_mdfy_dt;
	private String use_yn;
	private String gen_by;
	private String gen_dt;
	private String mdfy_by;
	private String mdfy_dt;
	private String user_position;
	private String user_label_str;
	
	private String auth_gr_nm;
	private Integer auth_gr_no;
	private String auth_gr_desc;
	private String menu_addr;
	private String home_yn;
	private Integer home_menu_no;
	
	private String tab_info;
	private Integer seq;
	private String tree_desc;
	private Integer level;
	private Integer child_cnt;
	private Integer load_seq;
	
	private String tree_seq;
	
	private List<Map<String, Object>> authgr_arr;
	private List<Map<String, Object>> tree_arr;
	private List<Map<String, Object>> pielist_arr;
	
	
	public List<Map<String, Object>> getPielist_arr() {
		return pielist_arr;
	}
	public void setPielist_arr(List<Map<String, Object>> pielist_arr) {
		this.pielist_arr = pielist_arr;
	}
	public String getAuth_gr_desc() {
		return auth_gr_desc;
	}
	public void setAuth_gr_desc(String auth_gr_desc) {
		this.auth_gr_desc = auth_gr_desc;
	}
	public String getHome_yn() {
		return home_yn;
	}
	public void setHome_yn(String home_yn) {
		this.home_yn = home_yn;
	}
	public Integer getHome_menu_no() {
		return home_menu_no;
	}
	public void setHome_menu_no(Integer home_menu_no) {
		this.home_menu_no = home_menu_no;
	}
	public String getUser_label_str() {
		return user_label_str;
	}
	public void setUser_label_str(String user_label_str) {
		this.user_label_str = user_label_str;
	}
	public String getTree_seq() {
		return tree_seq;
	}
	public void setTree_seq(String tree_seq) {
		this.tree_seq = tree_seq;
	}
	public String getTree_desc() {
		return tree_desc;
	}
	public void setTree_desc(String tree_desc) {
		this.tree_desc = tree_desc;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getChild_cnt() {
		return child_cnt;
	}
	public void setChild_cnt(Integer child_cnt) {
		this.child_cnt = child_cnt;
	}
	public Integer getLoad_seq() {
		return load_seq;
	}
	public void setLoad_seq(Integer load_seq) {
		this.load_seq = load_seq;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getUser_position() {
		return user_position;
	}
	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}
	public Integer getAuth_gr_no() {
		return auth_gr_no;
	}
	public void setAuth_gr_no(Integer auth_gr_no) {
		this.auth_gr_no = auth_gr_no;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getAuth_gr_nm() {
		return auth_gr_nm;
	}
	public void setAuth_gr_nm(String auth_gr_nm) {
		this.auth_gr_nm = auth_gr_nm;
	}
	public String getMenu_addr() {
		return menu_addr;
	}
	public void setMenu_addr(String menu_addr) {
		this.menu_addr = menu_addr;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getMobile_tel_no() {
		return mobile_tel_no;
	}
	public void setMobile_tel_no(String mobile_tel_no) {
		this.mobile_tel_no = mobile_tel_no;
	}
	public String getUser_desc() {
		return user_desc;
	}
	public void setUser_desc(String user_desc) {
		this.user_desc = user_desc;
	}
	public String getPwd_mdfy_dt() {
		return pwd_mdfy_dt;
	}
	public void setPwd_mdfy_dt(String pwd_mdfy_dt) {
		this.pwd_mdfy_dt = pwd_mdfy_dt;
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
	public String getTab_info() {
		return tab_info;
	}
	public void setTab_info(String tab_info) {
		this.tab_info = tab_info;
	}
	public List<Map<String, Object>> getAuthgr_arr() {
		return authgr_arr;
	}
	public void setAuthgr_arr(List<Map<String, Object>> authgr_arr) {
		this.authgr_arr = authgr_arr;
	}
	public List<Map<String, Object>> getTree_arr() {
		return tree_arr;
	}
	public void setTree_arr(List<Map<String, Object>> tree_arr) {
		this.tree_arr = tree_arr;
	}
}
