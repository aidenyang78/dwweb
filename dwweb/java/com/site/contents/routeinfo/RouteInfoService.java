package com.site.contents.routeinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.comm.web.CommonDao;
import com.site.contents.statistics.StatisticsVo;

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
	
	/**
	 * @author 양성진
	 * @creation_date 2020.07.01
	 * @description 지구별 도로(국도)명 중복 체크
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectRouteNmCheckAjax(RouteInfoVo vo) {
		return (Integer)dao.select(NAMESPACE+"selectRouteNmCheckAjax", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 지구별 도로(국도)리스트 조회 
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<RouteInfoVo> selectRouteList(RouteInfoVo vo) {
		return dao.list(NAMESPACE+"selectRouteList", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.01.01
	 * @description 도로(국도) 등록 실행 
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertRouteInfo(RouteInfoVo vo) {
		return  dao.insert(NAMESPACE+"insertRouteInfo", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.01.01
	 * @description 도로(국도) 수정 실행 
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateRouteInfo(RouteInfoVo vo) {
		return  dao.update(NAMESPACE+"updateRouteInfo", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.01.01
	 * @description 도로(국도) 삭제 실행 
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteRouteInfo(RouteInfoVo vo) {
		return  dao.update(NAMESPACE+"deleteRouteInfo", vo);
	}

	public RouteInfoVo selectRouteInfo(RouteInfoVo vo) {
		return (RouteInfoVo) dao.select(NAMESPACE+"selectRouteInfo", vo);
	}
}
