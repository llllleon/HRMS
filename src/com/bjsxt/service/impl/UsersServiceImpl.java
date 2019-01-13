package com.bjsxt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.UsersMapper;
import com.bjsxt.pojo.Users;
import com.bjsxt.service.UsersService;
import com.bjsxt.util.MyException;
@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersMapper usersMapper;

	/**
	 * 查询全部
	 */
	@Override
	public List<Users> findUsers() {
		List<Users> selectUsers = usersMapper.selectUsers();
		return selectUsers;
	}

	/**
	 * 根据条件模糊查询
	 */
	@Override
	public List<Users> findUsersByArgs(Users users) {
		List<Users> usersByArgs = usersMapper.selectUsersByArgs(users);
		return usersByArgs;
	}

	/**
	 * 根据主键删除
	 */
	@Override
	public void dropByUserno(Integer userno) {
	 try {
		usersMapper.deleteByUserno(userno);
	} catch (Exception e) {
		/*如果不想在控制台打印信息可以删除*/
		/*e.printStackTrace();*/
		throw new MyException(e.getMessage());
	}
	 
	}

	/**
	 * 添加用户
	 */
	@Override
	public void addUsers(Users users) {
		try {
			usersMapper.insertUsers(users);
		} catch (Exception e) {
			throw new MyException(e.getMessage());
		}
	}

	/**
	 * 查询上级领导
	 */
	@Override
	public List<Users> findSuperno() {
		List<Users> superno = usersMapper.selectSuperno();
		return superno;
	}

	/**
	 * 查询用户描述
	 */
	@Override
	public List<Users> findUserDesc() {
		List<Users> userDesc = usersMapper.selectUserDesc();
		return userDesc;
	}

	/**
	 * 根据用户描述查询职位编号 部门编号
	 */
	@Override
	public List<Users> findByDesc(String userdesc) {
		List<Users> desc = usersMapper.selectByDesc(userdesc);
		return desc;
	}

	/**
	 * 查询用户名是否重复
	 */
	@Override
	public Users findUname(String uname) {
		Users selectUname =null;
		try {
		selectUname =usersMapper.selectUname(uname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectUname;
	}

	/**
	 * 统计全部数据条数
	 */
	@Override
	public int findCountAll() {
		int countAll = usersMapper.selectCountAll();
		return countAll;
	}

	/**
	 * 根据查询统计条数
	 */
	@Override
	public int findCountByArgs(Users users) {
		int countByArgs = usersMapper.selectCountByArgs(users);
		return countByArgs;
	}
}
