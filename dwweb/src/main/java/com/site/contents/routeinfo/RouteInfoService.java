package com.site.contents.routeinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.comm.web.CommonDao;

/**
 * 도로(국도)관리  RouteInfoService
 * <pre>
 * 사용자 관리 
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.17)
 */
@Transactional
@Service("routeInfoService")
public class RouteInfoService {
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "com.site.contents.routeInfo.RouteInfo.";

	/**
	 * @author 양성진
	 * @creation_date 2020.06.17
	 * @description 지구별 도로(국도)리스트 조회 ajax
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<RouteInfoVo> selectRouteListAjax(RouteInfoVo vo) {
		return dao.list(NAMESPACE+"selectRouteListAjax", vo);
	}
	
}
