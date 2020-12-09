package com.site.contents.crossroadinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.comm.web.CommonDao;

/**
 * 로그인 관리  CrossroadInfoService
 * <pre>
 * 공용기능
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.05)
 */
@Transactional
@Service("crossroadInfoService")
public class CrossroadInfoService {
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "com.site.contents.crossroadInfo.CrossroadInfo.";
	
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 도로명 정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<CrossroadInfoVo> selectCrossroadListAjax(CrossroadInfoVo vo) throws Exception{
		return dao.list(NAMESPACE+"selectCrossroadListAjax", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 도로명 정보 조회 전체 카운트
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectTotCrossroad(CrossroadInfoVo vo) throws Exception{
		return (Integer)dao.select(NAMESPACE+"selectTotCrossroad", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 교차로 리스트 정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<CrossroadInfoVo> selectCrossroadList(CrossroadInfoVo vo) throws Exception{
		return dao.list(NAMESPACE+"selectCrossroadList", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 교차로 상세정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public CrossroadInfoVo selectCrossroadInfo(CrossroadInfoVo vo) {
		return (CrossroadInfoVo)dao.select(NAMESPACE+"selectCrossroadInfo", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 교차로 등록 실행
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertCrossroadInfo(CrossroadInfoVo vo) {
		return dao.insert(NAMESPACE+"insertCrossroadInfo", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 교차로 정보 수정 실행
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateCrossroadInfo(CrossroadInfoVo vo) {
		return dao.update(NAMESPACE+"updateCrossroadInfo", vo);
	}
	
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 교차로 정보 삭제
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteCrossroadInfo(CrossroadInfoVo vo) {
		return dao.update(NAMESPACE+"deleteCrossroadInfo", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 도로(국도) 삭제 시 하위 교차로 삭제
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteAllCrossroadInfo(CrossroadInfoVo vo) {
		return dao.update(NAMESPACE+"deleteAllCrossroadInfo", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.30
	 * @description 교차로명 중복 체크
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectCrossroadNmCheckAjax(CrossroadInfoVo vo) {
		return (Integer)dao.select(NAMESPACE+"selectCrossroadNmCheckAjax", vo);
	}

}
