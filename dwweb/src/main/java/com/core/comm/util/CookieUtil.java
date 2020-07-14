package com.core.comm.util;

import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	public static String getCookie(HttpServletRequest request, String cookieName) throws Exception {
		
		String reVal = null;
		try{
			Cookie[] c = request.getCookies();
			
			if(c != null && c.length > 0){
				for(int i=0; i < c.length; i++){
					if(c[i].getName() != null && c[i].getName().equals(cookieName)){
						reVal = URLDecoder.decode(c[i].getValue(), "UTF-8");
					}
				}
			}
			
		}catch(Exception e){
			reVal = "";
			throw e;
		}
		
		
		return reVal;
	}
	
	public static Boolean getCookieCheck(HttpServletRequest request, String cookieName){
		
		Cookie[] c = request.getCookies();
		boolean reVal = false;
		
		if(c != null && c.length > 0){
			for(int i=0; i < c.length; i++){
				if(c[i].getName() != null && c[i].getName().equals(cookieName)){
					reVal = true;
				}
			}
		}
		return reVal;
	}
	
	public static void setCookie(HttpServletRequest request, HttpServletResponse response, String cookieName, String cookieValue) throws Exception {
		try{
			Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));

  			int maxAge = 60*60*24*365;

  			if ( maxAge > 60*60*24*365 ) {
  				maxAge = 60*60*24*365;
  			}

			cookie.setMaxAge(maxAge);
			cookie.setPath("/");			
			cookie.setSecure(false);	//cookie.setSecure(true);
			
			//XSS를 이용한 쿠키 하이재킹 방지
			cookie.setHttpOnly(true);
			
			response.addCookie(cookie);
		}catch(Exception e){
			throw e;
		}
		
	}
	
	public static void setCookie(HttpServletRequest request, HttpServletResponse response, String cookieName, String cookieValue, String path) throws Exception {
		try{
			Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
			
  			int maxAge = 60*60*24*365;

  			if ( maxAge > 60*60*24*365 ) {
  				maxAge = 60*60*24*365;
  			}

			cookie.setMaxAge(maxAge);
			
			if(path != null && !"".equals(path)){
				cookie.setPath(path);
			}else{
				cookie.setPath("/");
			}
			
			cookie.setSecure(true);
			
			//XSS를 이용한 쿠키 하이재킹 방지
			cookie.setHttpOnly(true);
			
			response.addCookie(cookie);
		}catch(Exception e){
			throw e;
		}
	}
	
	public static void setCookie(HttpServletRequest request, HttpServletResponse response, String cookieName, String cookieValue, int day) throws Exception {
		try{
			Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
			
  			int maxAge = 60*60*24*day;

  			if ( maxAge > 60*60*24*day ) {
  				maxAge = 60*60*24*day;
  			}

			cookie.setMaxAge(maxAge);
			cookie.setPath("/");
			
			cookie.setSecure(true);
			
			//XSS를 이용한 쿠키 하이재킹 방지
			cookie.setHttpOnly(true);
			
			response.addCookie(cookie);
		}catch(Exception e){
			throw e;
		}
	}
	
	public static void setCookie(HttpServletRequest request, HttpServletResponse response, String cookieName, String cookieValue, String path, int day) throws Exception {
		try{
			Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));

  			int maxAge = 60*60*24*day;

  			if ( maxAge > 60*60*24*day ) {
  				maxAge = 60*60*24*day;
  			}

			cookie.setMaxAge(maxAge);
			
			if(path != null && !"".equals(path)){
				cookie.setPath(path);
			}else{
				cookie.setPath("/");
			}
			
			cookie.setSecure(true);
			
			//XSS를 이용한 쿠키 하이재킹 방지
			cookie.setHttpOnly(true);
			
			response.addCookie(cookie);
		}catch(Exception e){
			throw e;
		}
	}

}