package com.bjsxt.service.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.SalStandMapper;
import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.SalStand;
import com.bjsxt.pojo.SalStandItem;
import com.bjsxt.pojo.Users;
import com.bjsxt.service.SalStandService;
import com.bjsxt.util.MyException;
import com.bjsxt.vo.MsgVo;
@Service
public class SalStandServiceImpl implements SalStandService {
	@Autowired
	private SalStandMapper salStandMapper;

	/**
	 * 审核中-1
	 */
	@Value("${salaudit.toaudit}")
	private String toAudit;

	/**
	 * 起草-2
	 */
	@Value("${salaudit.draft}")
	private String draft;

	/**
	 * 通过-3
	 */
	@Value("${salaudit.permit}")
	private String permit;

	/**
	 * 驳回-4
	 */
	@Value("${salaudit.reject}")
	private String reject;

	/**
	 * ajax失败，通知信息
	 */
	@Value("${msg.errorInfo}")
	private String errorInfo;

	/**
	 * ajax成功，通知信息
	 */
	@Value("${msg.successInfo}")
	private String successInfo;

	/**
	 * 查找所有薪资标准
	 */
	@Override
	public List<SalStand> findAllSalStand() {
		return salStandMapper.selectAllSalStand();
	}

	/**
	 * 查找薪资标准名称
	 */
	@Override
	public List<Ptitle> findSalStandName() {
		return salStandMapper.selectSalStandName();
	}

