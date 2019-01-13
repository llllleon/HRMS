package com.bjsxt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bjsxt.pojo.Login;
import com.bjsxt.pojo.Users;

public interface LogMapper {
	/**
	 * 登录验证
	 * @param users
	 * @return
	 */
	Users selectUsersForLog(Users users);
	/**
	 * 登陆日志添加
	 * @param login
	 */
	void insertLoginInfo(Login login);
	
	/**
	 * 登陆日志显示
	 * @return
	 */
	Login selectLogInfo();
	
	/**
	 * 登陆日志查询数据总量
	 * @return
	 */
	Integer selectLogList();
	
	/**
	 * 登陆日志查询，分页
	 * @return
	 */
	List<Map<String, Object>> selectLogListByPage(Integer index,Integer count);
	
	/**
	 * 登陆日志模糊查询数据总量
	 * @return
	 */
	Integer selectLogByCondition(@Param("logname") String logname,
			@Param("beginTime") String beginTime, @Param("endTime") String endTime);
	
	/**
	 * 登陆日志模糊查询，分页
	 * @return
	 */
	List<Map<String, Object>> selectLogByConditionWithPage(@Param("logname") String logname,
			 @Param("beginTime") String beginTime, @Param("endTime") String endTime,
					 @Param("index") Integer index, @Param("count") Integer count);
	
	/**
	 * 菜单权限查询
	 * @return
	 */
	List<Map<String,Object>> selectUserRoleMenu(Users users);
	
}
