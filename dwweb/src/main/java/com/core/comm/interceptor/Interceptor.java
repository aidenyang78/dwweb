package com.core.comm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.core.comm.annotation.LoginCheck;
import com.core.comm.util.SessionUtil;
import com.core.comm.util.StringUtil;
import com.core.comm.util.WebUtil;

/**  
 * @Class Name : Interceptor.java
 * @Description : Interceptor Class
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2020.06.01           최초생성
 * 
 * @author 양성진
 * @since 2020.06.01
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by MOPAS All right reserved.
 */

public class Interceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(this.getClass());

	/*@Resource(name = "logService")
	private LogService logService;
	 */

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		LoginCheck loginCheck = ((HandlerMethod) handler).getMethodAnnotation(LoginCheck.class);
		
		try{
			//jsessionId 체크
			HttpSession session = request.getSession();
			
			String conJsessionId = request.getSession().getId().toString();
			String conIp = request.getRemoteAddr().toString();
			String conAgent = request.getHeader("User-Agent").toString();
			
			
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>> preHandle : " + conIp);
			
			/*if(session.getAttribute("userJsessionId") != null){
				String userJsessionId = session.getAttribute("userJsessionId").toString(); 
				String userIp =  session.getAttribute("userIp").toString();
				String userAgent =  session.getAttribute("userAgent").toString();
			
				if(!userJsessionId.equals(conJsessionId) || !userIp.equals(conIp)){
					
					
					log.debug("###################################################################");
					log.debug("###################################################################");
					log.debug("#####################     not match    ############################");
					log.debug("###################################################################");
					log.debug("###################################################################");
					log.debug("conJsessionId : " + conJsessionId);
					log.debug("userJsessionId : " + userJsessionId);
					log.debug("conIp : " + conIp);
					log.debug("userIp : " + userIp);
					log.debug("conAgent : " + conAgent);
					log.debug("userAgent : " + userAgent);
					
					WebUtil.ajaxPrintMsg(response, "정상적인 접근이 아닙니다.", "L","/common/site/www/front/error/error.jsp");
					return false;
					
				}else{
					
					log.debug("###################################################################");
					log.debug("###################################################################");
					log.debug("#######################     match    ##############################");
					log.debug("###################################################################");
					log.debug("###################################################################");
					log.debug("conJsessionId : " + conJsessionId);
					log.debug("userJsessionId : " + userJsessionId);
				}
			}*/
		}catch(Exception e){
			//e.printStackTrace();
		}
		
		//로그인 체크
		//로그인이 필요한 method에서 @LoginCheck를 사용한다.
		if(loginCheck != null) {
			if(StringUtil.isEmpty(SessionUtil.getSession(request, "SEQ"))) {
				
				if(StringUtil.isEmpty(loginCheck.value())) {
					SessionUtil.setSession(request, "return_url", request.getRequestURI()+"?"+request.getQueryString());						
				}
				else {
					SessionUtil.setSession(request, "return_url", loginCheck.value()+"?"+request.getQueryString());
				}
				
				WebUtil.ajaxPrintMsg(response, "로그인후 사용가능합니다.", "L",request.getContextPath()+"/login/login.do");

				return false;
				
			}
		}

		return true;
	}

	/**
	 * 컨트롤러가 요청을 실행한 후 처리, view(jsp)로 forward되기 전에 리턴값 : void 컨트롤러 실행도중 예외 발생인
	 * 경우 postHandle()는 실행되지 않음
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object controller, ModelAndView modelAndView) throws Exception {
		
		
		/*//////////////////////
		 * //접속로그를 저장 
		 */////////////////////
		
	}

	/**
	 * 클라이언트의 요청을 처리한 뒤에 실행 리턴값 : void 컨트롤러 처리 도중이나 view 생성과정 중에 예외가 발생하더라도
	 * afterCompletion()은 실행됨
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {		

	}

}
