package com.tectone.web.business.alarm.data;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.tectone.util.CsvUtil;
import com.tectone.util.Pagenate;
import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.CommonBean;
import com.tectone.web.model.DataBean;

/**
 * 레이아웃 관리
 */
@Service
public class DataService extends AbstractService {

	@Inject
	private DataDao dao;


	/**
	 * 엑셀 파일 생성
	 * 메모리 관리를 위해 10000(?) 건씩 조회하여 생성한다.
	 * @param map
	 * @param res
	 * @throws Exception 
	 */
	public void getRawDataToExcel(Map<String, Object> map, HttpServletResponse res) throws Exception {
		// 엑셀 파일 기본 정보 셋팅 (파일명, 컬럼명, 컬림 id)
		CommonBean bean = new CommonBean();
		bean.setExcelFileName(map.get("excelFileName")+"");
		bean.setTitleList("번호|장치ID|장치명|변수명|데이터수집시간|데이터값");
//		bean.setColumnList("STATS_RAW_SEQ|DVC_ID|DVC_NM|VAR_NM|DATA_TM|DATA_VAL");
		bean.setColumnList("stats_raw_seq|dvc_id|dvc_nm|var_nm|data_tm|data_val");

		// 전체 건수 조회
//		int totalCnt = dao.selectOne("dataSqlMap.getRawDataListPaging", map); // 전체 데이터 건수
//		int limit = 10000; // 엑셀 데이터 최대 조회 건수
		// 전체 건수가 10000 건이 넘을 경우, 10000개씩 데이터를 조회한다.
//		if( totalCnt > limit ){
//			map.put("limit", limit);
//		}
		
		List<Map<String, Object>> dataList =  dao.selectList("dataSqlMap.getRawDataListForExcel", map);
//		ExcelUtil.ExcelfileCreate(res ,bean.getTitleList(), bean.getColumnList(), dataList, bean.getExcelFileName());
		CsvUtil.createCSVFile(res, dataList, bean.getTitleList(), bean.getColumnList(), bean.getExcelFileName());
		
		// 반복처리 기간동안 엑셀 파일 생성
//		for(int i=0; i<( totalCnt%limit==0 ? totalCnt/limit : (totalCnt/limit)+1 ); i++ ){
//			map.put("sRowNum", i*limit );
////			List<Map<String, Object>> targetList =  dao.selectList("dataSqlMap.getRawDataListForExcel", map);
//			// 위 데이터로 엑셀파일에 이어쓰기........?
//			// 다중 파일로 생성하여 압축 후 리턴?
//		}
	}


	public Object selectRawDataPageing(DataBean bean) {
		Map<String, Object> pageMap = new HashMap<String, Object>();
		
		int listTotalCnt = dao.selectOne("dataSqlMap.getRawDataListPaging", bean);
		pageMap.putAll(Pagenate.getSettingsForPagenate(bean, listTotalCnt));
		
		return pageMap;
	}

}