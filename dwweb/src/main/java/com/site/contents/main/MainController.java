/**
 * 
 */
package com.site.contents.main;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.common.CommonService;
import com.core.comm.util.EgovDateUtil;
import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.StringUtil;
import com.site.contents.crossroadinfo.CrossroadInfoVo;
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
	@RequestMapping(value = "/main/main.do")
	public String front_main(@ModelAttribute MainVo mainVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String mapType = StringUtil.nullToCustom(request.getParameter("mapType"), "lf");
		String rtnPage = "";
		
		if("ol".equals(mapType)) {
			rtnPage = "/site/www/contents/main/main_map_ol";
		}else {
			rtnPage = "/site/www/contents/main/main_map_lf";
		}
		
		//기본정보 셋팅
		mainVo.setPolCd(polCd);
		mainVo.setPolNm(polNm);
		
		
		if(mainVo.getKeyKind() == null) {
			mainVo.setKeyKind("installDate");
		}
		
		if(mainVo.getStdDate() == null && mainVo.getEndDate() == null) {
			
			String endDate = EgovDateUtil.getCurrentDate("");
			String stdDate = EgovDateUtil.addYear(endDate, -1);
			
			mainVo.setStdDate(stdDate);
			mainVo.setEndDate(endDate);
		}
		
		
		List<MainVo> listroute = mainService.selectMainRouteList(mainVo);
		model.addAttribute("listroute", listroute);
		
		List<MainVo> listcrossroad = mainService.selectMainCrossroadList(mainVo);
		
		model.addAttribute("listcrossroad", listcrossroad);
		
		return rtnPage;
	}	
	
	/**
	 * 교차로 좌표 수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main/updateCrossroadLatLngAjax.do")
	public String updateCrossroadLatLngAjax(MainVo mainVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		MainVo result = null;
		
		try {
			String seq = StringUtil.nullToBlank(request.getParameter("crossroadSeq"));
			String lat = StringUtil.nullToBlank(request.getParameter("crossroadLat"));
			String lng = StringUtil.nullToBlank(request.getParameter("crossroadLng"));
			
			mainVo.setSeq(seq);
			mainVo.setLat(lat);
			mainVo.setLng(lng);
			
			int rslt = mainService.updateCrossroadLatLngAjax(mainVo);
			
			//성공하면 데이터 조회 하여 반환
			if(rslt > 0) {
				result = mainService.selectCrossroadLatLngAjax(mainVo);
			}
			
			model.addAttribute("result", result);
		
		}catch(Exception e) {
			
			model.addAttribute("result","0");
			e.printStackTrace();
		}
		
		return "jsonView";
	}
	
	/**
	 * 교차로 좌표 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main/selectCrossroadLatLngAjax.do")
	public String selectCrossroadLatLngAjax(MainVo mainVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		MainVo result = null;
		
		try {
			String seq = StringUtil.nullToBlank(request.getParameter("crossroadSeq"));
			mainVo.setSeq(seq);
			
			result = mainService.selectCrossroadLatLngAjax(mainVo);
		
		}catch(Exception e) {
			
			
			e.printStackTrace();
		}
		
		model.addAttribute("result",result);
		
		return "jsonView";
	}
	
	/**
	 * 교차로 목록 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main/selectCrossroadListAjax.do")
	public String selectCrossroadListAjax(MainVo mainVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		List<MainVo> result = null;
		
		try {
			
			result = mainService.selectCrossroadListAjax(mainVo);
		
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		model.addAttribute("result",result);
		
		return "jsonView";
	}
	
	/**
	* @author 양성진
	* @creation_date 2020.07.13
	* @description 지도상 좌표 업데이트
	* @history
	* @param mainVo
	* @param request
	* @param response
	* @param model
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/main/updateMatchingLatlng.do")
	public String updateMatchingLatlng(@ModelAttribute MainVo mainVo,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//기본정보 셋팅
		model.addAttribute("crdPolCd",polCd);
		model.addAttribute("crdPolNm",polNm);
		
		return "/site/www/contents/main/matching_latlng_update";
	}
	
	
	/**
	* @author 양성진
	* @creation_date 2020.07.13
	* @description 지도상 좌표 업데이트 : 교차로 검색
	* @history
	* @param mainVo
	* @param request
	* @param response
	* @param model
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/main/selectMatchingLatlngAjax.do")
	public String selectMatchingLatlngAjax(@ModelAttribute MainVo mainVo,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		mainVo.setPolCd(StringUtil.nullToBlank(request.getParameter("crdPolCd")));
		mainVo.setPolNm(StringUtil.nullToBlank(request.getParameter("crdPolNm")));
		mainVo.setLat(StringUtil.nullToBlank(request.getParameter("crdLat")));
		mainVo.setLng(StringUtil.nullToBlank(request.getParameter("crdLng")));
		
		List <MainVo> result = mainService.selectMatchingLatlngAjax(mainVo);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	/**
	* @author 양성진
	* @creation_date 2020.07.14
	* @description 지도상 좌표 : 신규 교차로 등록
	* @history
	* @param mainVo
	* @param request
	* @param response
	* @param model
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/main/insertCrossroadLaglng.do")
	public String insertCrossroadLaglng(@ModelAttribute MainVo mainVo,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//기본정보 셋팅
		model.addAttribute("insPolCd",polCd);
		model.addAttribute("insPolNm",polNm);
		
		return "/site/www/contents/main/crossroad_latlng_insert";
	}
	
	/**
	* @author 양성진
	* @creation_date 2020.07.14
	* @description 지도상 좌표 : 신규 교차로 등록 실행
	* @history
	* @param mainVo
	* @param request
	* @param response
	* @param model
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/main/insertCrossroadLaglngAjax.do")
	public String insertCrossroadLaglngAjax(@ModelAttribute MainVo mainVo, CrossroadInfoVo crossroadInfoVo,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			
			int insertCnt = mainService.insertCrossroadLaglngAjax(crossroadInfoVo);
			
			if(insertCnt > 0) {
				
				mainVo.setSeq(crossroadInfoVo.getSeq());
			
				MainVo result = mainService.selectCrossroadLatLngAjax(mainVo);
				
				model.addAttribute("result",result);
			}else {
				model.addAttribute("result",0);
			}
			
		}catch(Exception e) {
			model.addAttribute("result",0);
			e.printStackTrace();
		}
		
		
		return "jsonView";
	}
	
	
	
	@RequestMapping(value = "/main/userControl.do")
	public String userControl(@ModelAttribute MainVo mainVo, CrossroadInfoVo crossroadInfoVo,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		return "/site/www/contents/main/function/user_control";
	}
}
