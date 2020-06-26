/**
 * 
 */
package com.site.contents.main;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.annotation.LoginCheck;
import com.core.comm.common.CommonService;
import com.core.comm.util.EgovDateUtil;
import com.core.comm.util.PropertiesUtil;
import com.site.contents.statistics.StatisticsService;
import com.site.contents.statistics.StatisticsVo;

/**
 * @Class Name : MainController
 * @Description : MainController Class
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2020.06.01           최초생성
 *
 * @author 양성진
 * @since 2020.06.01
 * @version 1.0
 * @see
 *
 */
@Controller

public class MainController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	@Resource(name = "mainService")
	private MainService mainService;
	
	@Resource(name = "statisticsService")
	protected StatisticsService statisticsService;
	
	@Resource(name = "txManager")
	protected DataSourceTransactionManager txManager;
	
	@Autowired
	protected ServletContext servletContext;
	
	
	protected String polNm = propertyUtil.getString("POL_NAME");
	protected String polCd = propertyUtil.getString("POL_CODE");
	

	
	
	/**
	* @author 양성진
	* @creation_date 2020.06.01
	* @description pc 메인화면
	* @history
	* @param mainVo
	* @param request
	* @param response
	* @param model
	* @return
	* @throws Exception
	*/
	
	@LoginCheck("/login/login.do")
	@RequestMapping(value = "/main/main.do")
	public String front_main(@ModelAttribute MainVo mainVo,StatisticsVo statisticsVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//기본정보 셋팅
		statisticsVo.setPolCd(polCd);
		statisticsVo.setPolNm(polNm);
		
		
		if(statisticsVo.getKeyKind() == null) {
			statisticsVo.setKeyKind("installDate");
		}
		
		if(statisticsVo.getStdDate() == null && statisticsVo.getEndDate() == null) {
			
			String endDate = EgovDateUtil.getCurrentDate("");
			String stdDate = EgovDateUtil.addYear(endDate, -1);
			
			statisticsVo.setStdDate(stdDate);
			statisticsVo.setEndDate(endDate);
		}
		
		
		List<StatisticsVo> listroute = statisticsService.selectRouteList(statisticsVo);
		
		model.addAttribute("listroute", listroute);
		
		return "/site/www/contents/main/main_map";
	}
	

}
