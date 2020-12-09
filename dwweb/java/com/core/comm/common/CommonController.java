package com.core.comm.common;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.core.comm.util.PropertiesUtil;
import com.core.comm.util.StringUtil;

/**
 * @Class Name : CommonController
 * @Description : CommonController Class
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
public class CommonController {
	
	@Resource(name = "propertyUtil")
	protected PropertiesUtil propertyUtil;
	
	@Resource(name = "commonService")
	protected CommonService commonService;
	
	
	/**
	 * 전송 날짜 중 해당월의 마지막날 조회
	 * @param request.param
	 * @return jsonView
	 * @exception Exception
	 */
	@RequestMapping(value = "/common/selectLastDate.do")
	public String commonSelectLastDate(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String strDate = request.getParameter("strDate");
		String strLastDate = commonService.selectLastDate(strDate);
		
		String strLastYear = strLastDate.substring(0, 4);
		String strLastMonth = strLastDate.substring(5, 7);
		String strLastDay = strLastDate.substring(8, 10);
		
		
		System.out.println(">>>>>>>>>>>>>> strLastDay : " + strLastDate);
		System.out.println(">>>>>>>>>>>>>> strLastYear : " + strLastYear);
		System.out.println(">>>>>>>>>>>>>> strLastMonth : " + strLastMonth);
		System.out.println(">>>>>>>>>>>>>> strLastDay : " + strLastDay);
		
		model.addAttribute("strLastDate", strLastDate);
		model.addAttribute("strLastYear", strLastYear);
		model.addAttribute("strLastMonth", strLastMonth);
		model.addAttribute("strLastDay", strLastDay);
		
		return "jsonView";
	}
	
	/**
	 * html2canvas 이미지 다운로드
	 * @param request.param
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/common/downloadHtmlToImg.do",method=RequestMethod.POST)
	public void downloadHtmlToImg(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		try {
			
			String fNm = StringUtil.nullToBlank(request.getParameter("fNm"));
			String fExt = StringUtil.nullToBlank(request.getParameter("fExt"));
			
			String fData = "";
			
			if(".png".equals(fExt) || "jpg.".equals(fExt)) {
				fData = request.getParameter("fData");
				fData = fData.replaceAll("data:image/png;base64,", "");
			}
 
            byte[] file = Base64.decodeBase64(fData);
            ByteArrayInputStream is = new ByteArrayInputStream(file);
 
            response.setContentType("image/png");
            response.setHeader("Content-disposition", "attachment;filename=" + java.net.URLEncoder.encode(fNm+fExt, "utf-8" ));
 
            IOUtils.copy(is, response.getOutputStream());
            response.flushBuffer();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	/**
	 * html2canvas 이미지 다운로드
	 * @param request.param
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/common/printHtmlToImg.do",method=RequestMethod.POST)
	public String printHtmlToImg(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			String fNm = StringUtil.nullToBlank(request.getParameter("fNm"));
			String fExt = StringUtil.nullToBlank(request.getParameter("fExt"));
			
			String fData = StringUtil.nullToBlank(request.getParameter("fData"));
			
			model.addAttribute("fData", fData);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/site/www/common/print_img";
	}

}
