package com.tectone.web.business.custom.pmng;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.tectone.util.CsvUtil;
import com.tectone.util.DateUtil;
import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.CmcdBean;
import com.tectone.web.model.CommonBean;
import com.tectone.web.model.PmngReportBean;

@Service
public class PmngService extends AbstractService {

	@Inject
	private PmngDao dao;
	
	@Inject
	private Properties config;
//	config.getProperty("temp.file.uplaod.path")
//	cmi.vision.path
	
	public ArrayList<Object> searchNotchVisionImg(PmngReportBean bean, HttpServletRequest request) {
//		D:\SAVEIMAGE\NG\날짜\카메라번호\Time_index.jpg 로 저장
//		D:\SAVEIMAGE\NG\20200422\CAM0 
//		현재 해당 폴더 아래 모든 이미지 가져옴
		
		// TODO :캠 번호 조회 필요
		String rootPath = config.getProperty("nnd.notching.vision.path");
		
		File path = new File(rootPath + bean.getSdate()+"/CAM0");
		File[] fileList = path.listFiles();
		ArrayList<Object> temp = new ArrayList<>();
		
		String reqUrl = "http://" + request.getServerName() + ":" + request.getServerPort();
		
//		153600_57244.png 파일 이름
//		hhmmss_*****.png 구조라 생각하고 조회
		
		// TODO : t_cm_cd에서 시간 +- 기준 값 가져오기
//		sdate=20200422&stime=153600
		
		String stm = null; //시작시간
		String etm = null; //종료시간
		
		CmcdBean cmcd = getCmcdOne("VISION_SET", "TIME", "Y");
		int intervalTime = Integer.parseInt(cmcd.getCd_val()); //
		String time = cmcd.getCd_attr_1(); //MINUTE, HOUR

		
		String formatStr = "HHmmss";
		
		//addYMDtoDayTime(String sDate, String sTime, int year, int month, int day, int hour, int minute, String formatStr)
		if("MINUTE".equals(time)) {
			stm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
					, 0, 0, 0, 0, -(intervalTime), formatStr);
			etm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
					, 0, 0, 0, 0, intervalTime, formatStr);
		}else if("HOUR".equals(time)) {
			stm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
					, 0, 0, 0, -(intervalTime), 0, formatStr);
			etm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
					, 0, 0, 0, intervalTime, 0, formatStr);
		}
		
//		System.out.println("기준시간: "+bean.getStime());
//		
//		System.out.println("시작시간: "+stm);
//		System.out.println("종료시간: "+etm);
		
		int stime = Integer.parseInt(stm);
		int etime = Integer.parseInt(etm);
		
//		System.out.println("시작시간(숫자): "+stm);
//		System.out.println("종료시간(숫자): "+etm);
		
		if(fileList.length > 0){
		    for(int i=0; i < fileList.length; i++){
		    	HashMap<String, String> hmap = new HashMap<String, String>();
		    	
		    	File file = fileList[i]; 
//		  		System.out.println(fileList[i]);
		  		int nm = Integer.parseInt(file.getName().substring(0, 6)); //153607_57296.jpg
		  		
//		  		System.out.println(nm);
		  		
		  		// TODO : 파일 이름 조건 부 조회 필요
		  		if(stime <= nm && nm <= etime) {
//		  			System.out.println("불러올 이미지 이름: "+nm);
		  			String convertDate = null;
		  			convertDate = DateUtil.convertDate(bean.getSdate(), file.getName().substring(0, 6), "yyyy-MM-dd HH:mm:ss");
		  			hmap.put("img_time", convertDate);
		  			hmap.put("img_path", reqUrl + fileList[i].toString().substring(2));
		  			
		  			temp.add(hmap);
		  		}
		  		
		    }
		}
		
