package com.bjsxt.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Login;
import com.bjsxt.pojo.Users;
import com.bjsxt.service.LogService;
import com.bjsxt.util.PageUtil;

@Controller
@RequestMapping("/log")
public class LogController {
	@Autowired
	private LogService logService;
	
	/**
	 * 请求登录页面--------待完善
	 * @param users
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loginPage")
	public String loginPage(HttpServletRequest request,HttpServletResponse response){
		// TODO
		// 生成和判断cookie
		logService.loginCookie(request, response);
		// 登录转发到登录页面
		return "/login";
	}
	
	/**
	 * 登录验证
	 * @param users
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loginVvalidte")
	@ResponseBody
	public Object loginVvalidte(Users users,HttpServletRequest request,HttpServletResponse response){
		// 登录验证
		return logService.login(users,request,response);
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request){
		//退出登录
		logService.logout(request);
		// 重定向登录页面
		return "redirect:/login";
	}
	
	/**
	 * 登陆完成之后的转发
	 * @return
	 */
	@RequestMapping("/loginIn")
	public String loginIn(HttpServletRequest request){
		Users user = (Users)request.getSession().getAttribute("user");
		// 菜单权限查询
		List<Map<String,Object>> menuMap = logService.findUserRoleMenu(user);
		// 放入session对象中
		request.getSession().setAttribute("menuMap", menuMap);
		// 转发主页面
		return "/main";
	}
	
	/**
	 * 查询上一次登录信息
	 * @param map
	 * @return
	 */
	@RequestMapping("/logInfo")
	@ResponseBody
	public Object logInfo(ModelMap map){
		// 查询上一次登录信息
		return logService.findLogInfo();
	}
	
	/**
	 * 查询登陆日志的所有信息,分页
	 * @param map
	 * @return
	 */
	@RequestMapping("/logListByPage")
	public String logInfoListByPage(ModelMap map,@RequestParam(defaultValue="1") String currPage){
		// 查询上登录信息
		PageUtil pageUtil = logService.findLogListByPage(currPage);
		map.addAttribute("pageUtil", pageUtil);
		return "/system-log";
	}
	
	/**
	 * 查询登陆日志的所有信息，分页，模糊
	 * @param map
	 * @return
	 */
	@RequestMapping("/logListByConditionWithPage")
	public String logInfoListByConditionWithPage(@RequestParam(defaultValue="") String logname,
			@RequestParam(defaultValue="") String beginTime, 
			@RequestParam(defaultValue="") String endTime,
			@RequestParam(defaultValue="1") String currPage, ModelMap map){
		// 查询上登录信息
		PageUtil pageUtil = logService.findLogByConditionWithPage(logname, beginTime, endTime, currPage);
		map.addAttribute("pageUtil", pageUtil);
		map.addAttribute("logname", logname);
		map.addAttribute("beginTime", beginTime);
		map.addAttribute("endTime", endTime);
		return "/system-log";
	}
	
}
