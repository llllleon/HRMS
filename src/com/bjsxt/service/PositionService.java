package com.bjsxt.service;

import java.util.List;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;

public interface PositionService {
	/**
	 * 查询全部
	 * @return
	 */
	List<Position> findAll();

	/**
	 * 插入岗位
	 */
	void addPosition(Position position);
	/**
	 * 查询职位分类
	 */
    List<Position> findByPtype();
    /**
     * 查询所属部门
     */
    List<Dept> findDept();
    /**
     * 查询数据库的最后一条记录
     */
    int findLastPosno();
    /**
     * 删除记录
     */
    void dropByPosno(Integer posno);
    /**
	 *根据条件模糊查询
	 */
	List<Position> findPosByArgs(Position position);
	/**
	 * 根据查询结果统计查询条数
	 */
	int findcountByArgs(Position position);

	/**
	 * 查询全部条数
	 * @return
	 */
	int findcountByArgs();
}