//		System.out.println(temp);
        
		return temp;
	}
	
	
	public ArrayList<Object> searchCMIVisionImg(PmngReportBean bean, HttpServletRequest request) {

//		D:\DATABASE\IMAGE\20200714\18\UP\NG
//		D:\DATABASE\IMAGE\20200714\18\DN\NG
//		D:\DATABASE\IMAGE\년월일\hour시간\비전 위치\NG\0000(분초)_2461813(검사 카운트).jpg
//		현재 해당 폴더 아래 모든 이미지 가져옴
		ArrayList<Object> temp = new ArrayList<>();
		
		try {
			//이미지 position 조회
			//		POSITION
			//		0 = 상부 = UP
			//		1 = 하부 = DN
			HashMap<String, Integer> camhamp = dao.selectOne("pmngSqlMap.getVisionPositionNum", bean);
//			System.out.println("camhamp : "+camhamp);
			Integer camNum = camhamp.get(bean.getFolder_nm().toString().toLowerCase());
			
			
//			System.out.println("camNum : "+camNum);
			String position = "UP";
			if(camNum.equals(0)) {position = "DN";}
			
			String time = bean.getStime();
			String hour = time.substring(0, 2);
	//		String minSecond = time.substring(2);
			
			String rootPath = config.getProperty("cmi.lami.vision.path");
			
			File path = new File(rootPath+bean.getSdate() +"/"+ hour +"/"+ position + "/NG");
//			System.out.println("path: "+path);
			File[] fileList = path.listFiles();
//			System.out.println("fileList: "+fileList);
			
			String reqUrl = "http://" + request.getServerName() + ":" + request.getServerPort();
//			System.out.println("reqUrl: "+reqUrl);
			
			String stm = null; //시작시간
			String etm = null; //종료시간
			
			//이미지 조회 범위 
			CmcdBean cmcd = getCmcdOne("VISION_SET", "TIME", "Y");
			int intervalTime = Integer.parseInt(cmcd.getCd_val()); //
			String cmcdTime = cmcd.getCd_attr_1(); //MINUTE, HOUR
			
			String formatStr = "HHmmss";
			
			//addYMDtoDayTime(String sDate, String sTime, int year, int month, int day, int hour, int minute, String formatStr)
			if("MINUTE".equals(cmcdTime)) {
				stm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
						, 0, 0, 0, 0, -(intervalTime), formatStr);
				etm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
						, 0, 0, 0, 0, intervalTime, formatStr);
			}else if("HOUR".equals(cmcdTime)) {
				stm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
						, 0, 0, 0, -(intervalTime), 0, formatStr);
				etm = DateUtil.addYMDtoDayTime(bean.getSdate(), bean.getStime()
						, 0, 0, 0, intervalTime, 0, formatStr);
			}
			
			int stime = Integer.parseInt(stm);
			int etime = Integer.parseInt(etm);
			
	//		System.out.println("시작시간(숫자): "+stm);
	//		System.out.println("종료시간(숫자): "+etm);
			if(fileList.length != 0){
				for(int i=0; i < fileList.length; i++){
					HashMap<String, String> hmap = new HashMap<String, String>();
					
					File file = fileList[i]; 
					int nm = Integer.parseInt(hour + file.getName().substring(0, 4)); //153607_57296.jpg
					
//					System.out.println(stime +" / "+ nm +" / "+etime);
					
					if(stime <= nm && nm <= etime) {
	//		  			System.out.println("불러올 이미지 이름: "+nm);
						String convertDate = null;
						convertDate = DateUtil.convertDate(bean.getSdate(), hour + file.getName().substring(0, 4), "yyyy-MM-dd HH:mm:ss");
						hmap.put("img_time", ("UP".equals(position)? "U": "L") + " | " + convertDate);
//						hmap.put("img_path", reqUrl + fileList[i].toString().substring(2));
						
//						System.out.println("fileList[i]: "+fileList[i]);//\\192.168.33.23\image\20200621\15\DN\NG\0053_26644925.jpg
						
						//앞의 ip 정보를 제거
						String tomcatPath = fileList[i].toString();
						Integer tpi = tomcatPath.indexOf("\\", 3);
						tomcatPath = tomcatPath.substring(tpi); //\image\20200621\15\DN\NG\0053_26644925.jpg
						
						hmap.put("img_path", reqUrl + tomcatPath);
						 
//						System.out.println("img_path: "+reqUrl + tomcatPath);
						
						temp.add(hmap);
					}
					
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return temp;
	}
	
	public String getVarStr(PmngReportBean bean, List<String> arrVarId) {
		String varIdStr = "";
		if(arrVarId != null && arrVarId.size() > 0) {
			for(int i=0; i<arrVarId.size(); i++) {
				varIdStr += ",'" + arrVarId.get(i) + "'";
			}
		}
		
		return varIdStr;
	}

	/**
	 * 현재 사용되는 장치 아이디를 조회
	 * @return
	 */
	public String getPmngDvcid() {
		//	dvc_gr_type = 'PMNG'
		//	and use_yn = 'Y'
		//	and disp_ord = 1
		String dvc_id = dao.selectOne("pmngSqlMap.getPmngDvcid");
		return dvc_id;
	}

	public void varRuleAction(PmngReportBean bean, String action_type) {
		switch (action_type) {
		case "add":
			insertVarRule(bean);
			break;
		case "modify":
			updateVarRule(bean);
			break;
		case "delete":
			deleteVarRule(bean);
			break;
		}
	}

	private void insertVarRule(PmngReportBean bean) {
		dao.update("pmngSqlMap.insertVarRuleInfo", bean);
	}

	private void updateVarRule(PmngReportBean bean) {
		dao.update("pmngSqlMap.updateVarRuleInfo", bean);
	}
	
	private void deleteVarRule(PmngReportBean bean) {
		dao.delete("pmngSqlMap.deleteVarRuleInfo", bean);
	}

	public ArrayList<Object> GetVisionData(PmngReportBean bean) throws Exception {
//		logger.debug("VisionProcDataGenJob called");
		ArrayList<Object> result_arr = new ArrayList<>();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
//		항목을 가져옴
		Map<String, Object> param = new HashMap<String,Object>();
		param.put("cat_cd", "PARAM_VAR_CD");
		param.put("cd", "LAMI");
		HashMap<String, Object> var_id = dao.selectOne("pmngSqlMap.getVisionVarId", param);
	      
		//조회 할 시작시간 종료시간의 데이터를 가져온다.
		param.put("stime", bean.getStime());
		param.put("etime", bean.getEtime());
		
		param.put("st_md", bean.getStime().substring(4,8));
		param.put("et_md", bean.getEtime().substring(4,8));
	      
		String[] splitString = var_id.get("cd_desc").toString().split("\\|");
		
		//lsl usl 매핑 map
		Map<String, String> lsluslMap = new HashMap<>();
		
		//각 검사 항목별 Ng 개수를 더한 값
		Integer allNgCount = dao.selectOne("pmngSqlMap.getAllNgCnt", param);
		
//	       항목별 데이터를 생성함.
		for(String currentVarId : splitString) {
			 
			param.put("result", currentVarId + "_result");
//	        1. 항목별 NG Count
			Integer ngCount = dao.selectOne("pmngSqlMap.getVarIdNgCount", param);
			
			result_arr.add(putHmap(currentVarId, "ng_cnt", ngCount));
			
//	        2. Target = (USL+LSL) / 2
//			param.put("vision_gubun", currentVarId + "_min");
//			String lsl_var_id = dao.selectOne("pmngSqlMap.getVarId", param);
//			
//			param.put("vision_gubun", currentVarId + "_max");
//			String usl_var_id = dao.selectOne("pmngSqlMap.getVarId", param);
			
			
//			System.out.println(lsl_var_id +" / "+usl_var_id);
//	        2. Target = (USL+LSL) / 2
//			param.put("USL", "'"+lsluslMap.get(currentVarId + "_max")+"'");
//			param.put("LSL", "'"+lsluslMap.get(currentVarId + "_min")+"'");
			param.put("USL", currentVarId + "_max");
			param.put("LSL", currentVarId + "_min");
			
//			float usl = dao.selectOne("pmngSqlMap.getUSLVal", param);
			
			//lsl, usl을 t_vision_raw 에서 가져오는 로직으로 변경(20.09.02)
			Map<String, Double> usllsl = dao.selectOne("pmngSqlMap.getUslLslVal", param);
			
			float usl = Float.parseFloat(usllsl.get("usl").toString());
			float lsl = Float.parseFloat(usllsl.get("lsl").toString());
			
			float target = (usl+lsl)/2;
			target = (float) (Math.round(target*100)/100.0);
			
			result_arr.add(putHmap(currentVarId, "target", target));
			result_arr.add(putHmap(currentVarId, "usl", usl));
			result_arr.add(putHmap(currentVarId, "lsl", lsl));
			
			param.put("data_val", currentVarId + "_data_val");
			
//	         2.
//	         Min = 항목별 측정값들 중 최소값
//	         Mean = 항목별 측정값들의 평균값
//	         Max = 항목별 측정값들의 최대값
//	         STD = 항목별 측정값들의 표준편차
//			float minVal = dao.selectOne("pmngSqlMap.getMinVal", param);
//			float maxVal = dao.selectOne("pmngSqlMap.getMaxVal", param);
			
			Map<String, Double> minMaxAvgStdMap = dao.selectOne("pmngSqlMap.getMinMaxAvgSTDVal", param);
			
			float avgVal = Float.parseFloat(minMaxAvgStdMap.get("avg_val").toString());
			float stdVal = Float.parseFloat(minMaxAvgStdMap.get("std_val").toString());
	         
			result_arr.add(putHmap(currentVarId, "min", Float.parseFloat(minMaxAvgStdMap.get("min_val").toString())));
			result_arr.add(putHmap(currentVarId, "max", Float.parseFloat(minMaxAvgStdMap.get("max_val").toString())));
			result_arr.add(putHmap(currentVarId, "mean", avgVal));
			result_arr.add(putHmap(currentVarId, "std", stdVal));
			
//	         NG Rate = 항목별 NG Count / 투입수량 (D15007)
			Integer inputCount = dao.selectOne("pmngSqlMap.getInputCount", param);
	         
			float ngRate = ngCount/inputCount;
			result_arr.add(putHmap(currentVarId, "ng_rate", ngRate));
			
//	        if(ngRate < 0.003) result_arr.add(putHmap(currentVarId, "color_ng_rate", 0));//green
//	        if(0.003 <= ngRate && ngRate < 0.135) result_arr.add(putHmap(currentVarId, "color_ng_rate", 1));//yellow
//	        if(ngRate >= 0.135) result_arr.add(putHmap(currentVarId, "color_ng_rate", 2));//red
	         
//			Integer allNgCount = 0;
//			for(String searchVarId : splitString) {
//				//해당 항목 외 나머지 NgCount 합을 귀하기 위함
//				if(!currentVarId.equals(searchVarId)) {
//					//전체 항목별 NG Count의 총 합계
//					//각 항목별 NG Count 조회 쿼리가지고 더해줌
//					param.put(currentVarId, searchVarId);
//  
//					Integer cuurNgCount = dao.selectOne("pmngSqlMap.getVarIdNgCount", param);
//					allNgCount = allNgCount + cuurNgCount;
//				}
//			}
			
			float proportion = 0;
	        if(allNgCount != 0) {
	        	//Proportion = 항목별 NG Count / (전체 항목별 NG Count의 총 합계)
	        	proportion = ngCount/allNgCount;
	        }
	        
			float cpk = (1 - (target/ Math.abs(avgVal-target))) * usl-lsl/6*stdVal;
			if (Float.isNaN(cpk)) cpk = 0;
	        cpk = (float) (Math.round(cpk*100)/100.0);
	        
	        //TODO cm_cd 아니면 var rule에서 기준 수정할수 있도록 변경 필요
//	        if(cpk >= 1.33) result_arr.add(putHmap(currentVarId, "color_cpk", 0));//green
//	        if(1.0 <= cpk && cpk < 1.33) result_arr.add(putHmap(currentVarId, "color_cpk", 1));//yellow
//	        if(cpk < 1.0) result_arr.add(putHmap(currentVarId, "color_cpk", 2));//red
	        
			result_arr.add(putHmap(currentVarId, "proportion", proportion));
			result_arr.add(putHmap(currentVarId, "cpk", cpk));
	         
		}
		return result_arr;
	         
	}

	public HashMap<String, Object> putHmap(String _var_id, String _gubun, float _data_val) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("var_id", _var_id);
		hmap.put("gubun", _gubun);
		hmap.put("data_val", _data_val);
		
		return hmap;
	}
	
	public void createChartExcel(Map<String, Object> m, HttpServletResponse res) throws IOException {
		String varStr = "";
		if("raw".equals(m.get("query_type"))) {  
			String[] varArr = String.valueOf(m.get("var_id_str")).split(",");
			List<String> l = new ArrayList<String>();
			for(String varId : varArr) {
			   l.add(varId);
			   varStr += "|" + varId.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll(" ", "");
			}
			m.put("var_list", l);
		}else {
			String[] varArr = String.valueOf(m.get("var_id_str")).split(",");
			List<String> l = new ArrayList<String>();
			for(String varId : varArr) {
				l.add(varId);
				varStr += "|" + varId.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll(" ", "");
			}
			m.put("var_list", l);
		}
	      
	      
	      CommonBean bean = new CommonBean();
	      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	      
	      if("raw".equals(m.get("query_type"))) {
	    	  String excelTitleStr = "NUMBER|TIME" + varStr;
	    	  
	    	  SimpleDateFormat format1 = new SimpleDateFormat( "yyyy-MM-dd_HH:mm:ss");
	    	  Date time = new Date();
	    	  String time1 = format1.format(time);
				
	    	  bean.setExcelFileName(time1+m.get("sdate")+m.get("query_type"));
	    	  bean.setTitleList(excelTitleStr);
	    	  bean.setColumnList("rn|data_tm" + varStr);
	    	  
	    	  list = dao.selectList("pmngSqlMap.getZsRawExcel", m);
	      }else {
	    	  String excelTitleStr = "NUMBER|TIME" + varStr;
	    	  SimpleDateFormat format1 = new SimpleDateFormat( "yyyy-MM-dd_HH:mm:ss");
	    	  Date time = new Date();
	    	  String time1 = format1.format(time);
				
	    	  bean.setExcelFileName(time1+m.get("sdate")+m.get("query_type"));
	    	  bean.setTitleList(excelTitleStr);
	    	  bean.setColumnList("rn|data_tm"	 + varStr);
	    	  
//	    	  System.out.println("rn|data_tm" + varStr);
	    	  list = dao.selectList("pmngSqlMap.getVisionExcel", m);
//	    	  System.out.println(list);
	      }
	      CsvUtil.createCSVFile(res, list, bean.getTitleList(), bean.getColumnList(), bean.getExcelFileName());
	   }
	
	//실린더 차트 엑셀
	public String createCylinderChartExcel(Map<String, Object> m, HttpServletResponse res) throws IOException {
		String result = "true";
		
		String excelTitleStr = "Cylinder|Variable Name|Value|Time";
		
		CommonBean bean = new CommonBean();
		bean.setExcelFileName(String.valueOf(m.get("excelFileName")));
		bean.setTitleList(excelTitleStr);
		bean.setColumnList("dvc_id|var_id|data_val|data_tm");
		
		List<Map<String, Object>> list = dao.selectList("thresholdSqlMap.createCylinderChartExcel", m);
		
		if(list.isEmpty()) {
			result = "ERR01";
		} else {
			CsvUtil.createCSVFile(res, list, bean.getTitleList(), bean.getColumnList(), bean.getExcelFileName());
		}
		return result;
		
	}
	public String convertDateToNDayBefore(String dateStr, int day) {
		String convertStr=dateStr;
		if (DateUtil.checkDate(dateStr)){
			dateStr = DateUtil.addDay(dateStr, day);
			convertStr = DateUtil.convertDate(dateStr, "", "MMdd");
		}
		return convertStr;
	}
	
	public List<String> convertDateToPeriodStrList(String dateStr, int period) {
		List<String> convertStr = new ArrayList<String>();
		if (DateUtil.checkDate(dateStr) && period < 0) {
			String tmpStr ;
			for(int i=period+1; i<0; i++) {
				tmpStr = DateUtil.addDay(dateStr, i);
				convertStr.add(DateUtil.convertDate(tmpStr, "", "MMdd"));
			}
		}
		return convertStr;
	}
	
	
}