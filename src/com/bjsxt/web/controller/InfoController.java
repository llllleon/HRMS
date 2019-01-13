package com.bjsxt.web.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.MidiDevice.Info;

import java.util.Date;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Information;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.Users;
import com.bjsxt.service.InfoService;
import com.bjsxt.util.MyException;
import com.bjsxt.util.PageUtil;
import com.bjsxt.vo.MsgVo;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	private Logger log = Logger.getLogger(InfoController.class);
	
	//查询全部
	@RequestMapping("/findAllInfo")
	public String findAllInfo(ModelMap modelmap){
		List<Information> allList = infoService.findAllInfo();
		modelmap.addAttribute("allList",allList);
		return "information-list";
	}
	//模糊查询
	@RequestMapping("/findByTime")
	public String findByTime(ModelMap modelmap,String flag,String checkstatus,String infostatus,String begintimetxt,String endtimetxt,Integer currnav){
		List<Information> allList =null;
	//	if (!"".equals(begintimetxt) || !"".equals(endtimetxt) || !"".equals(checkstatus)|| !"".equals(infostatus)) {
			//先查总行数
			Integer rowcount =infoService.selectPageByTime(begintimetxt,endtimetxt,checkstatus,infostatus,flag);
			//再拿取所有
			Integer pagesize =5 ;//一页5行
			Integer navnum = 5 ;
			PageUtil pageUtil = new PageUtil(rowcount, pagesize, currnav, navnum );
			//查询当前页的信息(起始行,一页行数)
			modelmap.addAttribute("pageUtil", pageUtil);
			//逻辑判断，数据集合
			allList = infoService.findByTime(begintimetxt,endtimetxt,checkstatus,infostatus,flag,pageUtil.getStartrow(),pageUtil.getPagesize());
			modelmap.addAttribute("allList",allList);
			modelmap.addAttribute("checkstatus", checkstatus);
			modelmap.addAttribute("infostatus", infostatus);
			modelmap.addAttribute("begintimetxt",begintimetxt);
			modelmap.addAttribute("endtimetxt",endtimetxt);
	/*	} else {//查询全部
			allList = infoService.findAllInfo();
			modelmap.addAttribute("allList",allList);
		}*/
		return "information-list";
	}
	//下拉菜单的展示-部门，岗位，职称
	@RequestMapping("/findDeptPosPt")
	public String findDeptPosPt(ModelMap modelmap){
		List<Dept> findDept = infoService.findDept();//部门
		List<Position> findPtype = infoService.findPtype();//岗位
		List<Ptitle> findPtitle = infoService.findPtitle();//职称
		modelmap.addAttribute("finddept",findDept);
		modelmap.addAttribute("findPtype",findPtype);
		modelmap.addAttribute("findPtitle",findPtitle);
		
		Calendar cal = Calendar.getInstance();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String infotime= sdf.format(cal.getTime());
		 modelmap.addAttribute("infotime",infotime);
		return "information-add";
	}
	//新增档案
	@RequestMapping("/addInfo")
	public String addInfo(Information information,@RequestParam(value="fileResume")MultipartFile fileResume,@RequestParam(value="filePhoto")MultipartFile filePhoto,HttpServletRequest req){
		String fileNameResume = fileResume.getOriginalFilename();//test.doc
		String pathResume="D:/upload/resume/"+fileNameResume;
		File  filePathResume = new File(pathResume);
		try {
			fileResume.transferTo(filePathResume);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String fileNamePhoto = filePhoto.getOriginalFilename();//test.doc
		String pathPhoto="D:/upload/photo/"+fileNamePhoto;
		File  filePathPhoto = new File(pathPhoto);
		try {
			filePhoto.transferTo(filePathPhoto);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		//pname(posno),,,ptname(ptno)、、、dsname(deptno),,,,checkstatus,,,username(拿取),,,,infono(自增)
		//照片与简历
		information.setInfofile(pathResume);
		information.setPhoto(pathPhoto);
		//单项查询出
		Dept dept=infoService.findDeptById(information.getDeptno());
		Position position=infoService.findPtypeById(information.getPosno());
		Ptitle ptitle=infoService.findPtitleById(information.getPtno());
		information.setDsname(dept.getDsname());
		information.setPname(position.getPname());
		information.setPtname(ptitle.getPtname());
		//登记人
		Users user=(Users)req.getSession().getAttribute("user");
		information.setUname(user.getUname());
		information.setUserno(user.getUserno());
		infoService.addInfo(information);
		return "forward:/info/findAllInfo";
	}
	
	//校核照片
	@RequestMapping("/displayPhoto")
	@ResponseBody
	public Object displayPhoto(ModelMap modelmap,@RequestParam(value="filePhoto")MultipartFile filePhoto,HttpServletResponse response,HttpServletRequest request){
		String fileNamePhoto = filePhoto.getOriginalFilename();//test.doc
		ServletContext sc = request.getServletContext();
		String pathPhoto = sc.getRealPath("/img/"+fileNamePhoto);//新的路径
		File  filePathPhoto = new File(pathPhoto);
		if(filePathPhoto.exists()){
			filePathPhoto.delete();
		}
		MsgVo mv=null;
		
		//判断后缀--左闭右开--转小写
		String fileExt = fileNamePhoto.substring(fileNamePhoto.lastIndexOf(".") + 1, fileNamePhoto.length()).toLowerCase();
		if (!"jpg".equals(fileExt) && !"jpeg".equals(fileExt) && !"png".equals(fileExt) && !"bmp".equals(fileExt)
				&& !"gif".equals(fileExt)) {
			mv=new MsgVo("0", "照片类型不对！！！");
			return mv;
		}
		//判断大小
		long fileSize = filePhoto.getSize();
		if (fileSize <= 0) {
			mv=new MsgVo("0", "照片为空！！！");
			return mv;
		} else if (fileSize > (200 * 1024)) {
			mv=new MsgVo("0","上传失败:文件大小不能超过200K");
			return mv;
		}
		
		try {
			filePhoto.transferTo(filePathPhoto);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			BufferedImage sourceImg = ImageIO.read(new FileInputStream(filePathPhoto));
            int imgWidth = sourceImg.getWidth();
            int imgHeight = sourceImg.getHeight();
            if (imgWidth>=295 || imgHeight>=413) {
            	mv=new MsgVo("0","上传失败:尺寸不对！！！");
    			return mv;
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		mv=new MsgVo("1", fileNamePhoto);
		return mv;
	}
	//修改界面的展示
	@RequestMapping("/modifyInfo")
	public String modifyInfo(ModelMap modelmap,@RequestParam(value="infono")Integer infono,@RequestParam(value="checkMine")String checkMine){
		//按编号查询档案
		Information info=infoService.findInfoById(infono);
		List<Dept> findDept = infoService.findDept();//部门
		List<Position> findPtype = infoService.findPtype();//岗位
		List<Ptitle> findPtitle = infoService.findPtitle();//职称
		modelmap.addAttribute("finddept",findDept);
		modelmap.addAttribute("findPtype",findPtype);
		modelmap.addAttribute("findPtitle",findPtitle);
		modelmap.addAttribute("info",info);
		modelmap.addAttribute("checkmine", checkMine);
		return "forward:/information-update";
	}
//查看档案的审批历史
	@RequestMapping("/findApproveInfo")
	public String findApproveInfo(@RequestParam(value="infono")Integer infono,ModelMap modelmap){
		//按编号查询
		List<Map<String, Object>> appro= infoService.findApproveinfo(infono);
		log.debug(appro);
		modelmap.addAttribute("Appro", appro);
		return "forward:/information-approveinfo";
	}
//查看我自己的审批findMyApproveinfo
	@RequestMapping("/findMyApproveinfo")
	public String findMyApproveinfo(ModelMap modelmap,HttpServletRequest req){
		Users user=(Users)req.getSession().getAttribute("user");
		List<Integer> listSon=infoService.findSonUsers(user.getUserno());//下级编号
		List<Information> allList=new ArrayList<>();
		if(listSon.size()>0){
			List<Information> allListSon = infoService.findMyApproveSon(listSon);//下级提交
			allList.addAll(allListSon);
		}
		if(user.getSuperno()>0){
			List<Information> allListSuper = infoService.findMyApproveFromSuper(user.getSuperno());//上级驳回
			allList.addAll(allListSuper);
		}
		log.debug(allList);
		modelmap.addAttribute("allList", allList);
	return "forward:/information-MyApprove";
	}
//修改变更
	@RequestMapping("/MyupdateInformation")
	@ResponseBody
	public Object MyupdateInformation(ModelMap modelmap,Information information,String flag,@RequestParam(value="fileResume")MultipartFile fileResume,HttpServletResponse response,HttpServletRequest req){
		Information info1=infoService.findInfoById(information.getInfono());
		String infofile = info1.getInfofile();//原有简历
		//照片判断
		String fileNameResume = fileResume.getOriginalFilename();//test.doc
		String pathResume="D:/upload/resume/"+fileNameResume;
		Users user=(Users)req.getSession().getAttribute("user");
		if (!(infofile.equals(pathResume))) {//改了就更新
			try {
				new File(infofile).delete();
				File  filePathResume = new File(pathResume);
				fileResume.transferTo(filePathResume);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			information.setInfofile(pathResume);//简历
		}
		information.setUname(user.getUname());//登记人
		information.setUserno(user.getUserno());//登记人编号
		//单项查询出
		Dept dept=infoService.findDeptById(information.getDeptno());
		information.setDsname(dept.getDsname());
		Position position=infoService.findPtypeById(information.getPosno());
		information.setPname(position.getPname());
		Ptitle ptitle=infoService.findPtitleById(information.getPtno());
		information.setPtname(ptitle.getPtname());
		MsgVo mv=null;
		try{
			infoService.modifyInfo(information,flag);
			mv=new MsgVo("1", "修改成功");
		}catch(Exception e){
			e.printStackTrace();
			mv=new MsgVo("0", "出现异常，失败");
		}finally {
			return mv;
		}
	}
	
	//变更
		@RequestMapping("/MychangeInformation")
		@ResponseBody
		public Object MychangeInformation(ModelMap modelmap,Information information,String flag,HttpServletRequest req){
			Users user=(Users)req.getSession().getAttribute("user");
			information.setUname(user.getUname());//登记人
			information.setUserno(user.getUserno());//登记人编号
			Information info1=infoService.findInfoById(information.getInfono());
			String infofile = info1.getInfofile();//原有简历
			information.setInfofile(infofile);
			//单项查询出
			Dept dept=infoService.findDeptById(information.getDeptno());
			information.setDsname(dept.getDsname());
			Position position=infoService.findPtypeById(information.getPosno());
			information.setPname(position.getPname());
			Ptitle ptitle=infoService.findPtitleById(information.getPtno());
			information.setPtname(ptitle.getPtname());
			MsgVo mv=null;
			try{
				infoService.modifyInfo(information,flag);
				mv=new MsgVo("1", "修改成功");
			}catch(Exception e){
				e.printStackTrace();
				mv=new MsgVo("0", "出现异常，失败");
			}finally {
				return mv;
			}
		}
	//复核与驳回
	@RequestMapping("/backCheckInformation")
	@ResponseBody
	private Object backCheckInformation(Information information,String flag,@RequestParam(value="infono")Integer infono,@RequestParam(value="checkstatus")String checkstatus,HttpServletRequest req){
		//登记人
		Users user=(Users)req.getSession().getAttribute("user");
		int userno=user.getUserno();
		int posno = user.getPosno();
		
		MsgVo mv=null;
		try{
			infoService.modifyInfoCheck(flag,checkstatus,user,information);
			mv=new MsgVo("1", "修改成功");
		}catch(Exception e){
			e.printStackTrace();
			mv=new MsgVo("0", "出现异常，失败");
		}finally {
			return mv;
		}
	}
//删除
	@RequestMapping("/deleteInformation")
	@ResponseBody
	public Object deleteInformation(@RequestParam(value="infono")Integer infono,HttpServletRequest req){
		//登记人
		Users user=(Users)req.getSession().getAttribute("user");
		Integer userno=user.getUserno();
		String uname=user.getUname();
		log.debug(user+""+infono);
		MsgVo mv=null;
		try{
			infoService.modifyMarkInfo(userno,infono,uname);
			mv=new MsgVo("1", "标记删除成功");
		}catch(Exception e){
			e.printStackTrace();
			mv=new MsgVo("0", "出现异常，失败");
		}finally {
			return mv;
		}
	}
	
/*	//我的个人信息
		@RequestMapping("/findApproveInfo")
		public String displayMe(ModelMap modelmap,HttpServletRequest req){
			//登记人
			Users user=(Users)req.getSession().getAttribute("user");
			//拿取照片
			String photo=infoService.selectPhotoByInfoname(user.getRealname());
			modelmap.addAttribute("User", user);
			return "forward:/information-approveinfo";
		}*/
	
/*	@RequestMapping("/infoPage")
	public String InfoPage(Integer currnav,ModelMap modelMap){
		//先查总行数
		Integer rowcount =infoService.selectAllPage();
		//再拿取所有
		Integer pagesize =5 ;//一页5行
		Integer navnum = 5 ;
		PageUtil pageUtil = new PageUtil(rowcount, pagesize, currnav, navnum );
		//查询当前页的信息(起始行,一页行数)
		List<Information> allList=infoService.selectCurrPage(pageUtil.getStartrow(),pageUtil.getPagesize());
		modelMap.addAttribute("pageUtil", pageUtil);
		modelMap.addAttribute("allList", allList);
		return "information-list";
	}*/
	
	@RequestMapping("/chartsByDept")
	@ResponseBody
	public Object chartsPieByDept(){
		//根据部门汇总
		List<Map<String, Object>> BarList=infoService.selectBar();
/*		
			for (Map map : BarList) {
				Set set = map.keySet();
				Iterator it = set.iterator();
		
			}*/
			return BarList;
	}
}
