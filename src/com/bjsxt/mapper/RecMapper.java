package com.bjsxt.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Recruitment;

public interface RecMapper {
	/**
	*添加前查询部门名称
	*/
	List<Dept> selectDeptname();
	/**
	 * 添加前查询招聘类型
	 */
	List<Recruitment> selectRectype();
	/**
	 * 添加前查询岗位名称
	 */
	List<Position> selectPname();
	/**
	 * 根据pname查询其他信息
	 * @param pname
	 * @return
	 */
	Position selectP(String pname);
	/**
	 * 添加招聘信息
	 * @param rec
	 */
	void insertRec(Recruitment rec);
	/**
	 * 查询所有的招聘信息
	 * @return
	 */
	List<Recruitment> selectAllRec();
	/**
	 * 删除当前行
	 * @param recno
	 */
	void deleteRec(@Param("recno")Integer recno,@Param("recno1")Integer recno1);
	/**
	 * 模糊查询
	 * @param rec
	 * @return
	 */
	List<Recruitment> selectMyRec(Recruitment rec);
	/**
	 * 查询行数
	 * @return
	 */
	List<Integer> selectRowNum();
	/**
	 * 查询模糊查询的条数
	 * @return
	 */
	List<Integer> selectSomeRowNum(Recruitment rec);
	/**
	 * rec的echarts
	 * @return
	 */
	List<Recruitment> selectRecEcharts();
}
