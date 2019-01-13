package com.bjsxt.service;

import java.util.List;
import java.util.Map;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Information;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.Users;

public interface InfoService {

	List<Information> findAllInfo();

	List<Information> findByTime(String begintimetxt, String endtimetxt, String checkstatus, String infostatus,
			String flag, Integer startrow, Integer pagesize);

	List<Dept> findDept();

	List<Position> findPtype();

	List<Ptitle> findPtitle();

	Dept findDeptById(Integer deptno);

	Position findPtypeById(Integer posno);

	Ptitle findPtitleById(Integer ptno);

	Information findInfoById(Integer infono);

	void addInfo(Information information);

	List<Map<String, Object>> findApproveinfo(Integer infono);

	List<Integer> findSonUsers(Integer userno);

	List<Information> findMyApproveFromSuper(Integer superno);

	List<Information> findMyApproveSon(List<Integer> listSon);

	void modifyInfo(Information information, String flag);

	void modifyInfoCheck(String flag, String checkstatus, Users user, Information information);

	void modifyMarkInfo(Integer userno, Integer infono, String uname);

	String selectPhotoByInfoname(String realname);

	Integer selectAllPage();

	List<Information> selectCurrPage(int startrow, int pagesize);

	Integer selectPageByTime(String begintimetxt, String endtimetxt, String checkstatus, String infostatus,
			String flag);

	List<String> selectPieByDept();

	List<Integer> selectPieNum();

	List<Map<String, Object>> selectBar();

}
