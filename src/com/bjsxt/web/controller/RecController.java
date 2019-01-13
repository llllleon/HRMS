package com.bjsxt.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Recruitment;
import com.bjsxt.service.RecService;
import com.bjsxt.util.MyException;
import com.bjsxt.vo.MsgVo;

@Controller
@RequestMapping("/rec")
public class RecController {
	@Autowired
	private RecService recService;
	
	/**
	 * 添加前的查询
	 * @param model
	 * @return
	 */
	@RequestMapping("/findSomeRec")
	public String findSomeRec(Model model){
		List<Dept> findDeptname = recService.findDeptname();
		List<Recruitment> findRectype = recService.findRectype();
		List<Position> findPname = recService.findPname();
		model.addAttribute("deptName", findDeptname);
		model.addAttribute("recType",findRectype);
		model.addAttribute("pname", findPname);
		return "/recAdd";
	}
	//ajax传参数
	@RequestMapping(value="/findpname")
	@ResponseBody
	public Object findSomeRec(@RequestParam String pname){
		Position position=recService.findP(pname);
		return position;
	}
	
	/**
	 * 添加
	 */
	@RequestMapping("/addRec")
	@ResponseBody
	public Object addRec(Recruitment rec){
		//用对象装属性
//		Recruitment rec=new Recruitment();
//		rec.setDsname(dsname);
//		rec.setRectype(rectype);
//		rec.setPname(pname);
//		rec.setRecnum(recnum);
//		rec.setPosno(posno);
//		rec.setPostype(postype);
//		rec.setUname(uname);
//		rec.setRectime(rectime);
//		rec.setEndtime(endtime);
//		rec.setRecdesc(recdesc);
//		rec.setRequirement(requirement);
		MsgVo mv=null;
		try {
			recService.addRec(rec);
			mv=new MsgVo("1", "添加成功");
		} catch (MyException e) {
			mv=new MsgVo("0", "添加失败");
		}
		return mv;
	} 
	
	/**
	 * 查询所有
	 */
	@RequestMapping("/findAllRec")
	public String findAllRec(Model model){
		List<Recruitment> rec=recService.findAllRec();
		//查询所有条数
		List<Integer> rownum=recService.findRowNum();
		model.addAttribute("rec", rec);
		model.addAttribute("rownum", rownum);
		return "/recList";
	}
	
	/**
	 * 删除当前行
	 */
	@RequestMapping("/dropRec")
	@ResponseBody
	public Object dropRec(Integer recno){
		MsgVo mv=null;
		Integer recno1=recno+1;
		try {
			recService.dropRec(recno,recno1);
			mv=new MsgVo("1", "删除成功");
		} catch (MyException e) {
			mv=new MsgVo("0", "删除失败");
		}
		return mv;
	}
	
	/**
	 * 模糊查询
	 */
	@RequestMapping("/findMyRec")
	public String findMyRec(Model model,Recruitment rec){
		List<Recruitment> findMyRec=recService.findMyRec(rec);
		//查询所有条数
		List<Integer> rownum=recService.findSomeRowNum(rec);
		model.addAttribute("recMor", rec);
		model.addAttribute("rec", findMyRec);
		model.addAttribute("rownum", rownum);
		return "/recList";
	}
	
	/**
	 * 查询Echarts所需的信息
	 */
	@RequestMapping("/findEcharts")
	@ResponseBody
	public Object findEcharts(){
		List<Recruitment> recEchart=recService.findRecEcharts();
		return recEchart;
	}
}
