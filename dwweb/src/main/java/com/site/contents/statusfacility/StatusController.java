package com.site.contents.statusfacility;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.comm.annotation.LoginCheck;
import com.core.comm.common.CommonService;
import com.core.comm.util.PageingUtil;
import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.StringUtil;
import com.core.comm.vo.UserVo;
import com.site.contents.config.ConfigService;
import com.site.contents.login.LoginService;

/**
 * @Class Name : StatusController
 * @Description : StatusController Class
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2020.06.01 최초생성
 *
 * @author 양성진
 * @since 2020.06.01
 * @version 1.0
 * @see
 *
 */

@Controller
public class StatusController {
	
	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "loginService")
	protected LoginService loginService;
	
	@Resource(name = "statusService")
	protected StatusService statusService;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	@Autowired
	protected ServletContext servletContext;
	
	
	@Resource(name = "configService")
	protected ConfigService configService;
	
	/**
	 * 시설물 장애 리스트
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */	
	@LoginCheck("/login/login.do")
	@RequestMapping(value = "/status/listStatus.do")
	public String listStatus(@ModelAttribute StatusVo statusVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
	
		try {		
			
				//설정 된 상태코드 조회
				List<StatusVo> listStatusGroup = statusService.selectListStatusGroup();
				model.addAttribute("listStatusGroup", listStatusGroup);
			
				/**********************
				 * 페이징정보를 지정한다.
				 **********************/
				int pageLimit = propertyUtil.getInt("PAGELIMIT_10");
				int pageBlock = propertyUtil.getInt("PAGEBLOCK_10");
		
				int pageNo = 1;
		
				if ("".equals(StringUtil.nullToBlank(statusVo.getPageNo()))) {
					statusVo.setPageNo("1");
				}
		
				pageNo = Integer.parseInt(statusVo.getPageNo());
		
				int sRowNum = ((pageNo - 1) * pageLimit) + 1; // 시작
				int eRowNum = pageNo * pageLimit; // 종료
				int totCnt = 0;
		
				statusVo.setLimitStart(sRowNum - 1);
				statusVo.setLimitEnd(pageLimit);
				statusVo.setsRowNum(String.valueOf(sRowNum));
				statusVo.seteRowNum(String.valueOf(eRowNum));
				statusVo.setPageBlock(String.valueOf(pageBlock));
				statusVo.setPageLimit(String.valueOf(pageLimit));
				/**********************
				 * 페이징정보를 지정한다.
				 **********************/
				
				/*검색 정보 셋팅*/
				statusVo.setStatus(StringUtil.nullToBlank(request.getParameter("fStatus")));
				
				List<StatusVo> listStatus = statusService.selectListStatus(statusVo);
				
				model.addAttribute("listStatus", listStatus);
				
				// 목록에서 전체 갯수를 가져온다.
				if (listStatus != null && listStatus.size() > 0) {
					//totCnt = Integer.parseInt(listStatus.get(0).getTotCnt());
					totCnt = statusService.selectTotStatus(statusVo);
				}
				
				
				//페이징
				statusVo.setTotCnt(String.valueOf(totCnt));
				StringBuffer pageing = PageingUtil.pageing(servletContext.getContextPath(), totCnt, pageLimit, pageBlock, pageNo);
		
				model.addAttribute("pageing", pageing);
				
				//넘버링
				int cntNo = NumberUtils.toInt(statusVo.getTotCnt()) - (pageLimit * (pageNo - 1));
				model.addAttribute("cntNo", cntNo);
				
				//전체 건수 반환
				model.addAttribute("totErrCnt", statusVo.getTotCnt());
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/site/www/contents/status/status_list";
	}
	
	
	@RequestMapping(value = "/status/makeStatusData.do")
	public String makeStatusData(@ModelAttribute UserVo userVo, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
			
		String arrStatus[] = {"5","6","7"};
		String arrRoadNm[] = {"교차로명1","교차로명2","교차로명3","교차로명4","교차로명5","교차로명6","교차로명7","교차로명8","교차로명9","교차로명10"};
		
		
		
		
		for(int x=0;x<125;x++) {
			
			StatusVo tmpVo = new StatusVo();
			
			String name = "";
			String status = "";
			int cntnm = 0;
			int cntstat = 0;
			
			cntstat = (int) (Math.random() * arrStatus.length);
			status = arrStatus[cntstat];
			
			
			cntnm = (int) (Math.random() * arrRoadNm.length);
			name = arrRoadNm[cntnm];
			
			
			tmpVo.setName(name);
			tmpVo.setStatus(status);
			
			//System.out.println(">>>>>>>>>>>>>>> data" + x + ":" + name + " >> " + status);
			
			int result = statusService.insertStatus(tmpVo);
			
		}
		
		return null;
	}


}
