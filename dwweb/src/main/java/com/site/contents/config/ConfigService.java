package com.site.contents.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.comm.vo.UserVo;
import com.core.comm.web.AbstractService;
import com.core.comm.web.CommonDao;

/**
 * 로그인 관리  ManagementService
 * <pre>
 * 사용자 관리 
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.01)
 */

@Service("configService")
public class ConfigService extends AbstractService{
	
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "com.site.contents.config.Config.";

	/**
	 * 아이디 중복체크(개수)
	 * @param UserVo vo : 조회 조건
	 * @return integer : 조회 결과 갯수
	 * @exception Exception
	 */
	public int selectMembIdCnt(UserVo vo) throws Exception {
		
		return (Integer)dao.select( NAMESPACE+"selectMembIdCnt", vo);
	}
	
	/**
	 * 그룹코드 조회
	 * @param UserVo vo : 조회 조건
	 * @return integer : 조회 결과 갯수
	 * @exception Exception
	 */
	public String selectGroupCode(UserVo vo) throws Exception {
		
		return (String)dao.select( NAMESPACE+"selectGroupCode", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.05
	 * @description 사용자 총 건수 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectTotUsers(UserVo vo) throws Exception {
		return (int) dao.select(NAMESPACE+"selectTotUsers", vo);
	}

	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.04
	 * @description 사용자 리스트 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<UserVo> selectListUser(UserVo vo) throws Exception{
		
		return dao.list(NAMESPACE+"selectListUser", vo);
		
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.04
	 * @description 사용자 등록
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertUserAct(UserVo vo) throws Exception{
		return dao.insert(NAMESPACE+"insertUser", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.06.04
	 * @description 사용자 삭제
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteUserAct(UserVo vo) throws Exception{
		return dao.insert(NAMESPACE+"deleteUserAct", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.05
	 * @description 사용자 정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public UserVo selectUserInfo(UserVo vo) throws Exception{
		
		/*UserVo rtnVo = new UserVo();
		
		Object objTemp = dao.select(NAMESPACE+"selectUserInfo", vo);
		
		if(objTemp != null) {
			rtnVo = (UserVo)objTemp;
		}
		return rtnVo;*/
		
		return (UserVo) dao.select(NAMESPACE+"selectUserInfo", vo);
	}

	public int updateUserAct(UserVo vo) throws Exception{

		return dao.update(NAMESPACE+"updateUserAct", vo);
	}
	
	

}
