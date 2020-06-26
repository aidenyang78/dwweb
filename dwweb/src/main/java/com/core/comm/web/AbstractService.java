/*
 * Copyright 2008-2009 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.core.comm.web;

import java.util.Locale;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.MessageSource;

import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;


/**
 * 비즈니스 서비스 구현체가 상속받는 추상추상클래스
 * <p><b>NOTE:</b> 비즈니스 서비스 구현시 디폴드로 Exception 발생을 위한 processException 메소드와 
 * leaveaTrace 메소드를 가지고 있다. processException / leaveaTrace 를 
 * 여러스타일의 파라미터를 취할 수 있도록 제공하고 있다.</b>
 * @author Judd Cho (horanghi@gmail.com)
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.05.30  Judd Cho        최초 생성
 *
 * </pre>
 */
public abstract class AbstractService {

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "messageSource")
	private MessageSource messageSource;

	@Resource(name = "leaveaTrace")
	private LeaveaTrace traceObj;

	protected interface ExceptionCreator {
		Exception createBizException(MessageSource messageSource);
	}

	/**
	 * Exception 발생없이 후처리로직 실행을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 */
	protected void leaveaTrace(String msgKey) {
		leaveaTrace(msgKey, new String[] {});
	}
	/**
	 * Exception 발생없이 후처리로직 실행을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @param msgArgs msgKey의 메세지에서 변수에 취환되는 값들 
	 */
	protected void leaveaTrace(String msgKey, String[] msgArgs) {
		leaveaTrace(msgKey, msgArgs, null);
	}
	/**
	 * Exception 발생없이 후처리로직 실행을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @param msgArgs msgKey의 메세지에서 변수에 취환되는 값들 
	 * @param locale 명시적 국가/언어지정 
	 */
	protected void leaveaTrace(String msgKey, String[] msgArgs, Locale locale) {
		// traceObj.
		traceObj.trace(this.getClass(), messageSource, msgKey, msgArgs, locale);
	}
}
