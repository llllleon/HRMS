package com.bjsxt.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjsxt.mapper.InfoMapper;
import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Information;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Ptitle;
import com.bjsxt.pojo.Users;
import com.bjsxt.pojo.approveinfo;
import com.bjsxt.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService{
	@Autowired
	private InfoMapper infoMapper;

	@Value("${infocheckstatus.start}")//起草
	private String start;
	@Value("${infocheckstatus.modify}")//修改
	private String modify;
	@Value("${infocheckstatus.changed}")//变更
	private String changed;
	@Value("${infocheckstatus.checkking}")//变更
	private String checkking;
	@Value("${infocheckstatus.pass}")//审核通过
	private String pass;
	@Value("${infocheckstatus.reback}")//驳回
	private String reback;
	@Value("${infocheckstatus.delete}")//删除
	private String delete;
	@Value("${infocheckstatus.deleting}")//删除
	private String deleting;
	@Value("${infostatus.quit}")//离职
	private String quit;
	
	
	//查询全部
	@Override
	public List<Information> findAllInfo() {
		List<Information> allList=infoMapper.selectAllInfo();
		return allList;
	}
	
	//模糊查询
	@Override
	public List<Information> findByTime(String begintimetxt, String endtimetxt, String checkstatus, String infostatus,
			String flag,Integer startrow, Integer pagesize) {
		List<Information> ListByTime=infoMapper.selectByTime(flag,begintimetxt,endtimetxt,checkstatus,infostatus,startrow,pagesize);
		return ListByTime;
	}
//查询部门
	@Override
	public List<Dept> findDept() {
		List<Dept> deptList=infoMapper.selectDeptInfo();
		return deptList;
	}
//查询岗位
	@Override
	public List<Position> findPtype() {
		List<Position> PositionList=infoMapper.selectPtypeInfo();
		return PositionList;
	}
//查询职称
	@Override
	public List<Ptitle> findPtitle() {
		List<Ptitle> PtitleList=infoMapper.selectPtitleInfo();
		return PtitleList;
	}

	@Override
	public Dept findDeptById(Integer deptno) {
		return infoMapper.findDeptById(deptno);
	}

	@Override
	public Position findPtypeById(Integer posno) {
		return infoMapper.findPtypeById(posno);
	}

	@Override
	public Ptitle findPtitleById(Integer ptno) {
		return infoMapper.findPtitleById(ptno);
	}
	
	//添加档案
	@Override
	public void addInfo(Information information) {
		//起草-状态
		information.setCheckstatus(start);
		infoMapper.insertInfo(information);
	}
	
//按编号查询
	@Override
	public Information findInfoById(Integer infono) {
		return infoMapper.selectInfoById(infono);
	}
//查询审核历史
	@Override
	public List<Map<String, Object>> findApproveinfo(Integer infono) {
		return infoMapper.selectApproveInfo(infono);
	}

	@Override
	public List<Integer> findSonUsers(Integer userno) {
		return infoMapper.selectSonUsers(userno);
	}

	@Override
	public List<Information> findMyApproveFromSuper(Integer superno) {
		return infoMapper.selectMyApproveFromSuper(superno);
	}

	@Override
	public List<Information> findMyApproveSon(List<Integer> listSon) {
		return infoMapper.selectMyApproveSon(listSon);
	}
//修改
	@Override
	public void modifyInfo(Information info, String flag) {
		String checkstatus ="";
		if ("update".equals(flag)) {
			checkstatus =modify;//修改
		}else if("change".equals(flag)){
			checkstatus =changed;//变更
		}
		info.setCheckstatus(checkstatus);
		
		infoMapper.modifyInfo(info);
		
		approveinfo appro=new approveinfo();
		appro.setInfono(info.getInfono());//档案编号
		appro.setUserno(info.getUserno());//审核人
		appro.setCheckstatus(info.getCheckstatus());//审核状态
		appro.setInfostatus(info.getInfostatus());//档案状态
		appro.setApprodesc(info.getInforemark());//备注
		//添加审核
		infoMapper.addApprove(appro);
	}
//复核
	@Override
	public void modifyInfoCheck(String flag, String checkstatus, Users user, Information info) {
		approveinfo appro=new approveinfo();
		appro.setInfono(info.getInfono());//档案编号
		appro.setUserno(user.getUserno());//审核人
		appro.setInfostatus(info.getInfostatus());//档案状态
		appro.setApprodesc(info.getInforemark());//备注
		
		//是否通过
		if ("back".equals(flag)) {
			checkstatus =reback;//驳回
		}else if("check".equals(flag)){//复核通过
			//岗位判断
			if (user.getPosno()==2) {//主管
				//业务类型判断
				if (modify.equals(checkstatus)) {//修改 
					checkstatus=pass;
				} else if(changed.equals(checkstatus) || start.equals(checkstatus)){//变更起草
					checkstatus=checkking;
				}
			} else if(user.getPosno()==1){//人事经理
				//业务类型判断
				if (checkking.equals(checkstatus)) {//变更2级审核
					checkstatus=pass;
				} else if(changed.equals(checkstatus)){//1级变更
					checkstatus=pass;
				}else if(delete.equals(checkstatus)){//状态为已删除
					checkstatus=deleting;
				}else if(start.equals(checkstatus)){//状态为起草
					checkstatus=pass.toString();
				}
			}else if(user.getPosno()==200){//总裁
				if (deleting.equals(checkstatus)) {
					infoMapper.deleteInforforerver(info.getInfono());//永久删除
				}
			}
		}
		
		//添加审核表
		appro.setCheckstatus(checkstatus);//审核状态
		infoMapper.addApprove(appro);
		infoMapper.deleteInfo(user.getUserno(),info.getInfono(),checkstatus,user.getUname());
	}

	@Override
	public void modifyMarkInfo(Integer userno, Integer infono,String uname) {
		Information info=infoMapper.selectInfoById(infono);
		String checkstatus =delete;
		//删除标记
		
		approveinfo appro=new approveinfo();
		appro.setInfono(info.getInfono());//档案编号
		appro.setUserno(userno);//审核人
		appro.setInfostatus(info.getInfostatus());//档案状态
		appro.setApprodesc(info.getInforemark());//备注
		appro.setCheckstatus(checkstatus);//审核状态
		//添加审核表
		infoMapper.addApprove(appro);
		infoMapper.deleteInfo(userno,infono,checkstatus,uname);
	}

	@Override
	public String selectPhotoByInfoname(String realname) {
		return infoMapper.selectPhotoByInfoname(realname);
	}

	@Override
	public Integer selectAllPage() {
		return infoMapper.selectAllPage();
	}

	@Override
	public List<Information> selectCurrPage(int startrow, int pagesize) {
		return infoMapper.selectCurrPage(startrow,pagesize);
	}

	@Override
	public Integer selectPageByTime(String begintimetxt, String endtimetxt, String checkstatus, String infostatus,
			String flag) {
			return infoMapper.selectPageByTime(flag,begintimetxt,endtimetxt,checkstatus,infostatus);
	}

	@Override
	public List<String> selectPieByDept() {
		return infoMapper.selectPieByDept();
	}

	@Override
	public List<Integer> selectPieNum() {
		return infoMapper.selectPieNum();
	}

	@Override
	public List<Map<String, Object>> selectBar() {
		return infoMapper.selectBar();
	}

}
