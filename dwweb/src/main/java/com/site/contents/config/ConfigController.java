package com.site.contents.config;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.common.CommonService;
import com.core.comm.util.EgovDateUtil;
import com.core.comm.util.EgovStringUtil;
import com.core.comm.util.PageingUtil;
import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.SessionUtil;
import com.core.comm.util.StringUtil;
import com.core.comm.util.WebUtil;
import com.core.comm.vo.GroupVo;
import com.core.comm.vo.UserVo;
import com.site.contents.login.LoginService;

/**
 * @Class Name : ConfigController
 * @Description : ConfigController Class
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
public class ConfigController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "loginService")
	protected LoginService loginService;
	
	@Resource(name = "configService")
	protected ConfigService configService;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	@Autowired
	protected ServletContext servletContext;
	
	/**
	 * 사용자 관리 페이지 접근 권한 체크
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */	
	public String adminAuthCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String mapEditAuth = "";
		String userModifyAuth = "";
		
		mapEditAuth = SessionUtil.getObjectSession(request, "MAP_EDIT").toString();
		userModifyAuth = SessionUtil.getObjectSession(request, "USER_MODIFY").toString();
		
		//사용자 수정 권한이 있는지 체크
		if(!"".equals(userModifyAuth) && "1".equals(userModifyAuth)) {
			return "true"; 
		}else {
			WebUtil.ajaxPrintMsg(response, "접근 권한이 없습니다.", "B", "");
			return null;
		}
	}
	
	/**
	 * 아이디 중복체크(아이디 유효성체크)
	 * @param vo
	 * @return jsonView
	 * @exception Exception
	 */
	@RequestMapping(value = "/config/userIdCheckJs.do")
	public String userIdCheckJs(@ModelAttribute("userVo") UserVo userVo,
			HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		userVo.setUserId(userVo.getUserId().replaceAll(" ", ""));
		
		int userIdCheck = configService.selectMembIdCnt(userVo);
		
		model.addAttribute("userIdCheck", userIdCheck);
		
		return "jsonView";
	}
	
	/**
	 * 설정메뉴 권한 체크
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/config.do")
	public String authDivision(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		String menuSeq = request.getParameter("menuSeq");
		String mapEditAuth = "";
		String userModifyAuth = "";
		
		mapEditAuth = SessionUtil.getObjectSession(request, "MAP_EDIT").toString();
		userModifyAuth = SessionUtil.getObjectSession(request, "USER_MODIFY").toString();
		
		model.addAttribute("menuSeq", menuSeq);
		
		//사용자 수정이 가능한 권한
		if(!"".equals(userModifyAuth) && "1".equals(userModifyAuth)) {
			return "redirect:/config/listUser.do";
		}else {
			return "redirect:/config/updateMyInfo.do";
		}
	}
	
	/**
	 * 설정메뉴
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/listUser.do")
	public String listUser(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		//권한 체크 
		this.adminAuthCheck(request, response);
	
		try {		
			
				//검색용 그룹 코드 셋팅
		        List<GroupVo> listGroup = commonService.selectGroupList();
				model.addAttribute("listGroup", listGroup);
			
				/**********************
				 * 페이징정보를 지정한다.
				 **********************/
				int pageLimit = propertyUtil.getInt("PAGELIMIT_10");
				int pageBlock = propertyUtil.getInt("PAGEBLOCK_10");
		
				int pageNo = 1;
		
				if ("".equals(StringUtil.nullToBlank(userVo.getPageNo()))) {
					userVo.setPageNo("1");
				}
		
				pageNo = Integer.parseInt(userVo.getPageNo());
		
				int sRowNum = ((pageNo - 1) * pageLimit) + 1; // 시작
				int eRowNum = pageNo * pageLimit; // 종료
				int totCnt = 0;
		
				userVo.setLimitStart(sRowNum - 1);
				userVo.setLimitEnd(pageLimit);
				userVo.setsRowNum(String.valueOf(sRowNum));
				userVo.seteRowNum(String.valueOf(eRowNum));
				userVo.setPageBlock(String.valueOf(pageBlock));
				userVo.setPageLimit(String.valueOf(pageLimit));
				/**********************
				 * 페이징정보를 지정한다.
				 **********************/
				userVo.setGroupCode(StringUtil.nullToBlank(request.getParameter("sGroupCode")));
				
				System.out.println(">>>>>>>>>>>>> keyKind : " + userVo.getKeyKind());
				System.out.println(">>>>>>>>>>>>> keyWord : " + userVo.getKeyWord());
								
				List<UserVo> listUser = configService.selectListUser(userVo);
				
				model.addAttribute("listUser", listUser);
				
				// 목록에서 전체 갯수를 가져온다.
				if (listUser != null && listUser.size() > 0) {
					totCnt = configService.selectTotUsers(userVo);
				}
				
				
				/*System.out.println(">>>>>>>>>>>>>>>>>> context : " + servletContext.getContextPath() );
				System.out.println(">>>>>>>>>>>>>>>>>> totCnt : " + totCnt );
				System.out.println(">>>>>>>>>>>>>>>>>> pageLimit : " + pageLimit );
				System.out.println(">>>>>>>>>>>>>>>>>> pageBlock : " + pageBlock );
				System.out.println(">>>>>>>>>>>>>>>>>> pageNo : " + pageNo );*/
				
				//페이징
				userVo.setTotCnt(String.valueOf(totCnt));
				StringBuffer pageing = PageingUtil.pageing(servletContext.getContextPath(), totCnt, pageLimit, pageBlock, pageNo);
		
				model.addAttribute("pageing", pageing);
				
				//넘버링
				int cntNo = NumberUtils.toInt(userVo.getTotCnt()) - (pageLimit * (pageNo - 1));
				
				model.addAttribute("cntNo", cntNo);
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/site/www/contents/config/user_list";
	}
	

	/**
	 * 사용자등록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/insertUser.do")
	public String insertUser(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		//권한 체크 
		this.adminAuthCheck(request, response);
		
		//계정만료 년도 설정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance();
        String strToday = sdf.format(cal.getTime());
        
        String nextYearDate = EgovDateUtil.addYear(strToday,1);
        String nextYear = nextYearDate.substring(0, 4);
        String nextMonth = nextYearDate.substring(4, 6);
        String nextDay = nextYearDate.substring(6, 8);
        
        String strEndYear = EgovStringUtil.cutString(EgovDateUtil.addYear(strToday, 5),4);
        
                
        model.addAttribute("nextYear", nextYear);
        model.addAttribute("nextMonth", nextMonth);
        model.addAttribute("nextDay", nextDay);
        model.addAttribute("strEndYear", strEndYear);
        
        //그룹코드 반환
        List<GroupVo> listGroup = commonService.selectGroupList();
		model.addAttribute("listGroup", listGroup);
				
		return "/site/www/contents/config/user_insert";
	}
	
	/**
	 * 사용자등록 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/insertUserAct.do")
	public String insertUserAct(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		//권한 체크 
		this.adminAuthCheck(request, response);
		
		String menuSeq = StringUtil.nullToBlank(request.getParameter("menuSeq"));
		
		//등록/삭제 관리자 id
		userVo.setRegUserId(StringUtil.nullToBlank(SessionUtil.getObjectSession(request, "USER_ID").toString()));

		//만료일자 처리
		String validateDate = "";
		String validateDateYear = StringUtil.nullToBlank(request.getParameter("validateDateYear"));
		String validateDateMonth = StringUtil.nullToBlank(request.getParameter("validateDateMonth"));
		String validateDateDay = StringUtil.nullToBlank(request.getParameter("validateDateDay"));
		
		validateDate = validateDateYear + validateDateMonth + validateDateDay;		
		userVo.setValidateDate(validateDate);
		
		try {
			//사용자 등록 실행
			/*String userId = userVo.getUserId();
			String name = userVo.getName();
			
			for(int i=1;i<215;i++) {

				userVo.setUserId(userId + i);
				userVo.setName(name + i);*/
				
				int result = configService.insertUserAct(userVo);
			//}
			
			if(result < 1) {
				
				WebUtil.ajaxPrintMsg(response, "사용자 등록 중 오류가 발생 했습니다.", "B", "");
				return null;
			}else {
				WebUtil.ajaxPrintMsg(response, "등록 되었습니다.", "L", request.getContextPath()+"/config/listUser.do?menuSeq="+menuSeq);
				return null;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	/**
	 * 사용자 삭제 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/deleteUserAct.do")
	public String deleteUserAct(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		//권한 체크 
		this.adminAuthCheck(request, response);
		
		String menuSeq = StringUtil.nullToBlank(request.getParameter("menuSeq"));
		
		//삭제 관리자 기록
		String delUserId = SessionUtil.getSession(request, "USER_ID");
		userVo.setDelUserId(delUserId);
		
		try {
			
			//삭제 실행
			int result = configService.deleteUserAct(userVo);
			
			if(result < 1) {
				WebUtil.ajaxPrintMsg(response, "사용자 삭제 중 오류가 발생 했습니다.", "B", "");
				return null;
			}else {
				WebUtil.ajaxPrintMsg(response, "삭제 되었습니다.", "L", request.getContextPath()+"/config/listUser.do?menuSeq="+menuSeq);
				return null;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	/**
	 * 사용자 수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/updateUser.do")
	public String updateUser(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		//권한 체크 
		this.adminAuthCheck(request, response);
		
		try {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	        String strToday = sdf.format(cal.getTime());
	        
	        String strEndYear = "";
	        strEndYear = EgovStringUtil.cutString(EgovDateUtil.addYear(strToday, 5),4);
	        
	        model.addAttribute("strEndYear", strEndYear);
			
			//그룹코드 조회
			List<GroupVo> listGroup = commonService.selectGroupList();
			model.addAttribute("listGroup", listGroup);
			
			//사용자 정보 로드
			UserVo rtnVo = configService.selectUserInfo(userVo);
			model.addAttribute("userVo", rtnVo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/site/www/contents/config/user_update";
	}
	
	/**
	 * 사용자 수정 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/updateUserAct.do")
	public String updateUserAct(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		//권한 체크 
		this.adminAuthCheck(request, response);
		
		try {
			
			String searchGroupCode = StringUtil.nullToBlank(request.getParameter("sGroupCode"));

			//만료일자 처리
			String validateDate = "";
			String validateDateYear = StringUtil.nullToBlank(request.getParameter("validateDateYear"));
			String validateDateMonth = StringUtil.nullToBlank(request.getParameter("validateDateMonth"));
			String validateDateDay = StringUtil.nullToBlank(request.getParameter("validateDateDay"));
			
			validateDate = validateDateYear + validateDateMonth + validateDateDay;		
			userVo.setValidateDate(validateDate);
			
			
			
			int result = configService.updateUserAct(userVo);
			
			if(result <1) {
				WebUtil.ajaxPrintMsg(response, "처리 중 오류가 발생 했습니다.", "B", "");
				return null;
			}else {
				//parameters
				String param = "";
				param = "?menuSeq="+userVo.getMenuSeq()+"&pageNo="+userVo.getPageNo()+"&keyKind="+userVo.getKeyKind()+"&keyWord="+userVo.getKeyWord()+"&sGroupCode="+searchGroupCode;
				
				WebUtil.ajaxPrintMsg(response, "수정 완료 되었습니다.", "L", request.getContextPath()+"/config/listUser.do"+param);
				return null;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 내정보 수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/updateMyInfo.do")
	public String updateMyInfo(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		try {
			
			//내정보 셋팅
			userVo.setUserId(SessionUtil.getSession(request, "USER_ID").toString());
			userVo.setSeq(SessionUtil.getSession(request, "SEQ"));
			
			//사용자 정보 로드
			UserVo rtnVo = configService.selectUserInfo(userVo);
			model.addAttribute("userVo", rtnVo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/site/www/contents/config/my_info_update";
	}
	
	/**
	 * 내정보 수정 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/config/updateMyInfoAct.do")
	public String updateMyInfoAct(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {		
		try {			
			
			//내정보 셋팅
			userVo.setUserId(SessionUtil.getSession(request, "USER_ID").toString());
			userVo.setSeq(SessionUtil.getSession(request, "SEQ"));
			
			int result = configService.updateUserAct(userVo);
			
			if(result <1) {
				WebUtil.ajaxPrintMsg(response, "처리 중 오류가 발생 했습니다.", "B", "");
				return null;
			}else {
				
				WebUtil.ajaxPrintMsg(response, "수정 완료 되었습니다.", "L", request.getContextPath()+"/config/updateMyInfo.do?menuSeq="+userVo.getMenuSeq());
				return null;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
/*#######################################################################################################################*/
}
