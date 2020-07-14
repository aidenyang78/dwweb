package com.core.comm.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil extends EgovDateUtil {
    /**
     * <p>해당월의 마지막 날을 조회한다.</p>
     * 주의 : EgovFramework의 EgovDateUtil.java 가 필요
     * @param  sDate 날짜 문자열(yyyyMM, yyyy-MM등의 형식)
     * @param  gubun 년도와 월을 구분 짓는 문자 또는 특수문자(예 : yyyy-MM, yyyy_MM, yyyy.MM 등)
     * @return dd 형식의 날짜 문자열 또는 데이터가 없을 경우 현재월 dd 리턴
     */
    public static String getLastDay(String sDate, String gubun) {
    	Calendar cal = Calendar.getInstance();
    	String year = null;
    	String month = null;
    	boolean return_yn = true;
    	if(sDate == null || sDate.equals("")){
    		return_yn = false;
    	}
    	if(gubun != null && !gubun.equals("")){
    		sDate = sDate.replaceAll(gubun, "");
    	}else{
    		sDate = sDate.replaceAll(" ", "");
    	}
    	boolean result = EgovDateUtil.checkDate(sDate+"01");
    	if(!return_yn || !result){
    		Date date = new Date();
        	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
    		year = sf.format(date).substring(0, 4);
    		month = sf.format(date).substring(4, 6);
    	}else{
    		year = sDate.substring(0, 4);
    		month = sDate.substring(4, 6);
    	}
    	cal.set(Integer.parseInt(year), Integer.parseInt(month)-1, 01);
        return Integer.toString(cal.getActualMaximum(Calendar.DATE));
    }
    /**
     * <p>만나이 구하기</p>
     * 주의 : EgovFramework의 EgovDateUtil.java 가 필요
     * @param  sDate 날짜 문자열(yyyyMMdd, yyyy-MM-dd등의 형식)
     * @param  gubun 년도와 월을 구분 짓는 문자 또는 특수문자(예 : yyyy-MM, yyyy_MM, yyyy.MM 등)
     * @return 만나이 리턴
     */
    public static int getManAge(String sDate, String gubun){
    	Calendar cal = Calendar.getInstance();
    	int return_value = 0;
    	boolean return_yn = true;
    	
    	if(sDate == null || sDate.equals("")){
    		return_yn = false;
    	}
    	if(gubun != null && !gubun.equals("")){
    		sDate = sDate.replaceAll(gubun, "");
    	}else{
    		sDate = sDate.replaceAll(" ", "");
    	}
    	boolean result = EgovDateUtil.checkDate(sDate);
    	if(return_yn && result){
    		int year = Integer.parseInt(sDate.substring(0, 4));
    		int month = Integer.parseInt(sDate.substring(4, 6));
    		int day = Integer.parseInt(sDate.substring(6, 8));
    		cal.set(Calendar.YEAR, year);
    	    cal.set(Calendar.MONTH, month-1);
    	    cal.set(Calendar.DATE, day);
    	    
    	    Calendar now = Calendar.getInstance ();
    	    
    	    int age = now.get(Calendar.YEAR) - cal.get(Calendar.YEAR);
    	    if (  (cal.get(Calendar.MONTH) > now.get(Calendar.MONTH))
    	            || (    cal.get(Calendar.MONTH) == now.get(Calendar.MONTH) 
    	                    && cal.get(Calendar.DAY_OF_MONTH) > now.get(Calendar.DAY_OF_MONTH)   )   
    	    ){
    	        age--;
    	    }
    	    return_value = age;
    	}
    	return return_value;
    }
    
    /**
     * <p>나이 구하기</p>
     * 주의 : EgovFramework의 EgovDateUtil.java 가 필요
     * @param  sDate 날짜 문자열(yyyyMMdd, yyyy-MM-dd등의 형식)
     * @param  gubun 년도와 월을 구분 짓는 문자 또는 특수문자(예 : yyyy-MM, yyyy_MM, yyyy.MM 등)
     * @return 나이 리턴
     */
    public static int getAge(String sDate, String gubun){
    	int return_value = 0;
    	boolean return_yn = true;
    	
    	if(sDate == null || sDate.equals("")){
    		return_yn = false;
    	}
    	if(gubun != null && !gubun.equals("")){
    		sDate = sDate.replaceAll(gubun, "");
    	}else{
    		sDate = sDate.replaceAll(" ", "");
    	}
    	boolean result = EgovDateUtil.checkDate(sDate);
    	if(return_yn && result){
    		int toYear = Integer.parseInt(EgovDateUtil.getToday().substring(0, 4));
    		int b_Year = Integer.parseInt(sDate.substring(0, 4));
    		return_value = toYear - b_Year + 1;
    	}
    	return return_value;
    }
}