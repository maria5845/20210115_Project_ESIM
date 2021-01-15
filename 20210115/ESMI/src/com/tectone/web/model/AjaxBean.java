package com.tectone.web.model;

import java.util.HashMap;
import java.util.Map;

public class AjaxBean {

	boolean result;
	String msg;
	String sysmsg;
	boolean noauth;
	String location;
	Map<String,Object> data;
	
	// Error 발생 시 Alert 띄울지, Notification 띄울지 
	String errType; // [alert / notification]
	String errLv;	// [info / error]
	
	public String getErrType() {
		return errType;
	}
	public void setErrType(String errType) {
		this.errType = errType;
	}
	public String getErrLv() {
		return errLv;
	}
	public void setErrLv(String errLv) {
		this.errLv = errLv;
	}
	public boolean isResult() {
		return result;
	}
	public String getMsg() {
		return msg;
	}
	public boolean isNoauth() {
		return noauth;
	}
	public String getLocation() {
		return location;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setNoauth(boolean noauth) {
		this.noauth = noauth;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Object getData() {
		return data;
	}
	public Object getData(String key) {
		if(data == null) return null;
		return data.get(key);
	}
	public void setData(String key, Object value) {
		if(this.data == null)
			this.data = new HashMap<String,Object>();
		
		this.data.put(key, value);
	}
	public void setDataAll(Map<String, Object> map) {
		if(this.data == null)
			this.data = new HashMap<String,Object>();
		
		this.data.putAll(map);
	}
	public String getSysmsg() {
		return sysmsg;
	}
	public void setSysmsg(String sysmsg) {
		this.sysmsg = sysmsg;
	}
}
