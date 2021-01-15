package com.tectone.web.common.domain;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

import com.tectone.web.business.setting.lang.LangDAO;
import com.tectone.web.model.LangBean;


@Component
public class MessageContainer {
	
	protected Logger logger = LogManager.getLogger(getClass());
	
	@Inject
	private LangDAO dao;
	
	@Inject
	private ServletContext rootAbsolutePath;

	/**
	 * [초기 실행] 다국어 목록을 messages/message_xx.properties 로 파일 생성
	 * @throws Exception
	 */
	@PostConstruct
	public void init() throws Exception {
		
		String pathStr = rootAbsolutePath.getRealPath("/");
		GenerateMessageProps(pathStr, dao);
	}
	
	/**
	 * 다국어 목록을 messages/message_xx.properties 로 파일 생성 
	 * @throws Exception
	 */
	public void GenerateMessageProps(String pathStr, LangDAO dao) throws Exception {
		
		// 다국어 List
		List<LangBean> langList = dao.selectList("langSqlMap.getLangProps");

		//메시지 properties Map 생성
		Map<String, Properties> propMap = new HashMap<>();
		
		// 다국어 properties를 map에 저장
		for(LangBean lBean : langList) {
			
			Properties prop = propMap.get(lBean.getLang_cd());
			if(prop == null) {
				prop = new Properties();
			}
			
			prop.setProperty(lBean.getLang_msg_cd(), lBean.getLang_msg_val());
			
			propMap.put(lBean.getLang_cd(), prop);
		}
		
		// 다국어 properties 생성
		for( String key : propMap.keySet() ){
			propMap.get(key).store(new FileOutputStream(new File(pathStr + "WEB-INF/messages/message_" + key.toLowerCase() + ".properties")), key);
		}
	}
}