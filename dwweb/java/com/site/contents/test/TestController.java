package com.site.contents.test;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@Autowired
	protected ServletContext servletContext;
	
	@RequestMapping(value = { "/test/{gpage}" })
	public String gpage(@PathVariable String gpage, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		model.addAttribute("req", request);
		System.out.println("/site/www/contents/test/" + gpage);
		
		return "/site/www/contents/test/" + gpage;
	}
	
	@RequestMapping(value = { "/test/{gsub}/{gpage}" })
	public String gpage(@PathVariable String gsub, @PathVariable String gpage, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		model.addAttribute("req", request);
		System.out.println("/site/www/contents/test/" + gsub + "/" + gpage);
		return "/site/www/contents/test/" + gsub + "/" + gpage;
	}
}
