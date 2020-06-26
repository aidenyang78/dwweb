package com.site.contents.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.SessionUtil;
import com.core.comm.util.WebUtil;
import com.core.comm.vo.UserVo;

/**
 * @Class Name : LoginController
 * @Description : LoginController Class
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
public class LoginController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "loginService")
	protected LoginService loginService;
	
	
	/**
	 * 사용자 로그인
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/login/login.do")
	public String login(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		HttpSession session = request.getSession();
		
		return "/site/www/contents/login/user_login";
	}
	

	/**
	 * 사용자 로그인 처리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login/loginAct.do")
	public String loginAct(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		UserVo rtnVo = loginService.selectUserLogin(userVo);
		
		if(rtnVo != null) {
			
			//계정 기간이 만료 되었을 경우
			if("Y".equals(rtnVo.getExpiredYn())){
				WebUtil.ajaxPrintMsg(response, "계정의 유효기간이 만료 되었습니다.\\n시스템 관리자에 문의해 주세요. ", "B","");
				return null;
			}
			
			//정산 계정 세션에 정보 등록
			/*System.out.println(">>>>>>>>>>>>> seq : " + rtnVo.getSeq());
			System.out.println(">>>>>>>>>>>>> group_code : " + rtnVo.getGroupCode());
			System.out.println(">>>>>>>>>>>>> name : " + rtnVo.getName());
			System.out.println(">>>>>>>>>>>>> user_id : " + rtnVo.getUserId());*/
			
			SessionUtil.setSession(request, rtnVo);
			
			return "redirect:/main/main.do?menuSeq=1001";
			
		}else {
			WebUtil.ajaxPrintMsg(response, "입력하신 정보가 올바르지 않습니다.", "B","");
			return null;
		}
		
	}//end loginAct
	
	
	/**
	 * 사용자 로그아웃 처리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout/logout.do")
	public String logout(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		request.getSession().invalidate();
		
		return "redirect:/login/login.do";
		
	}
	
}



