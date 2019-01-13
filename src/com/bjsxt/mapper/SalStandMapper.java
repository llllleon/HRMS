package com.bjsxt.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.SalStand;
import com.bjsxt.pojo.SalStandItem;
import com.bjsxt.pojo.Users;

public interface SalStandMapper {

	/**
	 * 查找所有薪酬标准
	 * @return
	 */
	List<SalStand> selectAllSalStand();
	/**
	 * 查找所有薪酬名称
	 * @return
	 */
	List<Ptitle> selectSalStandName();
	/**
	 * 查找薪酬制定人用户名
	 * @return
	 */
	List<Users> selectCreatno();
	/**
	 * 插入前查找下一个主键id值
	 * @return
	 */
	String selectNextItemId();
	/**
	 * 两表插入
	 * @return
	 */
	void insertSalStand(SalStand salStand);
	void insertSalStandItem(SalStandItem item);
	/**
	 * 条件查询
	 * @return
	 */
	List<SalStand> selectStandByCondition(Map<String, Object> map);
	/**
	 *	明细查询
	 */
	SalStand selectSalStandById(String standno);
	SalStandItem selectSalStandItemById(String salitemno);
	
	/**
	 *	审核薪资标准
	 */
	void updateStandToAudit(SalStand salStand);
	void updateStandItemToAudit(SalStandItem item);
	/**
	 *	删除薪资标准
	 */
	void deleteSalStand(String standno);
	void deleteSalStandItem(String salitemno);
	/**
	 *	导出前查询所有
	 */
	List<Map<String, Object>> selectAllForExport();
	/**
	 *	图表显示的查询，各岗位最高薪资
	 */
	List<SalStand> selectAllPosMax();
	
}
