package com.tectone.web.common.abstractinfo;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AbstractDao {
	/** 로그 처리용 개체 선언 */
	protected Logger logger = LogManager.getLogger(getClass());
	
	@Resource(name = "sqlSessionTemplate")
	protected SqlSessionTemplate sqlSession;
	
	
	/**
	 * Query의 ID 값 출력(Debug모드 일때만)
	 * @param queryId
	 */
	protected void printQueryId(String queryId) {
		if(logger.isDebugEnabled()){
			logger.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	/**
	 * Batch로 CUD 처리를 할때 호출 <br/>
	 *  - CUD가 뒤섞여 있을때 사용
	 * @param List<Map<String, Object>> lists = CUD Map = key : queryId, param, CUD
	 */
	public void multiBatch(List<Map<String, Object>> lists){
		
		SqlSession session = sqlSession.getSqlSessionFactory().openSession(ExecutorType.BATCH);
		
		for(Map<String, Object> map : lists){
			printQueryId(map.get("queryId").toString());
			// map의 key : queryId, param, CUD
			switch (map.get("CUD").toString()) {
			case "insert":
				session.insert(map.get("queryId").toString(), map.get("param"));
				break;
			case "update":
				session.update(map.get("queryId").toString(), map.get("param"));
				break;
			case "delete":
				session.delete(map.get("queryId").toString(), map.get("param"));
				break;
			}
		}
		
		session.flushStatements();
		session.commit();
		session.close();
	}

	/**
	 * insert 처리를 할때 호출
	 * @param queryId
	 * @param params
	 * @return
	 */
	public Integer insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	/**
	 * Batch로 insert 처리를 할때 호출
	 * @param List<Map<String, Object>> lists = insert Map의 key : queryId, param
	 */
	public void insertBatch(List<Map<String, Object>> lists){
		
		SqlSession session = sqlSession.getSqlSessionFactory().openSession(ExecutorType.BATCH);
		
		for(Map<String, Object> map : lists){
			printQueryId(map.get("queryId").toString());
			// Map의 key : queryId, param
			session.insert(map.get("queryId").toString(), map.get("param"));
		}
		
		session.flushStatements();
		session.close();
	}

	/**
	 * update 처리를 호출
	 * @param queryId
	 * @param params
	 * @return
	 */
	public Integer update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	/**
	 * Batch로 update 처리를 할때 호출
	 * @param List<Map<String, Object>> lists = update Map의 key : queryId, param
	 */
	public void updateBatch(List<Map<String, Object>> lists){
		
		SqlSession session = sqlSession.getSqlSessionFactory().openSession(ExecutorType.BATCH);
		
		for(Map<String, Object> map : lists){
			printQueryId(map.get("queryId").toString());
			// Map의 key : queryId, param
			session.update(map.get("queryId").toString(), map.get("param"));
		}
		
		session.flushStatements();
		session.close();
	}

	/**
	 * delete 처리를 할때 호출
	 * @param queryId
	 * @param params
	 * @return
	 */
	public Integer delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	/**
	 * Batch로 delete 처리를 할때 호출
	 * @param List<Map<String, Object>> lists = delete Map의 key : queryId, param
	 */
	public void deleteBatch(List<Map<String, Object>> lists){
		
		SqlSession session = sqlSession.getSqlSessionFactory().openSession(ExecutorType.BATCH);
		
		for(Map<String, Object> map : lists){
			printQueryId(map.get("queryId").toString());
			// Map의 key : queryId, param
			session.delete(map.get("queryId").toString(), map.get("param"));
		}
		
		session.flushStatements();
		session.close();
	}
	
	/**
	 * 단일 select
	 * @param queryId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> T selectOne(String queryId){
		printQueryId(queryId);
		return (T) sqlSession.selectOne(queryId);
	}
	
	/**
	 * 단일 select
	 * @param queryId
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T, P> T selectOne(String queryId, P params){
		printQueryId(queryId);
		return (T) sqlSession.selectOne(queryId, params);
	}

	/**
	 * 복수 select
	 * @param queryId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> selectList(String queryId){
		printQueryId(queryId);
		return (List<T>) sqlSession.selectList(queryId);
	}

	/**
	 * 복수 select
	 * @param queryId
	 * @param params
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	public <T, P> List<T> selectList(String queryId, P params){
		printQueryId(queryId);
		return (List<T>) sqlSession.selectList(queryId, params);
	}

}
