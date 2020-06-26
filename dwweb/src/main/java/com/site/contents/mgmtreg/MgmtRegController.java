package com.site.contents.mgmtreg;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.annotation.LoginCheck;
import com.core.comm.common.CommonService;
import com.core.comm.util.PageingUtil;
import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.SessionUtil;
import com.core.comm.util.StringUtil;

/**
 * @Class Name : SignalManagementController
 * @Description : SignalManagementController Class
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2020.06.01 최초생성
 *
 * @author 양성진
 * @since 2020.06.01
 * @version 1.0
 * @see
 *
 */

@Controller
public class MgmtRegController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	@Resource(name = "mgmtRegService")
	protected MgmtRegService mgmtRegService;
	
	@Resource(name = "txManager")
	protected DataSourceTransactionManager txManager;

	
	@Autowired
	protected ServletContext servletContext;
	
	
	protected String polNm = propertyUtil.getString("POL_NAME");
	protected String polCd = propertyUtil.getString("POL_CODE");

	/**
	 * 신호관리대장 목록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@LoginCheck("/login/login.do")
	@RequestMapping("/mgmtreg/listMgmtReg.do")
	public String listMngReg(@ModelAttribute MgmtRegVo mgmtRegVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			/**********************
			 * 페이징정보를 지정한다.
			 **********************/
			int pageLimit = propertyUtil.getInt("PAGELIMIT_10");
			int pageBlock = propertyUtil.getInt("PAGEBLOCK_10");
	
			int pageNo = 1;
	
			if ("".equals(StringUtil.nullToBlank(mgmtRegVo.getPageNo()))) {
				mgmtRegVo.setPageNo("1");
			}
	
			pageNo = Integer.parseInt(mgmtRegVo.getPageNo());
	
			int sRowNum = ((pageNo - 1) * pageLimit) + 1; // 시작
			int eRowNum = pageNo * pageLimit; // 종료
			int totCnt = 0;
	
			mgmtRegVo.setLimitStart(sRowNum - 1);
			mgmtRegVo.setLimitEnd(pageLimit);
			mgmtRegVo.setsRowNum(String.valueOf(sRowNum));
			mgmtRegVo.seteRowNum(String.valueOf(eRowNum));
			mgmtRegVo.setPageBlock(String.valueOf(pageBlock));
			mgmtRegVo.setPageLimit(String.valueOf(pageLimit));
			/**********************
			 * 페이징정보를 지정한다.
			 **********************/
			
			System.out.println(">>>>>>>>>>>>> keyKind : " + mgmtRegVo.getKeyKind());
			System.out.println(">>>>>>>>>>>>> keyWord : " + mgmtRegVo.getKeyWord());
							
			List<MgmtRegVo> listmgmt = mgmtRegService.selectListMgmtReg(mgmtRegVo);
			
			model.addAttribute("listmgmt", listmgmt);
			
			// 목록에서 전체 갯수를 가져온다.
			if (listmgmt != null && listmgmt.size() > 0) {
				totCnt = mgmtRegService.selectTotMgmtReg(mgmtRegVo);
			}
			
			model.addAttribute("totCnt",totCnt);
			
			//페이징
			mgmtRegVo.setTotCnt(String.valueOf(totCnt));
			StringBuffer pageing = PageingUtil.pageing(servletContext.getContextPath(), totCnt, pageLimit, pageBlock, pageNo);
	
			model.addAttribute("pageing", pageing);
			
			//넘버링
			int cntNo = NumberUtils.toInt(mgmtRegVo.getTotCnt()) - (pageLimit * (pageNo - 1));
			
			model.addAttribute("cntNo", cntNo);
			
	}catch(Exception e) {
		e.printStackTrace();
	}
		
		return "/site/www/contents/mgmtreg/mgmt_reg_list";
		
	}
	
	/**
	 * 신호관리대장 등록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */	
	@LoginCheck("/login/login.do")
	@RequestMapping("/mgmtreg/insertMgmtReg.do")
	public String insertMngReg(@ModelAttribute MgmtRegVo mgmtRegVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("polCd", polCd);
		model.addAttribute("polNm", polNm);
		
		return "/site/www/contents/mgmtreg/mgmt_reg_insert"; 
	}
	
	/**
	 * 신호관리대장 등록 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */	
	@LoginCheck("/login/login.do")
	@RequestMapping("/mgmtreg/insertMgmtRegAct.do")
	public String insertMgmtRegAct(@ModelAttribute MgmtRegVo mgmtRegVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus txStatus = txManager.getTransaction(def);

		try {
			//등록 자 기록
			mgmtRegVo.setRegUserid(SessionUtil.getSession(request, "USER_ID").toString());
			
			//설치 기본
			int result1 = mgmtRegService.insertMgmtRegInstall(mgmtRegVo);
			
			//공사일반
			int result2 = mgmtRegService.insertMgmtRegConstruction(mgmtRegVo);
			
			//교통신호등
			int result3 = mgmtRegService.insertMgmtRegTrafficLight(mgmtRegVo);
			
			//신호등 지주
			int result4 = mgmtRegService.insertMgmtRegPillar(mgmtRegVo);
			
			//신호 제어기
			int result5 = mgmtRegService.insertMgmtRegController(request, mgmtRegVo);
			
			
			if (result1 < 1 || result2 < 1 || result3 < 1 || result4 < 1 || result5 < 1) {
				model.addAttribute("rtnCd", "9999");
				txManager.rollback(txStatus);	
			}else {
				model.addAttribute("rtnCd", "1000");
				txManager.commit(txStatus);	
			}
			
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			txManager.rollback(txStatus);
			e.printStackTrace();
		}

		return "/site/www/contents/mgmtreg/mgmt_reg_proc"; 
	}
	
	/**
	 * 신호관리대장 수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */	
	@LoginCheck("/login/login.do")
	@RequestMapping("/mgmtreg/updateMgmtReg.do")
	public String updateMgmtReg(@ModelAttribute MgmtRegVo mgmtRegVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			
			//설치정보
			MgmtRegVo listInst = mgmtRegService.selectMgmtRegInstall(mgmtRegVo);
			model.addAttribute("listInst", listInst);
			
			//공사일반
			MgmtRegVo listConst = mgmtRegService.selectMgmtRegConstruction(mgmtRegVo);
			model.addAttribute("listConst", listConst);
			
			//교통신호
			MgmtRegVo listTf = mgmtRegService.selectMgmtRegTrafficLight(mgmtRegVo);
			model.addAttribute("listTf", listTf);
			
			//신호등지주
			MgmtRegVo listPl = mgmtRegService.selectMgmtRegPillar(mgmtRegVo);
			model.addAttribute("listPl", listPl);
			
			//신호제어기
			MgmtRegVo listCtrl = mgmtRegService.selectMgmtRegController(mgmtRegVo);
			model.addAttribute("listCtrl", listCtrl);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/site/www/contents/mgmtreg/mgmt_reg_update"; 
	}
	
	/**
	 * 신호관리대장 등록 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */	
	@LoginCheck("/login/login.do")
	@RequestMapping("/mgmtreg/updateMgmtRegAct.do")
	public String updateMgmtRegAct(@ModelAttribute MgmtRegVo mgmtRegVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus txStatus = txManager.getTransaction(def);

		try {
			//등록 자 기록
			mgmtRegVo.setUpdtUserid(SessionUtil.getSession(request, "USER_ID").toString());
			
			//설치 기본
			int result1 = mgmtRegService.updateMgmtRegInstall(mgmtRegVo);
			
			//공사일반
			int result2 = mgmtRegService.updateMgmtRegConstruction(mgmtRegVo);
			
			//교통신호등
			int result3 = mgmtRegService.updateMgmtRegTrafficLight(mgmtRegVo);
			
			//신호등 지주
			int result4 = mgmtRegService.updateMgmtRegPillar(mgmtRegVo);
			
			//신호 제어기
			int result5 = mgmtRegService.updateMgmtRegController(request, mgmtRegVo);
			
			
			if (result1 < 1 || result2 < 1 || result3 < 1 || result4 < 1 || result5 < 1) {
				model.addAttribute("rtnCd", "9999");
				txManager.rollback(txStatus);	
			}else {
				model.addAttribute("rtnCd", "2000");
				txManager.commit(txStatus);	
			}
			
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			txManager.rollback(txStatus);
			e.printStackTrace();
		}

		return "/site/www/contents/mgmtreg/mgmt_reg_proc"; 
	}	
	
	/**
	 * 신호관리대장  삭제
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */	
	@LoginCheck("/login/login.do")
	@RequestMapping("/mgmtreg/deleteMgmtRegAct.do")
	public String deleteMgmtRegAct(@ModelAttribute MgmtRegVo mgmtRegVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			
			mgmtRegVo.setDelUserid(SessionUtil.getSession(request, "USER_ID").toString());
			
			int result = mgmtRegService.deleteMgmtRegAct(mgmtRegVo);
			
			if(result < 1) {
				model.addAttribute("rtnCd", "9999");
			}else {
				model.addAttribute("rtnCd", "3000");
			}
			
		}catch(Exception e){
			model.addAttribute("rtnCd", "9999");
			e.printStackTrace();
		}
		
		return "/site/www/contents/mgmtreg/mgmt_reg_proc"; 
	}
}
