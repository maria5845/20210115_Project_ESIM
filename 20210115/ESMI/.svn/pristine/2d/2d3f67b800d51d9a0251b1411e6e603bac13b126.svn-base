package com.tectone.util;

import java.util.HashSet;
import java.util.Set;

import com.tectone.web.model.LayoutBean;
/**
 * 
 * @author HAN
 *
 */
public class PanelUtil {
	/**
	 * 파라미터 체크를 하여 필요한 메시지를 Set 에 담아 보낸다.
	 * @param bean
	 * @param layoutBean
	 * @return
	 */
	public static Set<String> getNeeded(LayoutBean bean, LayoutBean layoutBean) {
		// 쿼리를 한줄씩 읽어들여 각 바인딩 변수를 찾는다.
		String[] lines = bean.getQuery_data().split(System.getProperty("line.separator"));
		Set<String> needed = new HashSet<>();
		
		for (String line : lines) {
			if (!line.startsWith("--")) {
				if (line.contains("$deviceId") || line.contains("$deviceIds") || line.contains("$deviceIdStr")) {
					if (layoutBean.getDvc_id_str() == null) {
						needed.add("트리 사용 여부가 미사용이므로 생성할 수 없습니다.\n");
					}
				} 
				if (line.contains("$sdate") || line.contains("$smd") || line.contains("$edate") || line.contains("$emd")) {
					if (layoutBean.getDsbd_sdate() == null || layoutBean.getDsbd_edate() == null) {
						needed.add("날짜 검색 사용 여부가 미사용이므로 생성할 수 없습니다.\n");
					}
				}
				if (line.contains("$variableId") || line.contains("$variableIds") || line.contains("$variableIdStr")) {
					if (layoutBean.getVar_id_str() == null) {
						needed.add("수집항목 검색 사용 여부가 미사용이므로 생성 할 수 없습니다.\n");
					}
				}
				if ((bean.getDe_lmt_rng() != null && !bean.getDe_lmt_rng().equals("")) && layoutBean.getDsbd_sdate() == null &&  layoutBean.getDsbd_edate() == null) {
					needed.add("날짜 검색 사용 여부가 미사용이므로 생성할 수 없습니다.\n");
				}
			} else {
				continue;
			}
		}
		
		return needed; 
	}
}
