package com.site.contents.statistics;

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
import com.core.comm.util.StringUtil;

/**
 * @Class Name : StatisticsController
 * @Description : StatisticsController Class
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2020.06.16 최초생성
 *
 * @author 양성진
 * @since 2020.06.16
 * @version 1.0
 * @see
 *
 */
@Controller
public class StatisticsController {
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	@Resource(name = "statisticsService")
	protected StatisticsService statisticsService;
	
	@Resource(name = "txManager")
	protected DataSourceTransactionManager txManager;

	
	@Autowired
	protected ServletContext servletContext;
	
	
	protected String polNm = propertyUtil.getString("POL_NAME");
	protected String polCd = propertyUtil.getString("POL_CODE");
	
	/**
	 * 목록형 통계리스트
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@LoginCheck("/login/login.do")
	@RequestMapping("/statistics/listStatistics.do")
	public String listStatistics(@ModelAttribute StatisticsVo statisticsVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//기본정보 셋팅
		statisticsVo.setPolCd(polCd);
		statisticsVo.setPolNm(polNm);
		
		
		if(statisticsVo.getKeyKind() == null) {
			statisticsVo.setKeyKind("installDate");
		}
		
		if(statisticsVo.getStdDate() == null && statisticsVo.getEndDate() == null) {
			
			String endDate = EgovDateUtil.getCurrentDate("");
			String stdDate = EgovDateUtil.addYear(endDate, -20);
			
			statisticsVo.setStdDate(stdDate);
			statisticsVo.setEndDate(endDate);
		}
		
		
		List<StatisticsVo> listroute = statisticsService.selectRouteList(statisticsVo);
		
		model.addAttribute("listroute", listroute);
		
		return "/site/www/contents/statistics/statistics_list";
	}
	
	/**
	 * 목록형 통계리스트 상세 ajax 처리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/statistics/selectFcStatisticsHtml.do")
	public String selectFcStatisticsHtml(StatisticsVo statisticsVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	
		String listType = StringUtil.nullToCustom(statisticsVo.getListType(),"txt");
		String rtnPage = "";
		String polDistrict = StringUtil.nullToCustom(statisticsVo.getPolDistrict(),"1002");
		statisticsVo.setPolDistrict(polDistrict);
		
		//기본정보 셋팅
		statisticsVo.setPolCd(polCd);
		statisticsVo.setPolNm(polNm);
		
		System.out.println(">>>>>>>>>>>>>>> polDistrict : " + statisticsVo.getPolDistrict());
		System.out.println(">>>>>>>>>>>>>>> routeCd : " + statisticsVo.getRouteCd());
		System.out.println(">>>>>>>>>>>>>>> getKeyKind : " + statisticsVo.getKeyKind());
		System.out.println(">>>>>>>>>>>>>>> stddate : " + statisticsVo.getStdDate());
		System.out.println(">>>>>>>>>>>>>>> enddate : " + statisticsVo.getEndDate());		
		
		List<StatisticsVo> listStatistics = statisticsService.selectStatisticsList(statisticsVo);
		
		model.addAttribute("listStatistics", listStatistics);
		
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>> listType : " + listType);
		
		if("txt".equals(listType)) {
			rtnPage = "/site/www/contents/statistics/statistics_list_text";
		}else if("gui".equals(listType)) {
			rtnPage = "/site/www/contents/statistics/statistics_list_gui";
		}
		
		return rtnPage;
	}
	
	/**
	 * 목록형 통계리스트 엑셀 다운로드
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/statistics/selectFcStatisticsExcel.do")
	public String selectFcStatisticsExcel(StatisticsVo statisticsVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String polDistrict = StringUtil.nullToCustom(statisticsVo.getPolDistrict(),"1002");
		statisticsVo.setPolDistrict(polDistrict);
		
		response.setContentType( "application/vnd.ms-excel" );
        response.setCharacterEncoding("utf-8");
        
        String excelNm = "시설물통계.xls";
        
        if("1002".equals(polDistrict)){
        	excelNm = "평택시_서부_시설물통계.xls";
        }else if("1003".equals(polDistrict)){
        	excelNm = "평택시_남부_시설물통계.xls";
        }else if("1004".equals(polDistrict)){
        	excelNm = "평택시_북부_시설물통계.xls";
        }
        
		response.setHeader( "Content-disposition", "attachment;filename=" + java.net.URLEncoder.encode(excelNm, "utf-8" ));
		
		//기본정보 셋팅
		statisticsVo.setPolCd(polCd);
		statisticsVo.setPolNm(polNm);
		
		List<StatisticsVo> listStatistics = statisticsService.selectStatisticsList(statisticsVo);
		model.addAttribute("listStatistics", listStatistics);
		
		return "/site/www/contents/statistics/statistics_list_excel";
	}
	
	
	@RequestMapping("/statistics/listStatisticsText.do")
	public String listStatisticsText(@ModelAttribute StatisticsVo statisticsVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//기본정보 셋팅
		statisticsVo.setPolCd(polCd);
		statisticsVo.setPolNm(polNm);
		
		
		String polDistrict = StringUtil.nullToCustom(request.getParameter("polDistrict"),"1002");
		String routeCd = request.getParameter("routeCd");
		
		statisticsVo.setPolDistrict(polDistrict);
		statisticsVo.setRouteCd(routeCd);
		
		List<StatisticsVo> listroute = statisticsService.selectRouteList(statisticsVo);
		
		model.addAttribute("listroute", listroute);
		
		return "/site/www/contents/statistics/statistics_list_text";
	}
	
}

