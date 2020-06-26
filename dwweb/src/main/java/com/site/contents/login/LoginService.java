package com.site.contents.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.comm.vo.UserVo;
import com.core.comm.web.AbstractService;
import com.core.comm.web.CommonDao;

/**
 * 로그인 관리  ServiceImpl
 * <pre>
 * 로그인 관리 
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.01)
 */

@Service("loginService")
public class LoginService extends AbstractService {
	
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "com.site.contents.login.Login.";
	
	/**
	 * 로그인
	 * @param MemberVo vo : 조회 조건
	 * @return MemberVo : 조회 결과
	 * @exception Exception
	 */
	 public UserVo selectUserLogin(UserVo vo)throws Exception{
		 return (UserVo)dao.select( NAMESPACE+"selectUserLogin", vo);
	 }

}
