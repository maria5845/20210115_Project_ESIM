package com.tectone.web.model;

import java.util.List;
import java.util.Map;

public class APIBean {

	// 기준 정보 조회
	private String listType;	// 서비스 리스트 요청 타입(varId : 수집항목 / dvcID : 장치ID)
	private List<String> list;	// 결과 데이터 리스트Array
	
	// PIE DB 데이터 조회 및 입력
	private String varId;	// 수집항목
	private String dvcId;	// 대상 Device
	private String stime;	// 검색기간 시작일
	private String etime;	// 검색기간 종료일
	
	private Integer dataCount;	// 결과 건수
	private List<Map<String, Object>> datas;	// 결과 데이터 리스트Array
//	private List<APIBean> datas;	// 결과 데이터 리스트Array
//	private String datas;	// 결과 데이터 리스트Array
	
	private String result;	// 처리 결과(success / error code : 별도 정의 예정)

	private String time;
	private Object value;
	
	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}

	public String getVarId() {
		return varId;
	}

	public void setVarId(String varId) {
		this.varId = varId;
	}

	public String getDvcId() {
		return dvcId;
	}

	public void setDvcId(String dvcId) {
		this.dvcId = dvcId;
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

	public Integer getDataCount() {
		return dataCount;
	}

	public void setDataCount(Integer dataCount) {
		this.dataCount = dataCount;
	}

//	public List<APIBean> getDatas() {
//		return datas;
//	}
//
//	public void setDatas(List<APIBean> datas) {
//		this.datas = datas;
//	}
	public List<Map<String, Object>> getDatas() {
		return datas;
	}
	
	public void setDatas(List<Map<String, Object>> datas) {
		this.datas = datas;
	}
	
	public String getResult() {
		return result;
	}

//	public String getDatas() {
//		return datas;
//	}
//
//	public void setDatas(String datas) {
//		this.datas = datas;
//	}
	
	

	public void setResult(String result) {
		this.result = result;
	}

//	public Collection<String> getDatas() {
//		return datas;
//	}
//
//	public void setDatas(Collection<String> datas) {
//		this.datas = datas;
//	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "APIBean [listType=" + listType + ", list=" + list + ", varId=" + varId + ", dvcId=" + dvcId + ", stime="
				+ stime + ", etime=" + etime + ", dataCount=" + dataCount + ", datas=" + datas + ", result=" + result
				+ ", time=" + time + ", value=" + value + "]";
	}


	
	
	
}
