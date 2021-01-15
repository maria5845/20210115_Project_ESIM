package com.tectone.web.business.custom.cwa.cwapackage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.tectone.util.CsvUtil;
import com.tectone.util.DateUtil;
import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.CommonBean;

@Service
public class CwaPackageService extends AbstractService {

	@Inject
	private CwaPackageDao dao;
	
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
	
	/**
	 * 엑셀 파일 생성
	 * @param map
	 * @param res
	 * @throws Exception 
	 */
	public void getLoadFactorDataToExcel(Map<String, Object> map, HttpServletResponse res, String sqlMapName) throws Exception{
		CommonBean bean = new CommonBean();
		String excelTitleStr = "번호|dvc_id|Unit|";
		String periodStr = map.get("periodStr").toString();
		String paramStr[] = periodStr.replace("[", "")
									 .replace("]", "")
									 .split(", ");
		String titleStr = "";
		for( String p : paramStr) {
			titleStr += p.substring(0, 2)+"월" + p.substring(2, 4) + "일|";
		}
		
		bean.setExcelFileName(map.get("excelFileName")+"");
		bean.setTitleList(excelTitleStr+titleStr);
		bean.setColumnList("rownum|dvc_id|xunit|"
				 + "d0|d1|d2|d3|d4|d5|d6|d7|d8|d9|d10|d11|d12|d13|d14");
		
		List<Map<String, Object>> dataList =  dao.selectList(sqlMapName, map);
		CsvUtil.createCSVFile(res, dataList, bean.getTitleList(), bean.getColumnList(), bean.getExcelFileName());
	}
	
	public void getLoadFactorDataToExcel(Map<String, Object> map, HttpServletResponse res) throws Exception{
		getLoadFactorDataToExcel(map, res, "customSqlMap.getLoadFactorDataForExcel");
	}
}
