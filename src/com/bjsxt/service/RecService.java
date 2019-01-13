package com.bjsxt.service;
/**
 * 招聘的Service接口层
 * @author hd
 *
 */

import java.util.List;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Recruitment;
public interface RecService {
	/**
	 * 添加前查询
	 * @return
	 */
	//添加前查询所有的部门名称
	List<Dept> findDeptname();
	//添加前查询所有的招聘类型
	List<Recruitment> findRectype();
	//添加前查询所有的岗位名称
	List<Position> findPname();
	//根据pname查询其他信息
	Position findP(String pname);
	//添加招聘信息
	void addRec(Recruitment rec);
	//查询所有的招聘信息
	List<Recruitment> findAllRec();
	//删除当前行
	void dropRec(Integer recno,Integer recno1);
	//模糊查询
	List<Recruitment> findMyRec(Recruitment rec);
	//查询总条数
	List<Integer> findRowNum();
	//查询模糊查询条数
	List<Integer> findSomeRowNum(Recruitment rec);
	//查询rec的Echarts
	List<Recruitment> findRecEcharts();
}
