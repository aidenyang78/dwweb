package com.core.comm.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.comm.vo.GroupVo;
import com.core.comm.web.CommonDao;

/**
 * 로그인 관리  CommonService
 * <pre>
 * 공용기능
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.05)
 */

@Service("commonService")
public class CommonService {
	
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "comm.common.Common.";

	/**
	 * 전송받은 날짜의 해당월 마지막날 조회
	 * @param strDate
	 * @return String : 마지막날
	 * @exception Exception
	 */
	public String selectLastDate(String strDate) throws Exception {
		return (String) dao.select(NAMESPACE+"selectLastDate", strDate);
	}

	/**
	 * 관리자 그룹 조회
	 * @param null
	 * @return List : 관리자 그룹
	 * @exception Exception
	 */
	public List<GroupVo> selectGroupList() throws Exception {
		return dao.list(NAMESPACE+"selectGroupList", null);
	}
}
