package com.core.comm.util;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class MapUtil {
	
	/**
     * VO 객체와 Map을 받아서 Map에 대한 데이터를 VO로 옮겨서 반환
     * @param  Object
     * @param  Map
     * @return Object
     */
	public static Object moveToVo(Object vo, Map<?, ?> map) throws Exception {
		if(vo != null){
			if(map != null && !map.isEmpty()){
				Iterator<?> iterator = map.keySet().iterator();
			    while (iterator.hasNext()) {
			        String key = (String) iterator.next();
			        String conKey = key.substring(0, 1).toUpperCase() + key.substring(1);
			        
			        invoke(vo, "set" + conKey, new Object[]{map.get(key)});
			    }

			}
		}
		
		return vo;
	}
	
	/**
     * VO 객체의 내용을 Map으로 반환한다.
     * @param  Object
     * @param  Map
     * @return Object
     */
	public static HashMap voToMap(Object vo) throws Exception {
		
		HashMap conData = new HashMap();
		
		if(vo != null){
			
			//VO객체의 내용을 문자열로 생성한다.
			String[] conValues = vo.toString().split(":::");
			
			String keyName = null;
			String keyValue = null;
			
			for(int x=0;x<conValues.length-1;x++){
				keyName = conValues[x++].substring(3); //get제거
				keyName = keyName.toUpperCase(); //대문자로 변환
				keyValue = conValues[x];
				conData.put(keyName, keyValue);
			}
			
		}
		
		return conData;
	}
	
	/**
     * 특정 클래스의 정보를 invoke
     * @param  Object
     * @param  String
     * @param  Object[]
     * @return Object
     */
	public static Object invoke(Object obj, String methodName, Object[] objList) throws Exception {
		Method[] methods = obj.getClass().getMethods();

		for(int i=0; i<methods.length; i++) {
			if(methods[i].getName().equals(methodName)) {
				try {
					if (methods[i].getReturnType().getName().equals("void")) {
						methods[i].invoke(obj, objList);        
					} else {
						return methods[i].invoke(obj, objList);
					}

				} catch(Exception e) {
					//e.printStackTrace();
				}
			}
		}
		return null;
	}
	
}