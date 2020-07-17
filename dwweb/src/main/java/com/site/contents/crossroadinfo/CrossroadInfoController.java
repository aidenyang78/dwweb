package com.site.contents.crossroadinfo;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.common.CommonService;
import com.core.comm.util.PageingUtil;
import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.SessionUtil;
import com.core.comm.util.StringUtil;
import com.site.contents.routeinfo.RouteInfoService;
import com.site.contents.routeinfo.RouteInfoVo;
import com.site.contents.statusfacility.StatusService;
import com.site.contents.statusfacility.StatusVo;

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
	
	@Resource(name = "routeInfoService")
	protected RouteInfoService routeInfoService;
	
	@Resource(name = "statusService")
	protected StatusService statusService;
	
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
		
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("listCrossroad", listCrossroad);
		
		return "jsonView";
	}
	
	/**
	 * 교차로명 중복 확인
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crossroadinfo/crossroadNmCheckAjax.do")
	public String crossroadNmCheckAjax(CrossroadInfoVo crossroadInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String polDistrict = request.getParameter("polDistrict");
		String routeCd = request.getParameter("routeCd");
		String crossroadNm = request.getParameter("crossroadNm");
		
		crossroadInfoVo.setPolCd(polCd);
		crossroadInfoVo.setPolDistrict(polDistrict);
		crossroadInfoVo.setCrossroadNm(crossroadNm);
		
		int cnt = crossroadInfoService.selectCrossroadNmCheckAjax(crossroadInfoVo);
		
		model.addAttribute("cnt", cnt);
		
		return "jsonView";
	}

	/**
	 * 도록 및 교차로 관리 리스트
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/crossroadinfo/listCrossroadInfo.do")
	public String listCrossroadInfo(@ModelAttribute RouteInfoVo routeInfoVo,@ModelAttribute CrossroadInfoVo crossroadInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//기본정보 셋팅
		routeInfoVo.setPolCd(polCd);
		
		/*트리 메뉴용 도로 목록*/
		List<RouteInfoVo> listroute = routeInfoService.selectRouteList(routeInfoVo);		
		model.addAttribute("listroute", listroute);
		
