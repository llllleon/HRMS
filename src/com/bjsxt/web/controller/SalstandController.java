package com.bjsxt.web.controller;

import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.SalStand;
import com.bjsxt.pojo.SalStandItem;
import com.bjsxt.pojo.Users;
import com.bjsxt.service.SalStandService;
import com.bjsxt.util.DateUtil;

@Controller
@RequestMapping("/salstand")
public class SalstandController {
	@Autowired
	private SalStandService salStandService;

	/**
	 * 查找所有薪酬标准
	 * @param map
	 * @return
	 */
	@RequestMapping("/findAllSalstand")
	public String findAllSalstand(ModelMap map){
		List<SalStand> standList = salStandService.findAllSalStand();
		map.addAttribute("standList", standList);
		map.addAttribute("count", standList.size());
		return "/salStandardList";
	}
	
	/**
	 * 添加薪酬标准前，查找信息
	 * @param map
	 * @return
	 */
	@RequestMapping("/findSalStandName")
	public String findInfoToAddSalstand(ModelMap map){
		// 查找薪酬标准名称
		List<Ptitle> pnames = salStandService.findSalStandName();
		// 查找薪酬标准制定人名单
		List<Users> creatnos = salStandService.findCreatno();
		map.addAttribute("pnames", pnames);
		map.addAttribute("creatnos",creatnos);
		// 获取当前时间
		map.addAttribute("standtime",DateUtil.getDateStr());
		return "/salstandardAdd";
	}
	
	/**
	 * 添加薪酬标准
	 * @param map
	 * @return
	 */
	@RequestMapping("/addSalStand")
	@ResponseBody
	public Object addSalstand(@RequestParam(defaultValue="2") String option,SalStand salStand,SalStandItem salStandItem){
		// 接受参数，获得对象
		// 直接返回json对象
		return salStandService.addSalStand(salStand, salStandItem, option);
	}
	
	/**
	 * 条件查询，薪酬标准
	 * @param salStandno	薪酬编号-默认空字符串
	 * @param beginTime	开始时间-默认空字符串
	 * @param endTime	截止时间-默认空字符串
	 * @param auditStatus	审核状态，默认0-全部状态
	 * @return
	 */
	@RequestMapping("/findSalStandByCondition")
	public String findSalstandByCondition(@RequestParam(defaultValue="") String standno,
			@RequestParam(defaultValue="") String beginTime,
			@RequestParam(defaultValue="") String endTime,
			@RequestParam(defaultValue="0") String salaudit,Map<String,Object> map){
		//使用map传递参数
		map.put("standno", standno);
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		map.put("salaudit", salaudit);
		// 调用业务层，在mapper.xml文件中完成条件的判断和拼接
		List<SalStand> standList = salStandService.findStandByCondition(map);
		// modelMap完成数据结果的返回
		map.put("standList", standList);
		// 查询条数
		map.put("count", standList.size());
		// 条件记忆功能，可以直接在map中取得
		return "/salStandardList";
	}
	
	/**
	 * 明细查询
	 * @param salitemno 薪酬标准的主键id
	 * @param map	向前端传递
	 * @return
	 */
	@RequestMapping("/findItem")
	public String findStandItem(String standno,ModelMap map){
		Map<String, Object> standById = salStandService.findSalStandById(standno);
		SalStand salstand = (SalStand)standById.get("salstand");
		SalStandItem standItem = (SalStandItem)standById.get("standItem");
		map.put("salstand", salstand);
		map.put("standItem", standItem);
		return "/salstandItem";
	}
	
	/**
	 * 审核前的查询
	 * @param salitemno 薪酬标准的主键id
	 * @param map	向前端传递
	 * @return
	 */
	@RequestMapping("/toAuditStand")
	public String toAuditStand(String standno,ModelMap map){
		Map<String, Object> standById = salStandService.findSalStandById(standno);
		SalStand salstand = (SalStand)standById.get("salstand");
		SalStandItem standItem = (SalStandItem)standById.get("standItem");
		map.put("salstand", salstand);
		map.put("standItem", standItem);
		return "/salstandAudit";
	}
	
	/**
	 * 审核操作
	 * @return
	 */
	@RequestMapping("/auditStand")
	@ResponseBody
	public Object auditStand(@RequestParam(defaultValue="4") String option,SalStand salStand,SalStandItem salStandItem){
		// 调用service层
		// 直接返回json对象
		return salStandService.modifySalStandAudit(salStand, salStandItem, option);
	}
	
	/**
	 * 删除操作
	 * @param standno 薪酬标准的主键id
	 * @return
	 */
	@RequestMapping("/deleteStand")
	@ResponseBody
	public Object deleteStand(String standno){
		// 调用service层
		// 直接返回json对象
		return salStandService.dropSalStand(standno);
	}
	
	/**
	 * 导出薪酬标准表
	 */
	@RequestMapping("/exportSalStand")
	public void exportSalStand(HttpServletRequest request,HttpServletResponse response){
		// 保存Excel文件
		try {
			HSSFWorkbook workbook = salStandService.exportSalStand();
			//设置 响应类型  tomcat/conf/web.xml 中查询 xls
			response.setContentType("application/vnd.ms-excel");
			String dateStr = DateUtil.getDateStr();
			long time = new Date().getTime();
			Random random=new Random(time);
			String randomstr = random.toString();
			//下载到浏览器客户端  
			response.setHeader("Content-Disposition", "attachment;"
					+ "filename=AllSalStand-"+dateStr+"-"+randomstr+".xls");
			//输出流
			OutputStream outputStream = response.getOutputStream();
			workbook.write(outputStream);
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 图表数据查询,饼图
	 */
	@RequestMapping("/salPieChart")
	@ResponseBody
	public Object findAllSalStandMax(){
		// 调用service层
		// 直接返回json对象
		return salStandService.findAllPosMax();
	}
	
	/**
	 * 图表数据查询,柱状图
	 */
	@RequestMapping("/salBarChart")
	@ResponseBody
	public Object findAllSalStandMaxBar(){
		// 调用service层
		// 直接返回json对象
		return salStandService.findAllPosMax();
	}
	
}
