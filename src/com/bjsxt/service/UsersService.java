package com.bjsxt.service;

import java.util.List;

import com.bjsxt.pojo.Users;

public interface UsersService {

	/**
	 * 查询全部
	 * @return
	 */
	public List<Users> findUsers();
	/**
	 * 多条件查询
	 */
	List<Users> findUsersByArgs(Users users);
	/*
	 * 根据主键删除
	 */
	void dropByUserno(Integer userno);
	/**
	 * 添加用户
	 */
	void addUsers(Users users);
	/**
	 * 查询上级领导
	 */
	List<Users> findSuperno();
	/**
	 * 查询用户描述
	 */
	List<Users> findUserDesc();
	/**
	 * 根据用户描述查询职位编号 部门编号
	 */
	List<Users> findByDesc(String userdesc);
	/**
	 * 查询用户名是否重复
	 */
	Users findUname(String uname);
	/**
	 * 统计全部数据条数
	 * @return
	 */
     int findCountAll();
     /**
      * 根据查询统计条数
      */
     int findCountByArgs(Users users);
}
