package com.site.contents.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.comm.web.AbstractService;
import com.core.comm.web.CommonDao;
import com.site.contents.crossroadinfo.CrossroadInfoVo;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2020.06.01           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발1팀
 * @since 2020.06.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("mainService")
public class MainService extends AbstractService {

	@Autowired
	private CommonDao dao;
	
	private String NAMESPACE = "com.site.contents.main.Main.";
	
	/**
	 * @author 양성진
	 * @creation_date 2020.07.02
	 * @description 지구별 도로(국도)리스트 조회 
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MainVo> selectMainRouteList(MainVo vo) throws Exception{
		return dao.list(NAMESPACE+"selectMainRouteList", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.07.02
	 * @description 교차로 리스트 조회 
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */	
	public List<MainVo> selectMainCrossroadList(MainVo vo) throws Exception{
		return dao.list(NAMESPACE+"selectMainCrossroadList", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.07.07
	 * @description 지도위 좌표 수정
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateCrossroadLatLngAjax(MainVo vo) {
		return dao.update(NAMESPACE+"updateCrossroadLatLngAjax", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.07.07
	 * @description 지도위 좌표 실시간 조회
	 * @history : 외부 DB dw_its 와 연결 중 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MainVo selectCrossroadLatLngAjax(MainVo vo) {
		return (MainVo)dao.select(NAMESPACE+"selectCrossroadLatLngAjax", vo);
	}

	
	/**
	 * @author 양성진
	 * @creation_date 2020.07.07
	 * @description 도로(국도) 교차로 정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MainVo> selectCrossroadListAjax(MainVo vo) {
		return dao.list(NAMESPACE+"selectCrossroadListAjax", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.07.13
	 * @description 도로(국도) 교차로 정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MainVo> selectMatchingLatlngAjax(MainVo vo) {
		return dao.list(NAMESPACE+"selectMatchingLatlngAjax", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.07.14
	 * @description 지도에서 선택 된 좌표에 교차로 등록
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertCrossroadLaglngAjax(CrossroadInfoVo vo) {
		return dao.insert(NAMESPACE+"insertCrossroadLaglngAjax", vo);
	}
	
	
}
