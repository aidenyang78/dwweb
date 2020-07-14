package com.site.contents.routeinfo;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.common.CommonService;
import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.SessionUtil;
import com.core.comm.util.StringUtil;
import com.site.contents.crossroadinfo.CrossroadInfoService;
import com.site.contents.crossroadinfo.CrossroadInfoVo;

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
	
	@Resource(name = "crossroadInfoService")
	protected CrossroadInfoService crossroadInfoService;
	
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
		String polCd = StringUtil.nullToBlank(request.getParameter("polCd"));
		String polDistrict = StringUtil.nullToBlank(request.getParameter("polDistrict"));
		String totCnt = "0";
		
		routeInfoVo.setPolCd(polCd);
		routeInfoVo.setPolDistrict(polDistrict);
		
		
		List<RouteInfoVo> listRoute = routeInfoService.selectRouteListAjax(routeInfoVo);
		
		if(listRoute.size() > 0 ) {
			totCnt = listRoute.get(0).getTotCnt();
		}
		
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("listRoute", listRoute);
		
		return "jsonView";
	}
	
	/**
	 * 지구별 도로(국도)명 중복 체크
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/routeinfo/routeNmCheckAjax.do")
	public String routeNmCheckAjax(RouteInfoVo routeInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String polCd = request.getParameter("polCd");
		String polDistrict = request.getParameter("polDistrict");
		
		routeInfoVo.setPolCd(polCd);
		routeInfoVo.setPolDistrict(polDistrict);
		
		
		int cnt = routeInfoService.selectRouteNmCheckAjax(routeInfoVo);
		
		model.addAttribute("cnt", cnt);
		
		return "jsonView";
	}
	

	
	/**
	 * 도로(국도) 등록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/routeinfo/insertRouteInfo.do")
	public String insertRouteInfo(RouteInfoVo routeInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		routeInfoVo.setPolDistrict(StringUtil.nullToCustom(request.getParameter("s_polDistrict"), "1002"));
		
		model.addAttribute("polCd", polCd);
		model.addAttribute("polNm", polNm);
		
		return "/site/www/contents/routeinfo/route_info_insert";
	}
	
	/**
	 * 도로(국도) 등록 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/routeinfo/insertRouteInfoAct.do")
	public String insertRouteInfoAct(RouteInfoVo routeInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		Enumeration params = request.getParameterNames();
		
		try {
			String s_polDistrict = StringUtil.nullToBlank(request.getParameter("s_polDistrict"));
			String s_routeCd = StringUtil.nullToBlank(request.getParameter("s_routeCd"));
			
			routeInfoVo.setRegUserid(SessionUtil.getSession(request, "USER_ID").toString());
			
			int result = routeInfoService.insertRouteInfo(routeInfoVo);
			
			if(result < 1) {
				model.addAttribute("rtnCd", "9999");
			}else {
				model.addAttribute("rtnCd", "1000");
				model.addAttribute("rtnRouteCd", routeInfoVo.getSeq());
			}
			
			
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			e.printStackTrace();
		}
		
		return "/site/www/contents/routeinfo/route_info_proc";
	}
	
	/**
	 * 도로(국도) 수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/routeinfo/updateRouteInfo.do")
	public String updateRouteInfo(RouteInfoVo routeInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		model.addAttribute("polCd", polCd);
		model.addAttribute("polNm", polNm);
		
		routeInfoVo.setPolCd(polCd);
		//routeInfoVo.setPolDistrict(StringUtil.nullToBlank(request.getParameter("s_polDistrict")));
		routeInfoVo.setSeq(StringUtil.nullToBlank(request.getParameter("s_routeCd")));
		
		System.out.println(">>>>>>>>>>>>>>>>>>>> seq : " + routeInfoVo.getSeq());
		
		
		RouteInfoVo routeInfo = routeInfoService.selectRouteInfo(routeInfoVo);
		
		model.addAttribute("routeInfo",routeInfo);
		
		return "/site/www/contents/routeinfo/route_info_update";
	}
	
	/**
	 * 도로(국도) 수정 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/routeinfo/updateRouteInfoAct.do")
	public String updateRouteInfoAct(RouteInfoVo routeInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		try {			
			routeInfoVo.setUpdtUserid(SessionUtil.getSession(request, "USER_ID").toString());
			routeInfoVo.setSeq(StringUtil.nullToBlank(request.getParameter("s_routeCd")));
			
			int result = routeInfoService.updateRouteInfo(routeInfoVo);
			
			if(result < 1) {
				model.addAttribute("rtnCd", "9999");
			}else {
				model.addAttribute("rtnCd", "2000");
			}
			
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			e.printStackTrace();
		}
		
		return "/site/www/contents/routeinfo/route_info_proc";
	}
	
	/**
	 * 도로(국도) 등록 실행
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/routeinfo/deleteRouteInfoAct.do")
	public String deleteRouteInfoAct(RouteInfoVo routeInfoVo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus txStatus = txManager.getTransaction(def);
		
		try {
			
			routeInfoVo.setDelUserid(SessionUtil.getSession(request, "USER_ID").toString());
			routeInfoVo.setSeq(StringUtil.nullToBlank(request.getParameter("s_routeCd")));
			
			int result1 = 0;
			int result2= 0;
			int totCnt = 0;
			
			//도로 삭제
			result1 = routeInfoService.deleteRouteInfo(routeInfoVo);
			
			//교차로 삭제
			CrossroadInfoVo crossroadInfoVo = new CrossroadInfoVo();
			
			crossroadInfoVo.setRouteCd(routeInfoVo.getSeq());
			crossroadInfoVo.setDelUserid(routeInfoVo.getDelUserid());
			
			totCnt = crossroadInfoService.selectTotCrossroad(crossroadInfoVo);
			
			if(totCnt > 0 ) {
				result2 = crossroadInfoService.deleteAllCrossroadInfo(crossroadInfoVo);
			}else {
				result2 = 1;
			}
			
			if(result1 < 1 || result2 < 1) {
				model.addAttribute("rtnCd", "9999");
				txManager.rollback(txStatus);
			}else {
				model.addAttribute("rtnCd", "3000");
				txManager.commit(txStatus);
			}
			
		}catch(Exception e) {
			model.addAttribute("rtnCd", "9999");
			txManager.rollback(txStatus);
			e.printStackTrace();
		}
		
		return "/site/www/contents/routeinfo/route_info_proc";
	}
}
