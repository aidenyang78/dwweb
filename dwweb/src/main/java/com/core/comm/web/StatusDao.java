package com.core.comm.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


/**  
 * @Class Name : CommonDao.java
 * @Description : 공통 DAO
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2016.01.05           최초생성
 * 
 * @author 김주섭
 * @since 2016.01.05
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by Teos All right reserved.
 */

@Repository("StatusDao")
public class StatusDao extends SqlSessionDaoSupport{

	@Resource(name = "statusSqlSession")
    public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
    	super.setSqlSessionFactory(sqlSession);
    }
	
	@SuppressWarnings("rawtypes")
	public int insert(String queryId, Object parameterObject) {
    	return getSqlSession().insert(queryId, parameterObject);
    }
	
	@SuppressWarnings("rawtypes")
	public int update(String queryId, Object parameterObject) {
        return getSqlSession().update(queryId, parameterObject);
    }
	
	@SuppressWarnings("rawtypes")
	public int delete(String queryId, Object parameterObject) {
        return getSqlSession().delete(queryId, parameterObject);
    }
	
	@SuppressWarnings("rawtypes")
	public Object select(String queryId, Object parameterObject) {
        return getSqlSession().selectOne(queryId, parameterObject);
    }
	
	@SuppressWarnings("rawtypes")
	public List list(String queryId, Object parameterObject) {
        return getSqlSession().selectList(queryId, parameterObject);
    }
	
	@SuppressWarnings("rawtypes")
	public List listPage(String queryId, Object parameterObject, int pageIndex, int pageSize) {
        int skipResults = pageIndex * pageSize;
        //int maxResults = (pageIndex * pageSize) + pageSize;

        RowBounds rowBounds = new RowBounds(skipResults, pageSize);

        return getSqlSession().selectList(queryId, parameterObject, rowBounds);
    }

}