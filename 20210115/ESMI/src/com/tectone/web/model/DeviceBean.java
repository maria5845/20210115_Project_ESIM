package com.tectone.web.model;

import java.util.List;

/**
 * @author hbkim
 *
 */
public class DeviceBean extends CommonBean {
	
//	common
	private List<DeviceBean> addressList;
	private String checked;
	
//	t_dvc_info
	private Integer dvc_seq;
	private String dvc_id;
	private String dvc_nm;
	private String dvc_type;
	private String dvc_type_nm;
	private String use_yn;
	
	private Integer machine_seq;
	private String machine_nm;
	private String dvc_desc;
	private String dvc_ip;
	private String mac_addr;
	
	
//	t_dvc_attr
	private Integer dvc_attr_seq;
	private String dvc_attr_cd;
	private String dvc_attr_cd_nm;
	private Integer num_data;
	private String str_data;
	
	
	
//	t_admp_tmplt_info
	private Integer admp_tmplt_seq;
	private String admp_tmplt_nm;
	private String admp_tmplt_dpnm;
	private String clnt_type;
	
	
	private String address_seq_str;
	
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
	public String getDvc_type_nm() {
		return dvc_type_nm;
	}
	public void setDvc_type_nm(String dvc_type_nm) {
		this.dvc_type_nm = dvc_type_nm;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public Integer getDvc_attr_seq() {
		return dvc_attr_seq;
	}
	public void setDvc_attr_seq(Integer dvc_attr_seq) {
		this.dvc_attr_seq = dvc_attr_seq;
	}
	public String getDvc_attr_cd() {
		return dvc_attr_cd;
	}
	public void setDvc_attr_cd(String dvc_attr_cd) {
		this.dvc_attr_cd = dvc_attr_cd;
	}
	public Integer getNum_data() {
		return num_data;
	}
	public void setNum_data(Integer num_data) {
		this.num_data = num_data;
	}
	public String getStr_data() {
		return str_data;
	}
	public void setStr_data(String str_data) {
		this.str_data = str_data;
	}
	public String getAddress_seq_str() {
		return address_seq_str;
	}
	public void setAddress_seq_str(String address_seq_str) {
		this.address_seq_str = address_seq_str;
	}
	public Integer getAdmp_tmplt_seq() {
		return admp_tmplt_seq;
	}
	public void setAdmp_tmplt_seq(Integer admp_tmplt_seq) {
		this.admp_tmplt_seq = admp_tmplt_seq;
	}
	public String getAdmp_tmplt_nm() {
		return admp_tmplt_nm;
	}
	public void setAdmp_tmplt_nm(String admp_tmplt_nm) {
		this.admp_tmplt_nm = admp_tmplt_nm;
	}
	public String getAdmp_tmplt_dpnm() {
		return admp_tmplt_dpnm;
	}
	public void setAdmp_tmplt_dpnm(String admp_tmplt_dpnm) {
		this.admp_tmplt_dpnm = admp_tmplt_dpnm;
	}
	public String getClnt_type() {
		return clnt_type;
	}
	public void setClnt_type(String clnt_type) {
		this.clnt_type = clnt_type;
	}
	public List<DeviceBean> getAddressList() {
		return addressList;
	}
	public void setAddressList(List<DeviceBean> addressList) {
		this.addressList = addressList;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getDvc_attr_cd_nm() {
		return dvc_attr_cd_nm;
	}
	public void setDvc_attr_cd_nm(String dvc_attr_cd_nm) {
		this.dvc_attr_cd_nm = dvc_attr_cd_nm;
	}
	
	public Integer getMachine_seq() {
		return machine_seq;
	}
	public void setMachine_seq(Integer machine_seq) {
		this.machine_seq = machine_seq;
	}
	public String getDvc_desc() {
		return dvc_desc;
	}
	public void setDvc_desc(String dvc_desc) {
		this.dvc_desc = dvc_desc;
	}
	public String getDvc_ip() {
		return dvc_ip;
	}
	public void setDvc_ip(String dvc_ip) {
		this.dvc_ip = dvc_ip;
	}
	public String getMac_addr() {
		return mac_addr;
	}
	public void setMac_addr(String mac_addr) {
		this.mac_addr = mac_addr;
	}
	
	public String getMachine_nm() {
		return machine_nm;
	}
	public void setMachine_nm(String machine_nm) {
		this.machine_nm = machine_nm;
	}
	
	@Override
	public String toString() {
		return "DeviceBean [addressList=" + addressList + ", checked=" + checked + ", dvc_seq=" + dvc_seq + ", dvc_id="
				+ dvc_id + ", dvc_nm=" + dvc_nm + ", dvc_type=" + dvc_type + ", dvc_type_nm=" + dvc_type_nm
				+ ", use_yn=" + use_yn + ", machine_seq=" + machine_seq + ", dvc_desc=" + dvc_desc + ", dvc_ip="
				+ dvc_ip + ", mac_addr=" + mac_addr + ", dvc_attr_seq=" + dvc_attr_seq + ", dvc_attr_cd=" + dvc_attr_cd
				+ ", dvc_attr_cd_nm=" + dvc_attr_cd_nm + ", num_data=" + num_data + ", str_data=" + str_data
				+ ", admp_tmplt_seq=" + admp_tmplt_seq + ", admp_tmplt_nm=" + admp_tmplt_nm + ", admp_tmplt_dpnm="
				+ admp_tmplt_dpnm + ", clnt_type=" + clnt_type + ", address_seq_str=" + address_seq_str + "]";
	}
	
}  
  