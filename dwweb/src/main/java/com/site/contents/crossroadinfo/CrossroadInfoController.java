package com.site.contents.crossroadinfo;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.common.CommonService;
import com.core.comm.util.PropertiesUtil;

/**
 * @Class Name : CrossroadInfoController
 * @Description : CrossroadInfoController Class
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2020.06.01 최초생성
 *
 * @author 양성진
 * @since 2020.06.17
 * @version 1.0
 * @see
 *
 */
@Controller
public class CrossroadInfoController {
	
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	@Resource(name = "crossroadInfoService")
	protected CrossroadInfoService crossroadInfoService;
	
	@Resource(name = "txManager")
	protected DataSourceTransactionManager txManager;

	
	@Autowired
	protected ServletContext servletContext;
	
	
	protected String polNm = propertyUtil.getString("POL_NAME");
	protected String polCd = propertyUtil.getString("POL_CODE");
	
	
	/**
	 * 교차로 리스트 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crossroadinfo/selectCrossroadListAjax.do")
	public String selectCrossroadListAjax(CrossroadInfoVo crossroadInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String polCd = request.getParameter("polCd");
		String polDistrict = request.getParameter("polDistrict");
		String routeCd = request.getParameter("routeCd");
		String totCnt = "0";
		
		crossroadInfoVo.setPolCd(polCd);
		crossroadInfoVo.setPolDistrict(polDistrict);
		crossroadInfoVo.setRouteCd(routeCd);
		
		
		List<CrossroadInfoVo> listCrossroad = crossroadInfoService.selectCrossroadListAjax(crossroadInfoVo);
		
		if(listCrossroad.size() > 0 ) {
			totCnt = listCrossroad.get(0).getTotCnt();
		}
		
		
		System.out.println(">>>>>>>>>>>>>>>>> totcnt : " + totCnt);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("listCrossroad", listCrossroad);
		
		return "jsonView";
	}

}
