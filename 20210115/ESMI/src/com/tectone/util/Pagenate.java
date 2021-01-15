package com.tectone.util;

import java.util.HashMap;
import java.util.Map;

import com.tectone.web.common.base.CommonConst;
import com.tectone.web.model.CommonBean;

public class Pagenate {
	public static Map<String, Object> getSettingsForPagenate(CommonBean beanObject, int listTotalCnt) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		int totalPage = (listTotalCnt / beanObject.getPageSize());
		if(listTotalCnt % beanObject.getPageSize() > 0) totalPage++;
		
		if(totalPage < beanObject.getPage()) {
			beanObject.setPage(totalPage);
		}

		if(beanObject.getPage() < 1) {
			beanObject.setPage(1);
		}
		
		int pagingStartPage = beanObject.getPage() - (CommonConst.HORIZONTAL_VIEW_NUMBER / 2);
		int pagingEndPage = beanObject.getPage() + (CommonConst.HORIZONTAL_VIEW_NUMBER / 2);
		if(pagingStartPage < 1) pagingStartPage = 1;
		if(pagingEndPage > totalPage) pagingEndPage = totalPage;

		beanObject.setCntPerPage(beanObject.getPageSize());
		//1부터 시작
		beanObject.setStartRowNum(((beanObject.getPage() - 1) * beanObject.getPageSize()) + 1);
		//postgresql은 0부터 start
		//beanObject.setStartRowNum(((beanObject.getPage() - 1) * beanObject.getPageSize()));
		beanObject.setEndRowNum(beanObject.getPage() * beanObject.getPageSize());

		retMap.put("horiPageSize", CommonConst.HORIZONTAL_VIEW_NUMBER);
		retMap.put("pagingStartPage", pagingStartPage);
		retMap.put("pagingEndPage", pagingEndPage);
		retMap.put("totalPage", totalPage);
		retMap.put("page", beanObject.getPage());
		retMap.put("cnt", listTotalCnt);
		
		return retMap;
	}
	
	public static Map<String, Object> getSettingsForPagenate_popup(CommonBean beanObject, int listTotalCnt) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		int totalPage = (listTotalCnt / CommonConst.VERTICAL_VIEW_NUMBER_POPUP);
		if(listTotalCnt % CommonConst.VERTICAL_VIEW_NUMBER_POPUP > 0) totalPage++;
		
		if(totalPage < beanObject.getPage()) {
			beanObject.setPage(totalPage);
		}
		
		if(beanObject.getPage() < 1) {
			beanObject.setPage(1);
		}
		
		int pagingStartPage = beanObject.getPage() - (CommonConst.HORIZONTAL_VIEW_NUMBER_POPUP / 2);
		int pagingEndPage = beanObject.getPage() + (CommonConst.HORIZONTAL_VIEW_NUMBER_POPUP / 2);
		if(pagingStartPage < 1) pagingStartPage = 1;
		if(pagingEndPage > totalPage) pagingEndPage = totalPage;
		
		beanObject.setCntPerPage(CommonConst.VERTICAL_VIEW_NUMBER_POPUP);
		//1부터 시작
		beanObject.setStartRowNum(((beanObject.getPage() - 1) * CommonConst.VERTICAL_VIEW_NUMBER_POPUP) + 1);
		//postgresql은 0부터 start
		//beanObject.setStartRowNum(((beanObject.getPage() - 1) * CommonConst.VERTICAL_VIEW_NUMBER_POPUP));
		beanObject.setEndRowNum(beanObject.getPage() * CommonConst.VERTICAL_VIEW_NUMBER_POPUP);
		
		retMap.put("horiPageSize", CommonConst.HORIZONTAL_VIEW_NUMBER_POPUP);
		retMap.put("pagingStartPage", pagingStartPage);
		retMap.put("pagingEndPage", pagingEndPage);
		retMap.put("totalPage", totalPage);
		retMap.put("page", beanObject.getPage());
		retMap.put("cnt", listTotalCnt);
		
		return retMap;
	}
}