	/**
	 * 查找薪资标准制定人的用户名
	 */
	@Override
	public List<Users> findCreatno() {
		return salStandMapper.selectCreatno();
	}
	/**
	 * 两表插入
	 */
	@Override
	public MsgVo addSalStand(SalStand salStand, SalStandItem item, String option) {
		MsgVo msgVo=new MsgVo("0", errorInfo);
		// 接受参数，获得对象
		try {
			//插入前查找下一个主键id值
			String salitemno = salStandMapper.selectNextItemId();
			// 插入明细表
			salStandMapper.insertSalStandItem(item);
			// 设置插入的外键值
			salStand.setSalitemno(Integer.valueOf(salitemno));
			// 通过option判断审核状态
			if("1".equals(option)){
				salStand.setSalaudit(toAudit);
			}else if("2".equals(option)){
				salStand.setSalaudit(draft);
			}
			// 插入薪酬标准的主表
			salStandMapper.insertSalStand(salStand);
			msgVo=new MsgVo("1", successInfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
		return msgVo;
	}

	/**
	 * 条件查询
	 */
	@Override
	public List<SalStand> findStandByCondition(Map<String, Object> map) {
		return salStandMapper.selectStandByCondition(map);
	}
	/**
	 * 明细查询
	 */
	@Override
	public Map<String,Object> findSalStandById(String standno) {
		SalStand salStand = salStandMapper.selectSalStandById(standno);
		Integer salitemno = salStand.getSalitemno();
		SalStandItem standItem = salStandMapper.selectSalStandItemById(salitemno.toString());
		Map<String,Object> map=new HashMap<>();
		map.put("salstand", salStand);
		map.put("standItem", standItem);
		return map;
	}
	/**
	 * 审核薪酬标准
	 */
	@Override
	public MsgVo modifySalStandAudit(SalStand salStand, SalStandItem item, String option) {
		MsgVo msgVo=new MsgVo("0", errorInfo);
		try {
			// 通过option判断审核状态
			if("3".equals(option)){
				salStand.setSalaudit(permit);
			}else if("4".equals(option)){
				salStand.setSalaudit(reject);
			}
			Integer salitemno = salStand.getSalitemno();
			item.setSalitemno(salitemno);
			// 更新标准表和明细表状态
			salStandMapper.updateStandToAudit(salStand);
			salStandMapper.updateStandItemToAudit(item);
			msgVo=new MsgVo("1", successInfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
		return msgVo;
	}

	@Override
	public MsgVo dropSalStand(String standno) {
		MsgVo msgVo=new MsgVo("0", errorInfo);
		try {
			// 删除之前查询一次标准表
			SalStand salStand = salStandMapper.selectSalStandById(standno);
			// 获得明细表的外键id值
			Integer salitemno = salStand.getSalitemno();
			// 通过id删除标准表
			salStandMapper.deleteSalStand(standno);
			// 通过id删除明细表
			salStandMapper.deleteSalStandItem(salitemno.toString());
			msgVo=new MsgVo("1", successInfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
		return msgVo;
	}

	
	@Override
	public HSSFWorkbook exportSalStand() {
		// 1 创建一个Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook();
		//2  创建一个工作表
		HSSFSheet sheet = workbook.createSheet("薪酬标准表");

		// 合并 单元格    按照行或列合并单元格
		CellRangeAddress region = new CellRangeAddress(0, 0, 0, 14);
		sheet.addMergedRegion(region);

		//3 创建  行
		HSSFRow hssfRow = sheet.createRow(0);
		//4 创建单元格
		HSSFCell headCell = hssfRow.createCell(0);
		headCell.setCellValue("薪酬标准表一");

		// 设置单元格格式居中
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        HSSFFont font = workbook.createFont();
        font.setFontName("楷体"); //字体
        
		headCell.setCellStyle(cellStyle);

		// 添加表头行
		hssfRow = sheet.createRow(1);
		//5  添加表头内容
		//用户名	真实姓名	所属部门	出勤日期	签到时间	签退时间  6列
		headCell = hssfRow.createCell(0);
		headCell.setCellValue("薪酬编号");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(1);
		headCell.setCellValue("薪酬标准名称");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(2);
		headCell.setCellValue("薪资总计");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(3);
		headCell.setCellValue("制定人");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(4);
		headCell.setCellValue("登记人");
		headCell.setCellStyle(cellStyle);

		headCell = hssfRow.createCell(5);
		headCell.setCellValue("登记时间");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(6);
		headCell.setCellValue("审核状态");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(7);
		headCell.setCellValue("基础工资");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(8);
		headCell.setCellValue("绩效奖金");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(9);
		headCell.setCellValue("交通补助");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(10);
		headCell.setCellValue("通信补助");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(11);
		headCell.setCellValue("餐补");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(12);
		headCell.setCellValue("住房补助");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(13);
		headCell.setCellValue("出差补助");
		headCell.setCellStyle(cellStyle);
		
		headCell = hssfRow.createCell(14);
		headCell.setCellValue("加班补助");
		headCell.setCellStyle(cellStyle);

		//查询数据
		List<Map<String,Object>> list = salStandMapper.selectAllForExport();
		// 添加数据内容
		for (int i = 0; i < list.size(); i++) {
			hssfRow = sheet.createRow((int) i + 2);
			Map<String, Object> map = list.get(i);

			// 创建单元格，并设置值
			HSSFCell cell = hssfRow.createCell(0);
			cell.setCellValue(map.get("standno").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(1);
			cell.setCellValue(map.get("standname").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(2);
			cell.setCellValue(map.get("standsum").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(3);
			cell.setCellValue(map.get("creatno").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(4);
			cell.setCellValue(map.get("uname").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(5);
			cell.setCellValue(map.get("standtime").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(6);
			cell.setCellValue(map.get("salaudit").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(7);
			cell.setCellValue(map.get("base").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(8);
			cell.setCellValue(map.get("comm").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(9);
			cell.setCellValue(map.get("traffic").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(10);
			cell.setCellValue(map.get("mobile").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(121);
			cell.setCellValue(map.get("eat").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(12);
			cell.setCellValue(map.get("house").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(13);
			cell.setCellValue(map.get("travel").toString());
			cell.setCellStyle(cellStyle);
			
			cell = hssfRow.createCell(14);
			cell.setCellValue(map.get("overwork").toString());
			cell.setCellStyle(cellStyle);

		}
		return workbook;
	}
	/**
	 * 图表数据查询
	 */
	@Override
	public List<SalStand> findAllPosMax() {
		List<SalStand> list = salStandMapper.selectAllPosMax();
		return list;
	}

}
