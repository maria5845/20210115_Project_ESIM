package com.tectone.web.business.setting.code;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.CmcdBean;


@Service
public class CodeService extends AbstractService{

	@Inject
	private CodeDAO dao;

	
	/**
	 * 코드 카테고리 Action(추가/수정/삭제)
	 * @param cmcdBean
	 * @param action_type
	 * @throws Exception
	 */
	public void codecategoryAction(CmcdBean cmcdBean, String action_type) throws Exception {
		switch (action_type) {
		case "add":
			insert("codeSqlMap.insertCmCategory", cmcdBean);
			break;
		case "modify":
			update("codeSqlMap.updateCmCategory", cmcdBean);
			break;
		case "delete":
			String[] cat_cds = cmcdBean.getCat_cd().split(",");
			
			for (String cat_cd : cat_cds) {
				cmcdBean.setCat_cd(cat_cd);
				delete("codeSqlMap.deleteCmCategory", cmcdBean);
			}
			
			break;
		}
	}
	
	/**
	 * 코드 Action(추가/수정/삭제)
	 * @param cmcdBean
	 * @param action_type
	 * @throws Exception
	 */
	public void codesAction(CmcdBean cmcdBean, String action_type) throws Exception {
		switch (action_type) {
		case "add":
			insertCodes(cmcdBean);
			break;
		case "modify":
			updateCodes(cmcdBean);
			break;
		case "delete":
			deleteCodes(cmcdBean);
			break;
		}
	}

	/**
	 * 코드 추가
	 */
	public void insertCodes(CmcdBean cmcdBean) throws Exception {
		// 해당 코드 카테고리 하위 코드들의 정렬 순서를 한칸씩 뒤로(입력받은 정렬순서보다 큰것들)
		dao.update("codeSqlMap.shiftBackCmCdOrder", cmcdBean);
		// 코드 삽입
		dao.insert("codeSqlMap.insertCmCd", cmcdBean);
		
	}
	
	/**
	 * 코드 수정
	 */
	public void updateCodes(CmcdBean cmcdBean) throws Exception {
		// 해당 코드 카테고리 하위 코드들의 정렬 순서를 한칸씩 앞으로(이전 정렬순서보다 큰것들)
		dao.update("codeSqlMap.shiftForwardCmCdOrder", cmcdBean);
		// 해당 코드 카테고리 하위 코드들의 정렬 순서를 한칸씩 뒤로(입력받은 정렬순서보다 큰것들)
		dao.update("codeSqlMap.shiftBackCmCdOrder", cmcdBean);
		// 코드 수정
		dao.update("codeSqlMap.updateCmCd", cmcdBean);
	}
	
	/**
	 * 코드 삭제
	 */
	public void deleteCodes(CmcdBean cmcdBean) throws Exception {
		
		String[] cdArr = cmcdBean.getCd().split(",");
		String[] ordArr = String.valueOf(cmcdBean.getOrd_arr()).split(",");
				
		for (int i=0; i < cdArr.length; i++) {
			cmcdBean.setCd(cdArr[i]);
			cmcdBean.setBefore_disp_ord(Integer.parseInt(ordArr[i]));
			
			// 해당 코드 카테고리 하위 코드들의 정렬 순서를 한칸씩 앞으로(이전 정렬순서보다 큰것들)
			dao.update("codeSqlMap.shiftForwardCmCdOrder", cmcdBean);
			// 코드 삭제
			dao.delete("codeSqlMap.deleteCmCd", cmcdBean);
		}
		
	}
	
	public CmcdBean getCode(CmcdBean codeBean) {
		return dao.selectOne("codeSqlMap.getCode", codeBean);
	}
	
	public CmcdBean getCode(String catCode, String code) {
		CmcdBean codeBean = new CmcdBean();
		codeBean.setCat_cd(catCode);
		codeBean.setCd(code);
		return dao.selectOne("codeSqlMap.getCode", codeBean);
	}
}
