package com.tectone.web.business.custom.loadfactor.ad;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tectone.web.common.abstractinfo.AbstractDao;
@Repository
public class LoadfactorADDao extends AbstractDao{

	@Resource(name = "sqlSessionTemplate")
	protected SqlSessionTemplate sqlSession;

	
	
	
}
