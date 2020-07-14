package com.core.comm.util;

public class NumberUtil {
	
	/**
	 * <pre>double 형태의 값을 지정된 자릿수까지 반올림하여 반환한다.</pre>
	 * 값이 비어있는지 여부를 체크 비어있을경우 0.0 리턴
	 * @param d 반올림할 값<br>
	 * @param n 반올림할 자릿수<br>
	 * @return<br>
	 */
	public static double round(double d, int n) {
		double rtn = 0.0;

		if (d == 0) {
			rtn = 0.0;
		}
		
		rtn = Math.round(d * Math.pow(10, n)) / Math.pow(10, n);
		
		return rtn;
	}
	
}