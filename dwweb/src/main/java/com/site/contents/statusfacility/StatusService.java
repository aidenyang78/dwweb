package com.site.contents.statusfacility;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.comm.web.StatusDao;

/**
 * 시설문 상태(장애) StatusService
 * <pre>
 * 사용자 관리 
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.01)
 */


@Service("statusService")
public class StatusService {
	
	@Autowired
	private StatusDao dao;	
	private String NAMESPACE = "com.site.contents.status.Status.";
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.09
	 * @description 상태값 설정 정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */	
	public List<StatusVo> selectListStatusGroup() throws Exception{
		
		return dao.list(NAMESPACE+"selectListStatusGroup", null);
		
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.09
	 * @description 장애리스트 전체 카운트
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */	
	public int selectTotStatus(StatusVo vo) throws Exception{
		return (Integer)dao.select(NAMESPACE+"selectTotStatus", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.09
	 * @description 장애 리스트 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */	
	public List<StatusVo> selectListStatus(StatusVo vo) throws Exception{
		return dao.list(NAMESPACE+"selectListStatus", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.09
	 * @description 교차로 매칭 대상 장애리스트 조회
	 * @history	: *주의 dw_itsweb의 테이블과 외부 조인 중
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<StatusVo> selectListStatusForMatching(StatusVo vo) throws Exception{
		return dao.list(NAMESPACE+"selectListStatusForMatching", vo);
	}
	
	
	/*가상 데이터 생성*/
	public int insertStatus(StatusVo tmpVo) {
		// TODO Auto-generated method stub
		return dao.insert(NAMESPACE+"insertStatus", tmpVo);
	}
}
