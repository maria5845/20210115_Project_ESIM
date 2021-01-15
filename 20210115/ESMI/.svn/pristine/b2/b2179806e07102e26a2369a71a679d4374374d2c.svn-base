package com.tectone.web.business.setting.lang;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.common.domain.MessageContainer;
import com.tectone.web.model.LangBean;

@Service
public class LangService extends AbstractService {

	@Inject
	private LangDAO dao;
	
 
	/**
	 * 다국어 Action(추가/수정)
	 * @param langBean
	 * @param action_type
	 * @throws Exception
	 */
	public void langAction(LangBean langBean, String action_type) throws Exception {
		
		switch (action_type) {
		case "add":
			insertLang(langBean);
			break;
		case "modify":
			updateLang(langBean);
			break;
		case "delete":
			dao.delete("langSqlMap.deleteLang", langBean);
			break;
		}
	}
	
	/**
	 * Lang 코드 및 메시지 추가
	 * @param langBean
	 */
	private void insertLang(LangBean langBean) {
		// 기존에 존재하는 lang코드일 경우 업데이트
		LangBean bean = dao.selectOne("langSqlMap.getLang", langBean);
		if( null != bean ) {
			langBean.setLang_msg_cd_org(langBean.getLang_msg_cd());
			updateLang(langBean);
		}else {
			dao.insert("langSqlMap.insertLang", langBean);
		}
	}

	/**
	 * Lang 코드 수정
	 * @param langBean
	 */
	private void updateLang(LangBean langBean) {
		dao.update("langSqlMap.updateLangKO", langBean);
		dao.update("langSqlMap.updateLangEN", langBean);
		dao.update("langSqlMap.updateLangCN", langBean);
		dao.update("langSqlMap.updateLangPL", langBean);
	}
	
	/**
	 * 다국어 변경내용 적용<br/>
	 *  - properties파일에 반영
	 * @param langBean
	 * @throws Exception
	 */
	public void applyChangesLang(HttpServletRequest req) throws Exception {
		
		MessageContainer mc = new MessageContainer();
		mc.GenerateMessageProps(req.getServletContext().getRealPath("/"), dao);
	}
}
