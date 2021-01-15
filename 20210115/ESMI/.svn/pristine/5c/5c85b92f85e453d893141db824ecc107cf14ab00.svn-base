package com.tectone.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.simple.JSONValue;

public class ProcessWatcherUtil {


	/**
	 * 
	 * @param m
	 * 		call_type : (필수)ProcessWatcher 호출 유형 (상태조회, 서비스 시작, 서비스 종료, PC 종료, PC 재부팅)
	 * 		pieId : 호출 대상 PIE_ID (해당 ID에 해당하는 IP에 ProcessWatcher를 호출)
	 * @return
	 * @throws JSONException
	 */
	public static org.json.simple.JSONObject callProcessWatcher(Map<String, Object> m) throws JSONException {
		org.json.simple.JSONObject object = new org.json.simple.JSONObject();
		
		return object;
	}
	
	/**
	 * 
	 * @param url
	 * @return
	 * @throws JSONException
	 */
	public static org.json.simple.JSONObject getSimpleJSONFromUrl(String url) throws JSONException {
		InputStream is = null;
		org.json.simple.JSONObject jObj = new org.json.simple.JSONObject();
		String json = "";
		
		try {
			DefaultHttpClient httpClient = new DefaultHttpClient();
			
			HttpGet httpGet = new HttpGet(url);
			
			HttpResponse httpResponse = httpClient.execute(httpGet);
			HttpEntity httpEntity = httpResponse.getEntity();
			is = httpEntity.getContent();
		
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"), 8);
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");
			}
			is.close();
			
			json = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			org.json.simple.JSONArray ja=(org.json.simple.JSONArray) JSONValue.parse(json);
			
			if(ja.size()==0){
				jObj.put("msg", "값이 없습니다.");
				return jObj;
			}
			
			jObj=(org.json.simple.JSONObject) ja.get(0);
			
		} catch (ClassCastException cce) {
			//error 메시지가 뜰땐 배열이 아니라 json이라 캐스팅에러 발생
			jObj.put("msg", "값이 없습니다.");
			return jObj;
		}
		
		

		return jObj;
	}
	

}
