package com.site.contents.routeinfo;

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
 * @Class Name : RouteInfoController
 * @Description : RouteInfoController Class
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
public class RouteInfoController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	@Resource(name = "routeInfoService")
	protected RouteInfoService routeInfoService;
	
	@Resource(name = "txManager")
	protected DataSourceTransactionManager txManager;

	
	@Autowired
	protected ServletContext servletContext;
	
	
	protected String polNm = propertyUtil.getString("POL_NAME");
	protected String polCd = propertyUtil.getString("POL_CODE");

	/**
	 * 지구별 도로(국도) 리스트 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/routeinfo/selectRouteListAjax.do")
	public String selectRouteListAjax(RouteInfoVo routeInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String polCd = request.getParameter("polCd");
		String polDistrict = request.getParameter("polDistrict");
		String totCnt = "0";
		
		routeInfoVo.setPolCd(polCd);
		routeInfoVo.setPolDistrict(polDistrict);
		
		
		List<RouteInfoVo> listRoute = routeInfoService.selectRouteListAjax(routeInfoVo);
		
		if(listRoute.size() > 0 ) {
			totCnt = listRoute.get(0).getTotCnt();
		}
		
		
		System.out.println(">>>>>>>>>>>>>>>>> totcnt : " + totCnt);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("listRoute", listRoute);
		
		return "jsonView";
	}
}
