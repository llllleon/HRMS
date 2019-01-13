package com.bjsxt.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Users;
import com.bjsxt.service.UsersService;
import com.bjsxt.util.MyException;
import com.bjsxt.vo.MsgVo;

@Controller
@RequestMapping("/users")
public class UsersController {

	/**
	 * 查询全部数据
	 */
	@Autowired
	private UsersService usersService;
	@RequestMapping("/findUsers")
	public String findUsers(Model model) {
		List<Users> usersList = usersService.findUsers();
		int countAll=usersService.findCountAll();
		model.addAttribute("countAll", countAll);
		model.addAttribute("usersList", usersList);
		return "userManage";
	}
	/**
	 * 根据条件进行模糊查询
	 * @param userno 用户名
	 * @param posno  职位编号
	 * @param model  
	 * @param request
	 * @return
	 */
	@RequestMapping("/findUserByArgs")
	public String findUsersByArgs(Users users,Model model) {
		List<Users> usersList = usersService.findUsersByArgs(users);
		int countByArgs = usersService.findCountByArgs(users);
		model.addAttribute("usersList", usersList);
		model.addAttribute("countAll", countByArgs);
		model.addAttribute("users", users);
		return "userManage";
	}
	/**
	 * 根据主键删除
	 * @return
	 */
	@RequestMapping("/dropByUserno")
	@ResponseBody
	public Object dropByUserno(@RequestParam("userno") Integer userno) {
		MsgVo mv=null;
		try {
		 usersService.dropByUserno(userno);
		    mv=new MsgVo("1","删除成功");
		}catch(MyException e){
			mv=new MsgVo("0","删除失败");
		}
		return mv;
	}
	/**
	 * 查询上级领导
	 * @param model
	 * @return
	 */
	@RequestMapping("/finSuper")
	@ResponseBody
	public Object findSuperno() {
		List<Users> supernoList = usersService.findSuperno();
		return supernoList;
	}
	/**
	 * 查询用户描述
	 */
	@RequestMapping("/finUserDesc")
	@ResponseBody
	public Object findUserDesc() {
		List<Users> userDescList = usersService.findUserDesc();
		return userDescList;
	}
	/**
	 * 根据用户描述查询职位编号 部门编号
	 * @return
	 */
	@RequestMapping("/findByDesc")
	@ResponseBody
	public Object findByDesc(@RequestParam String userdesc) {
		List<Users> byDescList = usersService.findByDesc(userdesc);
		return byDescList;
	}
	/**
	 * 添加用户
	 */
	@RequestMapping("/addUsers")
	@ResponseBody
	public Object findUsers(Users users){
		
		MsgVo mv=null;
		try {
			usersService.addUsers(users);
			mv=new MsgVo("1", "添加成功");
		} catch (MyException e) {
			e.printStackTrace();
			mv=new MsgVo("0", "添加失败");
		}
		return mv;
	}
	/**
	 * 查询用户名称是否重复
	 * @param uname
	 * @return
	 */
	@RequestMapping("/findUname")
	@ResponseBody
	public Object  findUname(String uname) {
		Users users = usersService.findUname(uname);
		MsgVo mv=null;
		if(users!=null) {
			mv=new MsgVo("1", "用户名重复");
		}else {
			mv=new MsgVo("0", "用户名不重复");
		}
		return mv;
	}
}
