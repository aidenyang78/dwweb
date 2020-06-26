package com.site.contents.statistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.comm.web.CommonDao;
import com.site.contents.routeinfo.RouteInfoVo;

/**
 * 시설물통계  StatisticsService
 * <pre>
 * 사용자 관리 
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.17)
 */
@Service("statisticsService")
public class StatisticsService {
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "com.site.contents.statistics.Statistics.";
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.17
	 * @description 지구별 도로(국도)리스트 조회 ajax
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<StatisticsVo> selectRouteList(StatisticsVo vo) {
		return dao.list(NAMESPACE+"selectRouteList", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.19
	 * @description 통계(텍스트형) 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	
	public List<StatisticsVo> selectStatisticsList(StatisticsVo vo) {
		return dao.list(NAMESPACE+"selectStatisticsList", vo);
	}
	
	
}
