package com.tectone.util;

import com.tectone.web.model.LayoutBean;

public class SQLUtil {
	
	/**
	 * 쿼리 실행 또는 저장 전에, DDL문 점검
	 * @param layoutBean
	 * @return
	 */
	public static LayoutBean checkQueryDDLValidation(LayoutBean layoutBean) throws Exception {
	
		String q = layoutBean.getQuery_data().toLowerCase();
		
		if(q.indexOf(";") != -1){
			throw new Exception("쿼리에 ;가 없어야 합니다.");
		}else if(q.indexOf("create") != -1){
			throw new Exception("쿼리에 create가 없어야 합니다.");
		}else if(q.indexOf("update") != -1){
			throw new Exception("쿼리에 update가 없어야 합니다.");
		}else if(q.indexOf("delete") != -1){
			throw new Exception("쿼리에 delete가 없어야 합니다.");
		}else if(q.indexOf("drop") != -1){
			throw new Exception("쿼리에 drop이 없어야 합니다.");
		}else if(q.indexOf("select ") == -1){
			throw new Exception("쿼리에 select가 있어야 합니다.");
		}
		
		return layoutBean;
	}
	
	/**
	 * 쿼리 실행 또는 저장 전에, DDL문 점검
	 * @param layoutBean
	 * @return
	 */
	public static void checkQuerySQLValidation(String type, String[] arrColumn) throws Exception {
		// 컬럼ID 가 data면 안된다.
		for( String column : arrColumn ){
			if(column.indexOf(" as ") != -1) {
				column = column.substring(column.indexOf(" as ") + 4).replaceAll(" ", "");
			}else {
				column = column.replaceAll(" ", "");
			}
			if( "data".equals(column) ){
				throw new Exception("'data'를 컬럼으로 지정할 수 없습니다.");
			}
		}
		
		// 차트일 경우
		if( "CHRT".equals(type) ){
			if( arrColumn.length < 2 ){
				throw new Exception("차트패널용 데이터소스는 2개 이상의 컬럼을 입력하여야 합니다.");
			}
		}
		
		// 테이블일 경우
		if( "TBL".equals(type) ){
			if( arrColumn.length == 0 || 
				(arrColumn.length == 1 && "".equals(arrColumn[0].replace(" ", ""))) ){
				throw new Exception("테이블용 데이터소스는 1개 이상의 컬럼을 입력하여야 합니다.");
			}
		}
		
		// 텍스트일 경우
		if( "TXT".equals(type) ){
			boolean hasValueCol = false;
			for( String column : arrColumn ){
				if(column.indexOf(" as ") != -1) {
					column = column.substring(column.indexOf(" as ") + 4).replaceAll(" ", "");
				}else {
					column = column.replaceAll(" ", "");
				}
				if( "data_val".equals(column) ){
					hasValueCol = true;
				}
			}
			if( !hasValueCol ){
				throw new Exception("텍스트패널용 데이터소스는 'data_val' 컬럼이 포함되어야 합니다.");
			}
		}
		
		// svg일 경우
		if( "SVG".equals(type) ){
			boolean hasValueCol = false;
			boolean hasSVGCol = false;
			for( String column : arrColumn ){
				if(column.indexOf(" as ") != -1) {
					column = column.substring(column.indexOf(" as ") + 4).replaceAll(" ", "");
				}else {
					column = column.replaceAll(" ", "");
				}
				if( "data_val".equals(column) ){
					hasValueCol = true;
				}
				if( "svg_clmn_id".equals(column) ){
					hasSVGCol = true;
				}
			}
			if( !hasValueCol || !hasSVGCol ){
				throw new Exception("SVG패널용 데이터소스는 'svg_clmn_id', 'data_val' 컬럼이 모두 포함되어야 합니다.");
			}
		}
	}

	/**
	 * 쿼리 컬럼리스트에서 x축에 지정할 컬럼의 순서를 구한다.
	 * @param arr
	 * @return
	 */
	public static int getXAliasColumnIdx(String[] arr) {
		int idx = -1;
		for(int i = 0; i < arr.length; i++) {
			if( i == 0 ) idx = i; // 차트면 일단 첫 컬럼을 x 축으로 지정
			
			if(arr[i].indexOf(" as ") != -1) {
				arr[i] = arr[i].substring(arr[i].indexOf(" as ") + 4).replaceAll(" ", "");
			}else {
				arr[i] = arr[i].replaceAll(" ", "");
			}
			// 컬럼ID 값이 data_tm일 경우 해당 컬럼을 x 축으로 지정
			if( arr[i].toLowerCase().indexOf("data_tm") > -1 ){
				idx = i;
			}
		}
		
		return idx;
	}
}
