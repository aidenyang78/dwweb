package com.core.comm.util;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;

public class StringUtil {


	/**
	 * <pre>값이 비어있는지 여부를 체크 비어있을경우 true 리턴한다.</pre>
	 * 값이 비어있는지 여부를 체크 비어있을경우 true 리턴
	 * @param str 문자열<br>
	 * @return<br>
	 */
	public static boolean isEmpty(String str) {
		boolean rtn = false;

		if ( str == null || str.trim().equals("") || str.trim().equals("null") ) {
			rtn = true;
		}

		return rtn;
	}

	/**
	 * <pre>인자로 받은 String이 null일 경우 대체 값을 리턴한다.</pre>
	 * null이거나 ""이면 ""반환한다.
	 * @param str 문자열<br>
	 * @return<br>
	 */
	public static boolean isEquals(String orgStr, String comStr) {
		boolean rtn = false;

		if ( orgStr == null || orgStr.trim().equals("") || orgStr.trim().equals("null") ) {
			orgStr = "";
		}

		if ( comStr == null || comStr.trim().equals("") || comStr.trim().equals("null") ) {
			comStr = "";
		}

		if(orgStr.equals(comStr)) {
			rtn = true;
		}

		return rtn;
	}

	public static boolean isEquals(Object orgObj, String comStr) {
		boolean rtn = false;
		String orgStr = "";

		if ( orgObj == null) {
			orgStr = "";
		}

		if ( comStr == null || comStr.trim().equals("") || comStr.trim().equals("null") ) {
			comStr = "";
		}

		if(orgStr.equals(comStr)) {
			rtn = true;
		}

		return rtn;
	}

	/**
	 * <pre>인자로 받은 String이 null일 경우 대체 값을 리턴한다.</pre>
	 * null이거나 ""이면 ""반환한다.
	 * @param str 문자열<br>
	 * @return<br>
	 */
	public static String nullToBlank(String str) {
		String rtnStr = str;

		if ( str == null || str.trim().equals("") || str.trim().equals("null") ) {
			rtnStr = "";
		}

		return rtnStr;
	}

	/**
	 * 해당 문자열에 값이 있는지 확인한다.<br>
	 * null이거나 ""이면 ""반환한다.
	 * @param str 문자열<br>
	 * @return<br>
	 */
	public static String nullToBlank(Object obj) {
		String rtnStr = "";

		if (obj == null) {
			rtnStr = "";
		}
		else if(obj.toString().trim().equals("") || obj.toString().trim().equals("null")) {
			rtnStr = "";
		}
		else {
			rtnStr = obj.toString();
		}

		return rtnStr;
	}

	/**
	 * <pre>인자로 받은 String이 null일 경우 대체 값을 리턴한다.</pre>
	 * @param  비교 값
	 * @param  대체 값
	 * @return String
	 */
	public static String nullToCustom(String str, String replaceStr) {
		String rtnStr = str;

		if ( str == null || str.trim().equals("") || str.trim().equals("null") ) {
			rtnStr = replaceStr;
		}

		return rtnStr;
	}

	/**
	 * <pre>인자로 받은 String이 null일 경우 대체 값을 리턴한다.</pre>
	 * @param  비교 값
	 * @param  대체 값
	 * @return String
	 */
	public static String nullToCustom(Object obj, String replaceStr) {

		String str 		= nullToBlank(obj);

		if ( str.trim().equals("") || str.trim().equals("null") ) {
			str = replaceStr;
		}

		return str;
	}

	/**
	 * <pre>인자로 받은 String이 null일 경우 대체 값을 리턴한다.</pre>
	 * null이거나 ""이면 ""반환한다.
	 * @param str 문자열<br>
	 * @return<br>
	 */
	public static String nullToZero(String str) {
		String rtnStr = str;

		if ( str == null || str.trim().equals("") || str.trim().equals("null") ) {
			rtnStr = "0";
		}

		return rtnStr;
	}

	private static void copyMapToDto(HashMap map, Object dto) throws Exception {
		Iterator iterator = map.keySet().iterator();
		for (int i = 0; iterator.hasNext(); i++) {
			String key = (String) iterator.next();

			HashMap resultMap = (HashMap) map.get(key);
			Class type = (Class) resultMap.get("type");
			Object value = resultMap.get("value");

			String methodName = "set" + key.substring(0, 1).toUpperCase() + key.substring(1);

			Class clazz = dto.getClass();
			Method method = null;
			try {
				method = clazz.getMethod(methodName, type);
			} catch (NoSuchMethodException e) {
				continue;
			}

			method.invoke(dto, value);
		}
	}

	/**
	 * 본인인증 모듈에서 사용
	 * @param paramValue
	 * @param gubun
	 * @return
	 */
	public static String requestReplace(String paramValue, String gubun) {
		String result = "";

		if (paramValue != null) {

			paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

			paramValue = paramValue.replaceAll("\\*", "");
			paramValue = paramValue.replaceAll("\\?", "");
			paramValue = paramValue.replaceAll("\\[", "");
			paramValue = paramValue.replaceAll("\\{", "");
			paramValue = paramValue.replaceAll("\\(", "");
			paramValue = paramValue.replaceAll("\\)", "");
			paramValue = paramValue.replaceAll("\\^", "");
			paramValue = paramValue.replaceAll("\\$", "");
			paramValue = paramValue.replaceAll("'", "");
			paramValue = paramValue.replaceAll("@", "");
			paramValue = paramValue.replaceAll("%", "");
			paramValue = paramValue.replaceAll(";", "");
			paramValue = paramValue.replaceAll(":", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll("#", "");
			paramValue = paramValue.replaceAll("--", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll(",", "");

			if(gubun != "encodeData"){
				paramValue = paramValue.replaceAll("\\+", "");
				paramValue = paramValue.replaceAll("/", "");
				paramValue = paramValue.replaceAll("=", "");
			}

			result = paramValue;

		}
		return result;
	}

	public static void strToVo(String strParam, Object vo) {
		
		String[] arrStrParam1	= strParam.split("&");
		String[] arrStrParam2	= null;
		String[] arrParamKey	= new String[arrStrParam1.length];
		String[] arrParamVal	= new String[arrStrParam1.length];

		for(int i=0; i<arrStrParam1.length; i++) {
			arrStrParam2 = arrStrParam1[i].split("=");

			if(arrStrParam2 != null && arrStrParam2.length == 2) {
				arrParamKey[i] = arrStrParam2[0];
				arrParamVal[i] = arrStrParam2[1];
			}
		}


		Class c = vo.getClass();

		try{			
			for (int i = 0; i < arrParamKey.length; i++) {

				Object value = arrParamVal[i];

				String methodName = "set" + arrParamKey[i].substring(0, 1).toUpperCase() + arrParamKey[i].substring(1);

				Class type = arrParamKey[i].getClass();

				Method method = null;
				try {
					method = c.getMethod(methodName, type);
				} catch (NoSuchMethodException e) {
					continue;
				}

				method.invoke(vo, value);
			}

		}catch(Exception ex){

		}
	}
}