/*===============================================================================================================================*/
		/**********************
		 * 페이징정보를 지정한다.
		 **********************/
		int pageLimit = 15;
		int pageBlock = propertyUtil.getInt("PAGEBLOCK_10");

		int pageNo = 1;

		if ("".equals(StringUtil.nullToBlank(crossroadInfoVo.getPageNo()))) {
			crossroadInfoVo.setPageNo("1");
		}

		pageNo = Integer.parseInt(crossroadInfoVo.getPageNo());

		int sRowNum = ((pageNo - 1) * pageLimit) + 1; // 시작
		int eRowNum = pageNo * pageLimit; // 종료
		int totCnt = 0;

		crossroadInfoVo.setLimitStart(sRowNum - 1);
		crossroadInfoVo.setLimitEnd(pageLimit);
		crossroadInfoVo.setsRowNum(String.valueOf(sRowNum));
		crossroadInfoVo.seteRowNum(String.valueOf(eRowNum));
		crossroadInfoVo.setPageBlock(String.valueOf(pageBlock));
		crossroadInfoVo.setPageLimit(String.valueOf(pageLimit));
		/**********************
		 * 페이징정보를 지정한다.
		 **********************/
		
		
		/*교차로 정보 조회*/
		
		crossroadInfoVo.setPolCd(polCd);
		
		//검색조건 셋팅
		crossroadInfoVo.setPolDistrict(StringUtil.nullToCustom(request.getParameter("s_polDistrict"),"1002"));
		crossroadInfoVo.setRouteCd(StringUtil.nullToBlank(request.getParameter("s_routeCd")));
		
	
		
		crossroadInfoVo.setCrossroadNm(StringUtil.nullToBlank(request.getParameter("s_crossroadNm")));
		
		
		List<CrossroadInfoVo> listcrossroad = crossroadInfoService.selectCrossroadList(crossroadInfoVo);
		model.addAttribute("listcrossroad", listcrossroad);
		
		// 목록에서 전체 갯수를 가져온다.
		if (listcrossroad != null && listcrossroad.size() > 0) {
			totCnt = crossroadInfoService.selectTotCrossroad(crossroadInfoVo);
		}
		
		model.addAttribute("totCnt",totCnt);
		
		//페이징
		crossroadInfoVo.setTotCnt(String.valueOf(totCnt));
		StringBuffer pageing = PageingUtil.pageing(servletContext.getContextPath(), totCnt, pageLimit, pageBlock, pageNo);
	
		model.addAttribute("pageing", pageing);
		
		//넘버링
		int cntNo = NumberUtils.toInt(crossroadInfoVo.getTotCnt()) - (pageLimit * (pageNo - 1));
		
		model.addAttribute("cntNo", cntNo);
	
		
		return "/site/www/contents/crossroadinfo/crossroad_info_list";
	}
	
	/**
	 * 교차로 등록
	 * @param request
	 * @param response
	 * @param model
	 * @param statusVo 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crossroadinfo/insertCrossroadInfo.do")
	public String insertCrossroadInfo(@ModelAttribute CrossroadInfoVo crossroadInfoVo, StatusVo statusVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("polCd", polCd);
		model.addAttribute("polNm", polNm);
		
		List<StatusVo> listStatus = statusService.selectListStatusForMatching(statusVo);
		model.addAttribute("listStatus", listStatus);
		
		
		return "/site/www/contents/crossroadinfo/crossroad_info_insert";
	}
	
	/**
	 * 교차로 등록 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crossroadinfo/insertCrossroadInfoAct.do")
	public String insertCrossroadInfoAct(@ModelAttribute CrossroadInfoVo crossroadInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			crossroadInfoVo.setRegUserid(SessionUtil.getSession(request, "USER_ID").toString());
	
			int result = crossroadInfoService.insertCrossroadInfo(crossroadInfoVo);
			
			
			if(result < 1) {
				model.addAttribute("rtnCd", "9999");	
			}else {
				
				model.addAttribute("rtnCd", "1000");
			}
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			e.printStackTrace();
		}
		
		return "/site/www/contents/crossroadinfo/crossroad_proc";
	}
	
	/**
	 * 교차로 수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crossroadinfo/updateCrossroadInfo.do")
	public String updateCrossroadInfo(@ModelAttribute CrossroadInfoVo crossroadInfoVo, StatusVo statusVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("polNm", polNm);
		
		String seq = StringUtil.nullToBlank(request.getParameter("crossroadSeq"));
		crossroadInfoVo.setSeq(seq);
		
		CrossroadInfoVo crossroadInfo = crossroadInfoService.selectCrossroadInfo(crossroadInfoVo);
		model.addAttribute("crossroadInfo", crossroadInfo);
		
		List<StatusVo> listStatus = statusService.selectListStatusForMatching(statusVo);
		model.addAttribute("listStatus", listStatus);
		
		return "/site/www/contents/crossroadinfo/crossroad_info_update";
	}
	
	/**
	 * 교차로 수정 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crossroadinfo/updateCrossroadInfoAct.do")
	public String updateCrossroadInfoAct(@ModelAttribute CrossroadInfoVo crossroadInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			String sRouteCd = StringUtil.nullToBlank(request.getParameter("s_routeCd"));
			crossroadInfoVo.setUpdtUserid(SessionUtil.getSession(request, "USER_ID").toString());
			
			int result = crossroadInfoService.updateCrossroadInfo(crossroadInfoVo);
			
			
			if(result < 1) {
				model.addAttribute("rtnCd", "9999");	
			}else {
				model.addAttribute("rtnCd", "2000");
				
				//도로(국도)정보가 변경 되었을 경우
				if(!sRouteCd.equals(crossroadInfoVo.getRouteCd())) {
					model.addAttribute("rtnRouteCd", crossroadInfoVo.getRouteCd());
				}
				
				//리스트에서 좌표 수정으로 바로 날아오는 경우 
				String rtnUrl = StringUtil.nullToBlank(request.getParameter("rtnUrl"));
				model.addAttribute("rtnUrl", rtnUrl);
			}
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			e.printStackTrace();
		}
		
		return "/site/www/contents/crossroadinfo/crossroad_proc";
	}
	
	/**
	 * 교차로 삭제
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/crossroadinfo/deleteCrossroadInfo.do")
	public String deleteCrossroadInfo(@ModelAttribute CrossroadInfoVo crossroadInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
				
		try {
			String seq = StringUtil.nullToBlank(request.getParameter("crossroadSeq"));
			crossroadInfoVo.setSeq(seq);
			
			String delUserid = SessionUtil.getSession(request, "USER_ID").toString();
			crossroadInfoVo.setDelUserid(delUserid);
			
			
			int result = crossroadInfoService.deleteCrossroadInfo(crossroadInfoVo);
			
			if(result < 1) {
				model.addAttribute("rtnCd", "9999");	
			}else {
				model.addAttribute("rtnCd", "3000");
			}
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			e.printStackTrace();
		}
		
		return "/site/www/contents/crossroadinfo/crossroad_proc";
	}
	
}

