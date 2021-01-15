package com.tectone.web.model;

import java.util.Date;

public class TreeInfoBean extends CommonBean {

//	Common
	private	Integer	s_tree_seq;
	private	Integer	s_p_tree_seq;
	private	Integer	t_tree_seq;
	private	Integer	t_p_tree_seq;
	
	private String seq_str;
	private String checked;
	
	private	Integer	tree_seq;
	private	Integer	p_tree_seq;
	private	String	tree_nm;
	private	String	tree_desc;
	private	Integer	depth_ord;
	private	Integer	level;
	private	String	use_yn;
	private	String	gen_by;
	private	String	gen_dt;
	private	String	mdfy_by;
	private	String	mdfy_dt;
	private	String	sort;
	private	Integer	depth_cnt;
	private Integer child_cnt;
	private	Integer	seq_array[];
	
	private Integer load_seq;
	private Integer cont_seq;
	private Integer lcsvr_seq;
	private Integer address_seq;
	private Integer var_seq;
	private String address;
	private String var_id;
	private String var_nm;
	private String load_type;
	private String tree_kd_nm;
	private String tree_kd;
	private Integer	seq;
	private String s_type;
	private Integer dsbd_seq;
	
//	t_dvc_info
	private Integer dvc_seq;
	private String dvc_id;
	private String dvc_nm;
	private String dvc_type;
	
	private String sdate;
	private String edate;
	private String act_tm;
	private Integer location_x;
	private Integer location_y;
	private String data_val;
	
	private Integer id;
	private Integer parentId;
	private String name;
	private	Integer	depth1_seq;
	
	
	public Integer getDepth1_seq() {
		return depth1_seq;
	}
	public void setDepth1_seq(Integer depth1_seq) {
		this.depth1_seq = depth1_seq;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getData_val() {
		return data_val;
	}
	public void setData_val(String data_val) {
		this.data_val = data_val;
	}
	public Integer getLocation_x() {
		return location_x;
	}
	public void setLocation_x(Integer location_x) {
		this.location_x = location_x;
	}
	public Integer getLocation_y() {
		return location_y;
	}
	public void setLocation_y(Integer location_y) {
		this.location_y = location_y;
	}
	public String getAct_tm() {
		return act_tm;
	}
	public void setAct_tm(String act_tm) {
		this.act_tm = act_tm;
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
	public Integer getTree_seq() {
		return tree_seq;
	}
	public void setTree_seq(Integer tree_seq) {
		this.tree_seq = tree_seq;
	}
	public Integer getP_tree_seq() {
		return p_tree_seq;
	}
	public void setP_tree_seq(Integer p_tree_seq) {
		this.p_tree_seq = p_tree_seq;
	}
	public String getTree_nm() {
		return tree_nm;
	}
	public void setTree_nm(String tree_nm) {
		this.tree_nm = tree_nm;
	}
	public String getTree_desc() {
		return tree_desc;
	}
	public void setTree_desc(String tree_desc) {
		this.tree_desc = tree_desc;
	}
	public Integer getDepth_ord() {
		return depth_ord;
	}
	public void setDepth_ord(Integer depth_ord) {
		this.depth_ord = depth_ord;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public Integer getDepth_cnt() {
		return depth_cnt;
	}
	public void setDepth_cnt(Integer depth_cnt) {
		this.depth_cnt = depth_cnt;
	}
	public Integer getChild_cnt() {
		return child_cnt;
	}
	public void setChild_cnt(Integer child_cnt) {
		this.child_cnt = child_cnt;
	}
	public Integer[] getSeq_array() {
		return seq_array;
	}
	public void setSeq_array(Integer[] seq_array) {
		this.seq_array = seq_array;
	}
	public Integer getLoad_seq() {
		return load_seq;
	}
	public void setLoad_seq(Integer load_seq) {
		this.load_seq = load_seq;
	}
	public Integer getCont_seq() {
		return cont_seq;
	}
	public void setCont_seq(Integer cont_seq) {
		this.cont_seq = cont_seq;
	}
	public Integer getLcsvr_seq() {
		return lcsvr_seq;
	}
	public void setLcsvr_seq(Integer lcsvr_seq) {
		this.lcsvr_seq = lcsvr_seq;
	}
	public Integer getAddress_seq() {
		return address_seq;
	}
	public void setAddress_seq(Integer address_seq) {
		this.address_seq = address_seq;
	}
	public Integer getVar_seq() {
		return var_seq;
	}
	public void setVar_seq(Integer var_seq) {
		this.var_seq = var_seq;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getLoad_type() {
		return load_type;
	}
	public void setLoad_type(String load_type) {
		this.load_type = load_type;
	}
	public String getTree_kd_nm() {
		return tree_kd_nm;
	}
	public void setTree_kd_nm(String tree_kd_nm) {
		this.tree_kd_nm = tree_kd_nm;
	}
	public String getTree_kd() {
		return tree_kd;
	}
	public void setTree_kd(String tree_kd) {
		this.tree_kd = tree_kd;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getS_type() {
		return s_type;
	}
	public void setS_type(String s_type) {
		this.s_type = s_type;
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
	public String getDvc_type() {
		return dvc_type;
	}
	public void setDvc_type(String dvc_type) {
		this.dvc_type = dvc_type;
	}
	public String getSeq_str() {
		return seq_str;
	}
	public void setSeq_str(String seq_str) {
		this.seq_str = seq_str;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public Integer getS_tree_seq() {
		return s_tree_seq;
	}
	public void setS_tree_seq(Integer s_tree_seq) {
		this.s_tree_seq = s_tree_seq;
	}
	public Integer getS_p_tree_seq() {
		return s_p_tree_seq;
	}
	public void setS_p_tree_seq(Integer s_p_tree_seq) {
		this.s_p_tree_seq = s_p_tree_seq;
	}
	public Integer getT_tree_seq() {
		return t_tree_seq;
	}
	public void setT_tree_seq(Integer t_tree_seq) {
		this.t_tree_seq = t_tree_seq;
	}
	public Integer getT_p_tree_seq() {
		return t_p_tree_seq;
	}
	public void setT_p_tree_seq(Integer t_p_tree_seq) {
		this.t_p_tree_seq = t_p_tree_seq;
	}
	public Integer getDsbd_seq() {
		return dsbd_seq;
	}
	public void setDsbd_seq(Integer dsbd_seq) {
		this.dsbd_seq = dsbd_seq;
	}

}
