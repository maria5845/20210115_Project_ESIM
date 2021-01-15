package com.tectone.web.common.abstractinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.tectone.web.model.CmcdBean;
import com.tectone.web.model.PolicyBean;


public class AbstractService {
	/** 로그 처리용 개체 선언 */
	protected Logger logger = LogManager.getLogger(getClass());
	
	@Resource(name="abstractDao")
	private AbstractDao dao;
	
	

	public Integer insert(String queryId, Object params){
		return dao.insert(queryId, params);
	}
	 
	public Integer update(String queryId, Object params){
		return dao.update(queryId, params);
	}
	 
	public Integer delete(String queryId, Object params){
		return dao.delete(queryId, params);
	}
	 
	@SuppressWarnings("unchecked")
	public <T> T selectOne(String queryId){
		return (T) dao.selectOne(queryId);
	}
	 
	@SuppressWarnings("unchecked")
	public <T, P> T selectOne(String queryId, P params){
		return (T) dao.selectOne(queryId, params);
	}
	 
	@SuppressWarnings("unchecked")
	public <T> List<T> selectList(String queryId){
		return (List<T>) dao.selectList(queryId);
	}
	 
	@SuppressWarnings({ "unchecked" })
	public <T, P> List<T> selectList(String queryId, P params){
		return (List<T>) dao.selectList(queryId, params);
	}

	public List<CmcdBean> getCmcdList(String cat_cd){
		return getCmcdList(cat_cd, null);
	}
	public List<CmcdBean> getCmcdList(String cat_cd, String use_yn){
		//공통코드 조회
		CmcdBean cmcdBean = new CmcdBean();
		cmcdBean.setCat_cd(cat_cd);
		cmcdBean.setUse_yn(use_yn);
		
		try {
			return selectList("codeSqlMap.getCmCdList", cmcdBean);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public List<CmcdBean> getCmcdList(String cat_cd, String p_cd, String use_yn){
		//공통코드 조회
		CmcdBean cmcdBean = new CmcdBean();
		cmcdBean.setCat_cd(cat_cd);
		cmcdBean.setP_cd(p_cd);
		cmcdBean.setUse_yn(use_yn);
		
		try {
			return selectList("codeSqlMap.getCmCdList", cmcdBean);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public CmcdBean getCmcdOne(String cat_cd, String cd, String use_yn){
		//단일코드 조회
		CmcdBean cmcdBean = new CmcdBean();
		cmcdBean.setCat_cd(cat_cd);
		cmcdBean.setCd(cd);
		cmcdBean.setUse_yn(use_yn);
		
		try {
			return selectOne("codeSqlMap.getCmCdOne", cmcdBean);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public PolicyBean getPolicyInfo(String sys_polcy_info_cd){
		//단일코드 조회
		PolicyBean polcyBean = new PolicyBean();
		polcyBean.setSys_polcy_info_cd(sys_polcy_info_cd);

		try {
			return selectOne("policySqlMap.selectPolicyInfo", polcyBean);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Map<String, Object> createBatchParam(String queryId, String cud, Object param) {
		Map<String, Object> map = new HashMap<>();
		map.put("queryId", queryId);
		map.put("param", param);
		map.put("CUD", cud);
		return map;
	}
	
	public void multibatch(List<Map<String, Object>> multibatchList) {
		dao.multiBatch(multibatchList);
	}
}
