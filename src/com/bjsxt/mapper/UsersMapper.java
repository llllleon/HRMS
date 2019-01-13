package com.bjsxt.mapper;

import java.util.List;

import com.bjsxt.pojo.Users;

public interface UsersMapper {

	/**
	 * 查询用户
	 * @param user
	 */
    List<Users> selectUsers();
	/**
	 * 多条件查询
	 */
	List<Users> selectUsersByArgs(Users users);
	/**
	 * 根据主键删除
	 */
	void deleteByUserno(Integer userno);
	/**
	 * 添加用户
	 */
	void insertUsers(Users users);
	/**
	 * 查询上级领导
	 */
	List<Users> selectSuperno();
	/**
	 * 查询用户描述
	 */
	List<Users> selectUserDesc();
	/**
	 * 根据用户描述查询职位编号 部门编号
	 */
	List<Users> selectByDesc(String userdesc);
	/**
	 * 查询用户名是否重复
	 */
	Users selectUname(String uname);
	/**
	 * 统计查询总条数
	 */
	int selectCountAll();
	/**
	 * 统计根据条件查询的条数
	 */
	int selectCountByArgs(Users users);
}
