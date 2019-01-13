package com.bjsxt.mapper;

import java.util.List;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;

public interface PositionMapper {
	
	/**
	 * 查询全部
	 */
	List<Position> selectAll();

	/**
	 * 插入
	 */
	void insertPosition(Position position);
	/**
	 * 查询职位分类
	 */
	List<Position> selectByPtype();
	/**
	 * 查询所属部门
	 */
	List<Dept> selectDept();
	/**
	 * 查询数据库的最后一条记录
	 */
	int selectLastPosno();
	/**
	 * 删除数据
	 */
	void deleteByPosno(Integer posno);
	/**
	 * 根据条件模糊查询
	 */
	List<Position> selectPosByArgs(Position position);
	/**
	 * 根据查询结果统计查询条数
	 */
	int selectcountByArgs(Position position);
	/**
	 * 查询全部条数
	 */
	int selectcountAll();
}
