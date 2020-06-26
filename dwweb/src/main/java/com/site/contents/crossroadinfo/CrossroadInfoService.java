package com.site.contents.crossroadinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.comm.web.CommonDao;

/**
 * 로그인 관리  CrossroadInfoService
 * <pre>
 * 공용기능
 * </pre>
 * @author 양성진
 * @version 1.0 (2020.06.05)
 */
@Service("crossroadInfoService")
public class CrossroadInfoService {
	@Autowired
	private CommonDao dao;

	private String NAMESPACE = "com.site.contents.crossroadInfo.CrossroadInfo.";
	
	
	/**
	 * @author 양성진
	 * @creation_date 2020.06.15
	 * @description 도로명 정보 조회
	 * @history
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<CrossroadInfoVo> selectCrossroadListAjax(CrossroadInfoVo vo) throws Exception{
		return dao.list(NAMESPACE+"selectCrossroadListAjax", vo);
	}


}
