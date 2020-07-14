package com.core.comm.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;

public class WebUtil {

	/**
	 * <p>request의 파라미터 값을 조회한다.</p>
	 * @param  request
	 * @param  파라미터 이름
	 * @param  파라미터가 NULL 이거나 공백일 경우 초기 값
	 * @return Object
	 */
	public static Object getParameter(HttpServletRequest request , String name, Object change) {
		if(StringUtils.isEmpty(request.getParameter(name))){
			return change;
		}else{
			return request.getParameter(name);
		}
	}

	/**
	 * 유효하지 않은 단어가 포함되었는지 확인
	 * @param val
	 * @return
	 */
	public static String getMatchInvaildWord(String val) throws Exception {

		String [] limitWords;

		limitWords = new String[] {"<", ">", "&lt;", "&gt;", "script", "iframe", "document", "alert"};

		for(int i=0; i<limitWords.length; i++) {
			if(val != null ){
				if(val.indexOf(limitWords[i]) > -1){
					return limitWords[i];
				}     
			}
		}

		return null;
	}

	/**
	 * AJAX ALERT 처리
	 * @param response
	 * @param msg : 메세지
	 * @param type : B:history.back(), L:location.href
	 * @param url : return url
	 * @throws Exception
	 */
	public static void ajaxPrintMsg(HttpServletResponse response, String msg, String type,String url)throws Exception{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		StringBuffer sb = new StringBuffer();
		sb.append( "<html lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ko\">" );
		sb.append( "<title>알림</title>" );
		sb.append( "<script language='javascript'>" );
		
		if(msg != null && !"".equals(msg)) {
			sb.append( "alert('"+msg+"');" );
		}
		
		if(type != null && !"".equals(type)){

			if("B".equals(type)){
				sb.append( "history.go(-1);" );
			}else if("L".equals(type)){
				sb.append( "window.location.href='"+ url +"';" );
			}else if("C".equals(type)){
				sb.append( "window.close();" );
			}
		}
		sb.append( "</script>" );
		sb.append( "</html>" );
		out.println( sb.toString() );
		out.flush();
		out.close();
	}
}