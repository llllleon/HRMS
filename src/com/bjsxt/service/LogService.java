package com.bjsxt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.pojo.Login;
import com.bjsxt.pojo.Users;
import com.bjsxt.util.PageUtil;
import com.bjsxt.vo.MsgVo;

public interface LogService {
	/**
	 * 用户cookie的处理
	 */
	void loginCookie(HttpServletRequest request,HttpServletResponse response);
	/**
	 * 登录验证
	 * @param users
	 * @param request
	 * @param response
	 * @return
	 */
	MsgVo login(Users users,HttpServletRequest request,HttpServletResponse response);
	/**
	 * 登录退出
	 * @param request
	 */
	void logout(HttpServletRequest request);
	/**
	 * 登陆日志显示
	 * @return
	 */
	Login findLogInfo();
	
	/**
	 * 登陆日志查询
	 * @return
	 */
	Integer findLogList();
	
	/**
	 * 登陆日志查询，分页
	 * @param currPage 当前页
	 * @return
	 */
	PageUtil findLogListByPage(String currPage);
	
	/**
	 * 登陆日志模糊查询，分页
	 * @return
	 */
	PageUtil findLogByConditionWithPage(String logname,String beginTime,String endTime,String currPage);
	
	/**
	 * 权限菜单查询
	 * @return
	 */
	List<Map<String,Object>> findUserRoleMenu(Users users);
	
}
