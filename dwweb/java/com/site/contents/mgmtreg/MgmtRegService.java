package com.site.contents.mgmtreg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.comm.util.StringUtil;
import com.core.comm.vo.UserVo;
import com.core.comm.web.CommonDao;

/**
 * 로그인 관리  SignalManagementService
 * <pre>
 * 사용자 관리 
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.01)
 */
@Transactional
@Service("mgmtRegService")
public class MgmtRegService {
	
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "com.site.contents.mgmtReg.MgmtReg.";
	
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 신호관리대장 리스트 전체 카운트 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectTotMgmtReg(MgmtRegVo vo) throws Exception{
		
		return (Integer)dao.select(NAMESPACE+"selectTotMgmtReg", vo);
		
	}
	
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 신호관리대장 리스트 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MgmtRegVo> selectListMgmtReg(MgmtRegVo vo) throws Exception{
		
		return dao.list(NAMESPACE+"selectListMgmtReg", vo);
		
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 신호관리대장 설치정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MgmtRegVo selectMgmtRegInstall(MgmtRegVo vo) throws Exception{
		return (MgmtRegVo) dao.select(NAMESPACE+"selectMgmtRegInstall", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 신호관리대장 공사일반 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MgmtRegVo selectMgmtRegConstruction(MgmtRegVo vo) throws Exception{
		return (MgmtRegVo) dao.select(NAMESPACE+"selectMgmtRegConstruction", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 신호관리대장 교통신호 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MgmtRegVo selectMgmtRegTrafficLight(MgmtRegVo vo) throws Exception{
		return (MgmtRegVo) dao.select(NAMESPACE+"selectMgmtRegTrafficLight", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 신호관리대장 신호등 지주 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MgmtRegVo selectMgmtRegPillar(MgmtRegVo vo) throws Exception{
		return (MgmtRegVo) dao.select(NAMESPACE+"selectMgmtRegPillar", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 신호관리대장 신호제어기 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MgmtRegVo selectMgmtRegController(MgmtRegVo vo) throws Exception{
		return (MgmtRegVo) dao.select(NAMESPACE+"selectMgmtRegController", vo);
	}


	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 설치 기본 등록
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertMgmtRegInstall(MgmtRegVo vo) throws Exception{
		return dao.insert(NAMESPACE+"insertMgmtRegInstall", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 공사일반 등록
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertMgmtRegConstruction(MgmtRegVo vo) throws Exception{
		return dao.insert(NAMESPACE+"insertMgmtRegConstruction", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 교통신호등 등록
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertMgmtRegTrafficLight(MgmtRegVo vo) throws Exception{
		return dao.insert(NAMESPACE+"insertMgmtRegTrafficLight", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 신호등지주 등록
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertMgmtRegPillar(MgmtRegVo vo) throws Exception{
		return dao.insert(NAMESPACE+"insertMgmtRegPillar", vo);
	}

	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 신호제어기 등록
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertMgmtRegController(HttpServletRequest request, MgmtRegVo vo) throws Exception{
		
		//현시시간초 데이터 처리
		this.makeMgmtRegCurrentTime(request, vo);
		
		//올레드 데이터 처리
		this.makeMgmtRegSignalAllRed(request, vo);
		
		//횡단보도 데이터 처리
		this.makeMgmtRegSignalCrossWalk(request, vo);
				
		/*System.out.println(">>>>>>>>>>>>> currentTime1 : " + vo.getCurrentTime1());
		System.out.println(">>>>>>>>>>>>> currentTime2 : " + vo.getCurrentTime2());
		System.out.println(">>>>>>>>>>>>> currentTime3 : " + vo.getCurrentTime3());
		System.out.println(">>>>>>>>>>>>> currentTime4 : " + vo.getCurrentTime4());
		System.out.println(">>>>>>>>>>>>> currentTime5 : " + vo.getCurrentTime5());
		System.out.println(">>>>>>>>>>>>> currentTime6 : " + vo.getCurrentTime6());
		System.out.println(">>>>>>>>>>>>> currentTime7 : " + vo.getCurrentTime7());
		
		System.out.println(">>>>>>>>>>>>> allred1 : " + vo.getSignalAllRed1());
		System.out.println(">>>>>>>>>>>>> allred2 : " + vo.getSignalAllRed2());
		System.out.println(">>>>>>>>>>>>> allred3 : " + vo.getSignalAllRed3());
		System.out.println(">>>>>>>>>>>>> allred4 : " + vo.getSignalAllRed4());
		System.out.println(">>>>>>>>>>>>> allred5 : " + vo.getSignalAllRed5());
		System.out.println(">>>>>>>>>>>>> allred6 : " + vo.getSignalAllRed6());
		
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk1 : " + vo.getSignalCrosswalk1());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk2 : " + vo.getSignalCrosswalk2());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk3 : " + vo.getSignalCrosswalk3());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk4 : " + vo.getSignalCrosswalk4());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk5 : " + vo.getSignalCrosswalk5());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk6 : " + vo.getSignalCrosswalk6());*/
		
		return dao.insert(NAMESPACE+"insertMgmtRegController", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 수정 : 설치정보 수정 실행
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateMgmtRegInstall(MgmtRegVo vo) throws Exception{
		return dao.update(NAMESPACE+"updateMgmtRegInstall", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 수정 : 공사일반 수정 실행
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateMgmtRegConstruction(MgmtRegVo vo) throws Exception{
		return dao.update(NAMESPACE+"updateMgmtRegConstruction", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 수정 : 교통신호등 수정 실행
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateMgmtRegTrafficLight(MgmtRegVo vo) throws Exception{
		return dao.update(NAMESPACE+"updateMgmtRegTrafficLight", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 수정 : 신호등 지주 수정 실행
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateMgmtRegPillar(MgmtRegVo vo) throws Exception{
		return dao.update(NAMESPACE+"updateMgmtRegPillar", vo);
	}	
	
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 수정 : 신호제어기 수정 실행
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateMgmtRegController(HttpServletRequest request, MgmtRegVo vo) throws Exception{
		
		//현시시간초 데이터 처리
		this.makeMgmtRegCurrentTime(request, vo);
		
		//올레드 데이터 처리
		this.makeMgmtRegSignalAllRed(request, vo);
		
		//횡단보도 데이터 처리
		this.makeMgmtRegSignalCrossWalk(request, vo);
				
		/*System.out.println(">>>>>>>>>>>>> currentTime1 : " + vo.getCurrentTime1());
		System.out.println(">>>>>>>>>>>>> currentTime2 : " + vo.getCurrentTime2());
		System.out.println(">>>>>>>>>>>>> currentTime3 : " + vo.getCurrentTime3());
		System.out.println(">>>>>>>>>>>>> currentTime4 : " + vo.getCurrentTime4());
		System.out.println(">>>>>>>>>>>>> currentTime5 : " + vo.getCurrentTime5());
		System.out.println(">>>>>>>>>>>>> currentTime6 : " + vo.getCurrentTime6());
		System.out.println(">>>>>>>>>>>>> currentTime7 : " + vo.getCurrentTime7());
		
		System.out.println(">>>>>>>>>>>>> allred1 : " + vo.getSignalAllRed1());
		System.out.println(">>>>>>>>>>>>> allred2 : " + vo.getSignalAllRed2());
		System.out.println(">>>>>>>>>>>>> allred3 : " + vo.getSignalAllRed3());
		System.out.println(">>>>>>>>>>>>> allred4 : " + vo.getSignalAllRed4());
		System.out.println(">>>>>>>>>>>>> allred5 : " + vo.getSignalAllRed5());
		System.out.println(">>>>>>>>>>>>> allred6 : " + vo.getSignalAllRed6());
		
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk1 : " + vo.getSignalCrosswalk1());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk2 : " + vo.getSignalCrosswalk2());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk3 : " + vo.getSignalCrosswalk3());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk4 : " + vo.getSignalCrosswalk4());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk5 : " + vo.getSignalCrosswalk5());
		System.out.println(">>>>>>>>>>>>> getSignalCrosswalk6 : " + vo.getSignalCrosswalk6());*/
		
		return dao.update(NAMESPACE+"updateMgmtRegController", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 삭제 처리
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteMgmtRegAct(MgmtRegVo vo) throws Exception{
		return dao.update(NAMESPACE+"deleteMgmtRegAct", vo);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 신호제어기 : 현시 시간초 생성
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void makeMgmtRegCurrentTime(HttpServletRequest request, MgmtRegVo vo) throws Exception{
		
		String currentTime1 = "";
		String currentTime2 = "";
		String currentTime3 = "";
		String currentTime4 = "";
		String currentTime5 = "";
		String currentTime6 = "";
		String currentTime7 = "";
		
		for (int i = 1; i < 7; i++) {
			
			if(i>1) {
				currentTime1 += ",";
				currentTime2 += ",";
				currentTime3 += ",";
				currentTime4 += ",";
				currentTime5 += ",";
				currentTime6 += ",";
				currentTime7 += ",";
			}
			
			currentTime1 += StringUtil.nullToCustom(request.getParameter("currentTime1"+i),"||");
			currentTime2 += StringUtil.nullToCustom(request.getParameter("currentTime2"+i),"||");
			currentTime3 += StringUtil.nullToCustom(request.getParameter("currentTime3"+i),"||");
			currentTime4 += StringUtil.nullToCustom(request.getParameter("currentTime4"+i),"||");
			currentTime5 += StringUtil.nullToCustom(request.getParameter("currentTime5"+i),"||");
			currentTime6 += StringUtil.nullToCustom(request.getParameter("currentTime6"+i),"||");
			currentTime7 += StringUtil.nullToCustom(request.getParameter("currentTime7"+i),"||");
	
		}
		
		vo.setCurrentTime1(currentTime1);
		vo.setCurrentTime2(currentTime2);
		vo.setCurrentTime3(currentTime3);
		vo.setCurrentTime4(currentTime4);
		vo.setCurrentTime5(currentTime5);
		vo.setCurrentTime6(currentTime6);
		vo.setCurrentTime7(currentTime7);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 신호제어기 : 올래드 생성
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void makeMgmtRegSignalAllRed(HttpServletRequest request, MgmtRegVo vo) throws Exception{

		String signalAllRed1 = "";
		String signalAllRed2 = "";
		String signalAllRed3 = "";
		String signalAllRed4 = "";
		String signalAllRed5 = "";
		String signalAllRed6 = "";
		
		for (int i = 1; i < 3; i++) {
			if(i>1) {
				signalAllRed1 += ",";
				signalAllRed2 += ",";
				signalAllRed3 += ",";
				signalAllRed4 += ",";
				signalAllRed5 += ",";
				signalAllRed6 += ",";
			}
			
			signalAllRed1 += StringUtil.nullToCustom(request.getParameter("signalAllRed1"+i),"||");
			signalAllRed2 += StringUtil.nullToCustom(request.getParameter("signalAllRed2"+i),"||");
			signalAllRed3 += StringUtil.nullToCustom(request.getParameter("signalAllRed3"+i),"||");
			signalAllRed4 += StringUtil.nullToCustom(request.getParameter("signalAllRed4"+i),"||");
			signalAllRed5 += StringUtil.nullToCustom(request.getParameter("signalAllRed5"+i),"||");
			signalAllRed6 += StringUtil.nullToCustom(request.getParameter("signalAllRed6"+i),"||");
		}
		
		
		vo.setSignalAllRed1(signalAllRed1);
		vo.setSignalAllRed2(signalAllRed2);
		vo.setSignalAllRed3(signalAllRed3);
		vo.setSignalAllRed4(signalAllRed4);
		vo.setSignalAllRed5(signalAllRed5);
		vo.setSignalAllRed6(signalAllRed6);
	}
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.16
	 * @description 신호관리대장 신호제어기 : 횡단보도 생성
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void makeMgmtRegSignalCrossWalk(HttpServletRequest request, MgmtRegVo vo) throws Exception{
		
		String signalCrosswalk1 = "";
		String signalCrosswalk2 = "";
		String signalCrosswalk3 = "";
		String signalCrosswalk4 = "";
		String signalCrosswalk5 = "";
		String signalCrosswalk6 = "";
		
		for (int i = 1; i < 3; i++) {
			if(i>1) {
				signalCrosswalk1 += ",";
				signalCrosswalk2 += ",";
				signalCrosswalk3 += ",";
				signalCrosswalk4 += ",";
				signalCrosswalk5 += ",";
				signalCrosswalk6 += ",";
			}
			
			signalCrosswalk1 += StringUtil.nullToCustom(request.getParameter("signalCrosswalk1"+i),"||");
			signalCrosswalk2 += StringUtil.nullToCustom(request.getParameter("signalCrosswalk2"+i),"||");
			signalCrosswalk3 += StringUtil.nullToCustom(request.getParameter("signalCrosswalk3"+i),"||");
			signalCrosswalk4 += StringUtil.nullToCustom(request.getParameter("signalCrosswalk4"+i),"||");
			signalCrosswalk5 += StringUtil.nullToCustom(request.getParameter("signalCrosswalk5"+i),"||");
			signalCrosswalk6 += StringUtil.nullToCustom(request.getParameter("signalCrosswalk6"+i),"||");
		}
		
		vo.setSignalCrosswalk1(signalCrosswalk1);
		vo.setSignalCrosswalk2(signalCrosswalk2);
		vo.setSignalCrosswalk3(signalCrosswalk3);
		vo.setSignalCrosswalk4(signalCrosswalk4);
		vo.setSignalCrosswalk5(signalCrosswalk5);
		vo.setSignalCrosswalk6(signalCrosswalk6);
	}

}




