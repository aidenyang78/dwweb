package com.core.comm.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/*public class PropertiesUtil extends PropertyPlaceholderConfigurer {
	
	private static Map propertiesMap;
	
	@Override
	protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props) throws BeansException {
		
		super.processProperties(beanFactoryToProcess, props);
		
		propertiesMap = new HashMap<String, String>();
		
		for(Object key : props.keySet()) {
			String keyStr = key.toString();
			propertiesMap.put(keyStr, parseStringValue(props.getProperty(keyStr), props, new HashSet()));
		}
	}
	
	public static int getInt(String name) {
		int re_val = 0;
		try{
			re_val = Integer.parseInt((String)propertiesMap.get(name));
		}catch(Exception e){
			re_val = 0;
		}finally{
			return re_val;
		}
	}
	
	public static String getString(String name) {
		return (String)propertiesMap.get(name);
	}
}*/

public class PropertiesUtil extends PropertyPlaceholderConfigurer {

	private static Map<String, String> propertiesMap;

	@SuppressWarnings("deprecation")
	@Override
	protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props) throws BeansException {

		super.processProperties(beanFactoryToProcess, props);

		propertiesMap = new HashMap<String, String>();

		for (Object key : props.keySet()) {
			String keyStr = key.toString();
			propertiesMap.put(keyStr, parseStringValue(props.getProperty(keyStr), props, new HashSet()));
		}
	}

	public static int getInt(String name) {
		int re_val = 0;
		try {
			re_val = Integer.parseInt((String) propertiesMap.get(name));
		} catch (Exception e) {
			re_val = 0;
		}
		
		return re_val;
	}

	public static String getString(String name) {
		return (String) propertiesMap.get(name);
	}
}