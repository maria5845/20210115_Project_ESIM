package com.tectone.util;

import java.io.IOException;
import com.tectone.web.model.CustomBean;

/*
 * PostgreSQL CrossTab 생성
 * Mybatis 문법오류 때문에 작성 
 */
public class PivotUtil {
	
	public static CustomBean crossTab(CustomBean bean, String varId, String varCrosstab) throws IOException {
		// #{last_tab} bean에 쿼리문 전체를 저장
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT *   FROM crosstab( ");    
		sb.append("		$$ ");
		sb.append("			SELECT ");
		sb.append("			TO_CHAR(TO_TIMESTAMP(SUBSTRING(data_tm, 1, 14), 'yyyymmddHH24miss'), '(mm/dd) HH24:mi:ss') as data_tm       , var_id      , data_val ");    
		sb.append("			FROM t_zs_raw ");
		sb.append("			WHERE 1=1 ");
		sb.append("			AND t_md BETWEEN SUBSTRING('"+bean.getSdate()+"', 5, 4) AND SUBSTRING('"+bean.getEdate()+"', 5, 4) ");      
		sb.append("			AND data_tm BETWEEN '"+bean.getSdate()+"' AND '"+bean.getEdate()+"' ");
		sb.append("			AND dvc_id = '"+bean.getDvc_id()+"' ");
		sb.append("			AND var_id IN ( ");
		sb.append("				"+varId+" ");
		sb.append("				) ");
		sb.append("			ORDER BY 1,2 ");      
		sb.append("			limit 100000 ");
		sb.append("		$$ ");
		sb.append("	) AS ct(data_tm text"+varCrosstab+") ");

		bean.setLast_tab(sb.toString());
		return bean;
	}

}
