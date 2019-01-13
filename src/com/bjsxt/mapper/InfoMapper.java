package com.bjsxt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Information;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.Users;
import com.bjsxt.pojo.approveinfo;

public interface InfoMapper {

	List<Information> selectAllInfo();

	List<Information> selectByTime(@Param("flag")String flag, @Param("begintimetxt")String begintimetxt, @Param("endtimetxt")String endtimetxt, @Param("checkstatus")String checkstatus,
			@Param("infostatus")String infostatus, @Param("startrow")Integer startrow, @Param("pagesize")Integer pagesize);
//查询部门
	List<Dept> selectDeptInfo();
//查询职位
	List<Position> selectPtypeInfo();
//查询职称
	List<Ptitle> selectPtitleInfo();

	Dept findDeptById(Integer deptno);

	Position findPtypeById(Integer posno);

	Ptitle findPtitleById(Integer ptno);
//添加档案
	void insertInfo(Information information);

	Information selectInfoById(@Param("infono")Integer infono);

	List<Map<String, Object>> selectApproveInfo(Integer infono);

	List<Integer> selectSonUsers(@Param("userno")Integer userno);

	List<Information> selectMyApproveInfo(List<Integer> listSon, @Param("superno")Integer superno);

	List<Information> selectMyApproveFromSuper(Integer superno);

	List<Information> selectMyApproveSon(List<Integer> listSon);

	void addApprove(approveinfo appro);

	void modifyInfo(Information info);

	void deleteInforforerver(Integer infono);

	void deleteInfo(@Param("userno")Integer userno, @Param("infono")Integer infono, @Param("checkstatus")String checkstatus, @Param("uname")String uname);

	void modifyCheckInfo(Information info);

	String selectPhotoByInfoname(String realname);

	Integer selectAllPage();

	List<Information> selectCurrPage(@Param("startrow")int startrow, @Param("pagesize")int pagesize);

	Integer selectPageByTime(@Param("flag")String flag, @Param("begintimetxt")String begintimetxt, @Param("endtimetxt")String endtimetxt, @Param("checkstatus")String checkstatus,
			@Param("infostatus")String infostatus);

	List<String> selectPieByDept();

	List<Integer> selectPieNum();

	List<Map<String, Object>> selectBar();
	
}
