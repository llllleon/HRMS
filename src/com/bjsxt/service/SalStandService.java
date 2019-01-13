package com.bjsxt.service;

import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.SalStand;
import com.bjsxt.pojo.SalStandItem;
import com.bjsxt.pojo.Users;
import com.bjsxt.vo.MsgVo;

public interface SalStandService {

	List<SalStand> findAllSalStand();
	List<Ptitle> findSalStandName();
	List<Users> findCreatno();
	/**
	 * 两表插入
	 */
	MsgVo addSalStand(SalStand salStand,SalStandItem item,String option);
	/**
	 *	条件查询
	 */
	List<SalStand> findStandByCondition(Map<String, Object> map);
	/**
	 *	明细查询
	 */
	Map<String, Object> findSalStandById(String standno);
	MsgVo modifySalStandAudit(SalStand salStand,SalStandItem item,String option);
	/**
	 * 删除标准
	 */
	MsgVo dropSalStand(String standno);
	/**
	 * 导出表格
	 */
	HSSFWorkbook exportSalStand();
	/**
	 * 图表显示
	 */
	List<SalStand> findAllPosMax();
}
