package com.core.comm.util;

import java.security.MessageDigest;

public class Sha256Util {
	
	
	  /**
	   * @author 아이웍스 인터렉티브
	   * @creation_date 2018. 6. 5.
	   * @description SHA256 암호화
	   * @history
	   * @param planText
	   * @return
	   * @throws Exception
	   */
	   
	public static String encryptSHA256(String planText)throws Exception {
		
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        
        md.update(planText.getBytes());
        
        byte byteData[] = md.digest();

        StringBuffer sb = new StringBuffer();
        
        for (int i = 0; i < byteData.length; i++) {
        	
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            
        }
        return sb.toString();
    }
	
}
