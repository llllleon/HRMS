package com.bjsxt.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;
import com.bjsxt.service.PositionService;
import com.bjsxt.util.MyException;
import com.bjsxt.vo.MsgVo;

@Controller
@RequestMapping("/position")
public class PositionController {

	@Autowired
	private PositionService positionService;
	/**
	 * 查询全部
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAll")
	public String findAll(Model model) {
		List<Position> findAll = positionService.findAll();
		model.addAttribute("findAll", findAll);
		int countAll = positionService.findcountByArgs();
		model.addAttribute("countAll", countAll);
		return "/positionList";
	}
	/**
	 * 插入岗位
	 * @param position
	 * @return
	 */
	@RequestMapping("/addPosition")
	@ResponseBody
	public Object addPositon(Position position) {
		MsgVo mv=null;
		try {
			positionService.addPosition(position);
			mv=new MsgVo("1","添加成功！");
		} catch (MyException e) {
			e.printStackTrace();
			mv=new MsgVo("0","添加失败！");
		}
		return mv;
	}
	/**
	 * 查询职位分类
	 */
	@RequestMapping("/findByPtype")
	public String findByPtype(Model model) {
		List<Position> ptypeList = positionService.findByPtype();
		model.addAttribute("ptypeList", ptypeList);
		int lastPosno = positionService.findLastPosno();
		int posno=lastPosno+1;
		model.addAttribute("posno", posno);
		return "/positionAdd";
	}
	/**
	 * 查询所属部门
	 */
	@RequestMapping("/findDept")
	@ResponseBody
	public Object findDept(){
		List<Dept> deptList = positionService.findDept();
		return deptList;
	}
	/**
	 * 删除记录
	 */
	@RequestMapping("/dropByPosno")
	@ResponseBody
	public Object dropByPosno(Integer posno) {
		MsgVo mv=null;
		try {
			positionService.dropByPosno(posno);
			mv=new MsgVo("1", "删除成功");
			
		} catch (Exception e) {
			e.printStackTrace();
			mv=new MsgVo("0", "删除失败");
		}
		return mv;
	}
	/**
	 * 根据条件进行模糊查询
	 */
	@RequestMapping("/findPoByArgs")
	public String findPoByArgs(Position position,Model model){
		List<Position> findAll = positionService.findPosByArgs(position);
		int countNum = positionService.findcountByArgs(position);
		model.addAttribute("findAll", findAll);
		model.addAttribute("countAll", countNum);
		model.addAttribute("position", position);
		return "/positionList";
	}
}
