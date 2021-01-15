package com.tectone.web.api;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.APIBean;

/**
 * API 인터페이스
 */
@Service
public class APIService extends AbstractService {

	@Inject
	private APIDao dao;
	
	
//	List<Map<String, Object>> lists = new ArrayList<>();
	
	/**
	 * service list 를 리턴
	 * @param bean
	 * @return
	 */
	public List<String> getServiceList(APIBean bean) {
		List<String> list = new ArrayList<String>();
		switch (bean.getListType()) {
		case "varId":
			list = dao.selectList("apiSqlMap.getVarIdList");
			break;
		case "dvcId":
			list = dao.selectList("apiSqlMap.getDvcIdList");
			break;
		}
		return list;
	}
	
	/**
	 * PIE DB 데이터 조회
	 * @param bean
	 * @return
	 */
	public List<Map<String, Object>> selectData(APIBean bean) {
		// yyyy-mm-dd hh:mi:ss 형식의 시간을 millisecond 형식으로 변경
		bean.setStime(bean.getStime().replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "")+"000");
		bean.setEtime(bean.getEtime().replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "")+"999");
		
		return dao.selectList("apiSqlMap.selectData", bean);
	}

	/**
	 * PIE DB 데이터 저장
	 * @param bean
	 */
	public void insertData(APIBean bean) {
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		try {
			JSONArray jsonArr = new JSONArray(bean.getDatas());
			for (int i = 0; i < jsonArr.length(); i++){
				JSONObject jsonObj = jsonArr.getJSONObject(i);
				System.out.println(jsonObj);
				l.add(getMapFromJsonObject(jsonObj));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}

		saveRawData(bean, l); // Raw Data 저장
		saveRecentData(bean, l); // Recent Data 저장
	}

	/**
	 * PIE Data Save - raw data
	 * @param bean
	 * @param list 
	 */
	private void saveRawData(APIBean bean, List<Map<String, Object>> list) {
		// Raw Data 저장
		ArrayList <Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		
		for(Map<String, Object> m : list) {
			APIBean beans = new APIBean();
			
			Map<String, Object> map = new HashMap<>();
			map.put("queryId", "apiSqlMap.insertRawData");
			map.put("CUD", "insert");
			
			beans.setDvcId(bean.getDvcId());
			beans.setVarId(bean.getVarId());
			
			String tm	= String.valueOf(m.get("time"));
			beans.setTime(tm.replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "")+"000");
			
			String val	= String.valueOf(m.get("value"));
			//메시지 데이터가 문자인지 확인
			if(val != null && val.matches("\\.S\\.")) {
				beans.setValue(val);
			}else {
				beans.setValue(Double.parseDouble(val));
			}
			
			map.put("param", beans);
			
			lists.add(map);
			
			
		}
		
		dao.multiBatch(lists);
		
	}

	/**
	 * PIE Data Save - recent data
	 * @param bean
	 * @param list 
	 */
	private void saveRecentData(APIBean bean, List<Map<String, Object>> list) {
//		List<Map<String, Object>> list = bean.getDatas();
		
		if( list.size() > 0 ) {
			//descending order
			Collections.sort(list, new Comparator<Map<String, Object >>() {
				@Override
				public int compare(Map<String, Object> first, Map<String, Object> second) {
					String secondTm = String.valueOf(second.get("time")).replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "");
					String firstTm = String.valueOf(first.get("time")).replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "");
					return secondTm.compareTo(firstTm);
				}
			});
			
			// 체크해서 insert 혹은 update
			bean.setTime(String.valueOf(list.get(0).get("time")));
			String val	= String.valueOf(list.get(0).get("value"));
			//메시지 데이터가 문자인지 확인
			if(val != null && val.matches("\\.S\\.")) {
				bean.setValue(val);
			}else {
				bean.setValue(Double.parseDouble(val));
			}
			Map<String, Object> recent = dao.selectOne("apiSqlMap.getRecent", bean);
			
			// Recent가 없을 경우 Insert
			if(recent == null) {
				dao.insert("apiSqlMap.insertRecentData", bean);
				// Recent가 있을 경우 시간 체크 후 Update
			}else {
				if("t".equals(String.valueOf(recent.get("save_yn")))) {
					dao.update("apiSqlMap.UpdateRecentData", bean);
				}
			}
		}
	}
	
    /**
     * JsonObject를 Map<String, String>으로 변환한다.
     *
     * @param jsonObj JSONObject.
     * @return Map<String, Object>.
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> getMapFromJsonObject( JSONObject jsonObj )
    {
        Map<String, Object> map = null;
        
        try {
            
            map = new ObjectMapper().readValue(jsonObj.toString(), Map.class) ;
            
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        return map;
    }

}