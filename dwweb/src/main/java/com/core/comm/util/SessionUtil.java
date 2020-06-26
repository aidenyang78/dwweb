/**
 * 
 */
package com.core.comm.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.core.comm.vo.UserVo;

/**
 * @Class Name : SessionUtil
 * @Description : SessionUtil Class
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
 */

public class SessionUtil {

	/**
	 * 관리자 로그인 여부 체크
	 * @param request
	 * @return
	 */
	public static boolean isAdmin(HttpServletRequest request) throws Exception {
		
		UserVo userVo = getSession(request);

		if ("1".equals(userVo.getGroupCode())) {
			return true;
		}

		return false;
	}

	/**
	 * 세션 조회
	 * @param request
	 * @param userVo
	 * @throws Exception
	 */
	public static UserVo getSession(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		if(session == null) return null;
		
		UserVo userVo = new UserVo();
		
		//UserVo
		userVo.setSeq(StringUtil.nullToBlank(session.getAttribute("SEQ")));
		userVo.setGroupCode(StringUtil.nullToBlank(session.getAttribute("GROUP_CODE")));
		userVo.setName(StringUtil.nullToBlank(session.getAttribute("NAME")));
		userVo.setUserId(StringUtil.nullToBlank(session.getAttribute("USER_ID")));
		userVo.setUserPwd(StringUtil.nullToBlank(session.getAttribute("USER_PWD")));
		userVo.setRegDate(StringUtil.nullToBlank(session.getAttribute("REG_DATE")));
		userVo.setValidateDate(StringUtil.nullToBlank(session.getAttribute("VALIDATE_DATE")));
		userVo.setRegDesc(StringUtil.nullToBlank(session.getAttribute("REG_DESC")));
		
		//AuthVo
		userVo.setMapEdit(StringUtil.nullToBlank(session.getAttribute("MAP_EDIT")));
		userVo.setUserModify(StringUtil.nullToBlank(session.getAttribute("USER_MODIFY")));
		
		
		return userVo;
	}

	/**
	 * 세션 조회
	 * @param request
	 * @param String session_id
	 * @param String session_value
	 * @throws Exception
	 */
	public static String getSession(HttpServletRequest request, String session_id) throws Exception {
		HttpSession session = request.getSession();
		
		if(session == null) return "";
		
		return StringUtil.nullToBlank(session.getAttribute(session_id.toUpperCase()));
	}

	public static Object getObjectSession(HttpServletRequest request, String session_id) throws Exception {
		HttpSession session = request.getSession();
		
		if(session == null) return "";
		
		return session.getAttribute(session_id);
	}
	
	/**
	 * 세션등록
	 * @param request
	 * @param session_id
	 * @throws Exception
	 */
	public static void setSession(HttpServletRequest request, String session_nm, Object obj) throws Exception {
		HttpSession session = request.getSession();
		
		session.setAttribute(session_nm, obj);
	}
	
	/**
	 * 세션등록
	 * @param request
	 * @param session_id
	 * @throws Exception
	 */
	public static void setSession(HttpServletRequest request, String session_id) throws Exception {
		HttpSession session = request.getSession();
		
		session.setAttribute(session_id.toUpperCase(), StringUtil.nullToCustom(request.getParameter(session_id), getSession(request, session_id)));
	}
	
	/**
	 * 세션등록
	 * @param request
	 * @param session_id
	 * @param session_val
	 * @throws Exception
	 */
	public static void setSession(HttpServletRequest request, String session_id, String session_val) throws Exception {
		HttpSession session = request.getSession();
		
		session.setAttribute(session_id.toUpperCase(), StringUtil.nullToBlank(session_val));
	}
	
	/**
	 * 세션 등록
	 * @param request
	 * @param userVo
	 * @throws Exception
	 */
	public static void setSession(HttpServletRequest request, UserVo userVo) throws Exception {
		
		request.getSession().invalidate();
		HttpSession session = request.getSession();
		
		session.setAttribute("SEQ", userVo.getSeq());
		session.setAttribute("GROUP_CODE", userVo.getGroupCode());
		session.setAttribute("NAME", userVo.getName());
		session.setAttribute("USER_ID", userVo.getUserId());
		session.setAttribute("USER_PWD", userVo.getUserPwd());
		session.setAttribute("REG_DATE", userVo.getRegDate());
		session.setAttribute("VALIDATE_DATE", userVo.getValidateDate());
		session.setAttribute("REG_DESC", userVo.getRegDesc());
		session.setAttribute("MAP_EDIT", userVo.getMapEdit());
		session.setAttribute("USER_MODIFY", userVo.getUserModify());
		
	}
}