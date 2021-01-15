package com.tectone.web.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ErrorResolutionBean {
	private int seq;
	private String rsltn_text;
	private String rsltn_file;
	private String rsltn_file_path;
	private int rsltn_file_apply;
	private Map<String, Object> search_type;	
	private List<FileBean> fileBean;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRsltn_text() {
		return rsltn_text;
	}
	public void setRsltn_text(String rsltn_text) {
		this.rsltn_text = rsltn_text;
	}
	public String getRsltn_file() {
		return rsltn_file;
	}
	public void setRsltn_file(String rsltn_file) {
		this.rsltn_file = rsltn_file;
	}
	public String getRsltn_file_path() {
		return rsltn_file_path;
	}
	public void setRsltn_file_path(String rsltn_file_path) {
		this.rsltn_file_path = rsltn_file_path;
	}
	public int getRsltn_file_apply() {
		return rsltn_file_apply;
	}
	public void setRsltn_file_apply(int rsltn_file_apply) {
		this.rsltn_file_apply = rsltn_file_apply;
	}
	public Map<String, Object> getSearch_type() {
		return search_type;
	}
	public void setSearch_type(Map<String, Object> search_type) {
		this.search_type = search_type;
	}
	public List<FileBean> getFileBean() {
		return fileBean;
	}
	public void setFileBean(List<FileBean> fileBean) {
		this.fileBean = fileBean;
	}
	
	
}
