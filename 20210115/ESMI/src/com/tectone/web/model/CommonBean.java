package com.tectone.web.model;

import java.util.List;
import java.util.Map;

/**
 * @author u.jyung
 *
 */
public class CommonBean {
	private Integer rn;
	
	private Integer page;
	private Integer cntPerPage;
	private Integer startRowNum;
	private Integer endRowNum;

	private Integer startPage;
	private Integer endPage;
	private Integer nowPage;
	private Integer count;
	private Integer cnt;
	private Integer rowNumber;
	private Integer pageSize;
	
	private String excelFileName;
	private String columnList;
	private String titleList;
	
	private String user_id;
	private String login_user_id;
	
	private String action_type;
	
	private String callbackFn;
	
	private String edit_yn;
	
	private String use_yn;
	private String gen_by;
	private String gen_dt;
	private String mdfy_by;
	private String mdfy_dt;
	
	private List<Map<String, Object>> bean_arr;
	
	
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
	public String getTitleList() {
		return titleList;
	}
	public void setTitleList(String titleList) {
		this.titleList = titleList;
	}
	public String getColumnList() {
		return columnList;
	}
	public void setColumnList(String columnList) {
		this.columnList = columnList;
	}
	public String getExcelFileName() {
		return excelFileName;
	}
	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getRn() {
		return rn;
	}
	public void setRn(Integer rn) {
		this.rn = rn;
	}
	public Integer getPage() {
		if(page == null){
			page = 1;
		}
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(Integer cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public Integer getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(Integer startRowNum) {
		this.startRowNum = startRowNum;
	}
	public Integer getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(Integer endRowNum) {
		this.endRowNum = endRowNum;
	}
	public Integer getStartPage() {
		return startPage;
	}
	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}
	public Integer getEndPage() {
		return endPage;
	}
	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}
	public Integer getNowPage() {
		return nowPage;
	}
	public void setNowPage(Integer nowPage) {
		this.nowPage = nowPage;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	public Integer getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(Integer rowNumber) {
		this.rowNumber = rowNumber;
	}
	public String getCallbackFn() {
		return callbackFn;
	}
	public void setCallbackFn(String callbackFn) {
		this.callbackFn = callbackFn;
	}
	public String getAction_type() {
		return action_type;
	}
	public void setAction_type(String action_type) {
		this.action_type = action_type;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public List<Map<String, Object>> getBean_arr() {
		return bean_arr;
	}
	public void setBean_arr(List<Map<String, Object>> bean_arr) {
		this.bean_arr = bean_arr;
	}
	public String getLogin_user_id() {
		return login_user_id;
	}
	public void setLogin_user_id(String login_user_id) {
		this.login_user_id = login_user_id;
	}
	public String getEdit_yn() {
		return edit_yn;
	}
	public void setEdit_yn(String edit_yn) {
		this.edit_yn = edit_yn;
	}
	
}
