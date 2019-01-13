package com.bjsxt.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 视图解析
 * @author lyj
 *
 */
@Controller
public class PageController {
	@RequestMapping("/{page}")
	public String page(@PathVariable("page")String page){
		return page;
	}
	
}
