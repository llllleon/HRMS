package com.bjsxt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.RecMapper;
import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;
import com.bjsxt.pojo.Recruitment;
import com.bjsxt.service.RecService;
import com.bjsxt.util.MyException;
@Service
public class RecServiceImpl implements RecService{
	@Autowired
	private RecMapper recMapper;
	/**
	 * 添加前的查询
	 */
	@Override
	public List<Dept> findDeptname() {
		List<Dept> selectDeptname = recMapper.selectDeptname();
		return selectDeptname;
	}
	@Override
	public List<Recruitment> findRectype() {
		List<Recruitment> selectRectype = recMapper.selectRectype();
		return selectRectype;
	}
	@Override
	public List<Position> findPname() {
		List<Position> selectPname = recMapper.selectPname();
		return selectPname;
	}
	//根据pname查询其他信息
	@Override
	public Position findP(String pname) {
		Position position=recMapper.selectP(pname);
		return position;
	}
	
	//添加招聘信息
	@Override
	public void addRec(Recruitment rec) {
		try {
			recMapper.insertRec(rec);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
		
	}
	//查询所有的招聘信息
	@Override
	public List<Recruitment> findAllRec() {
		List<Recruitment> selectAllRec=recMapper.selectAllRec();
		return selectAllRec;
	}
	//删除当前行
	@Override
	public void dropRec(Integer recno,Integer recno1) {
		try {
			recMapper.deleteRec(recno,recno1);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
		
	}
	//模糊查询
	@Override
	public List<Recruitment> findMyRec(Recruitment rec) {
		List<Recruitment> selectMyRec=recMapper.selectMyRec(rec);
		return selectMyRec;
	}
	
	//查询行数
	@Override
	public List<Integer> findRowNum() {
		List<Integer> rownum=recMapper.selectRowNum();
		return rownum;
	}
	
	//查询模糊查询的条数
	@Override
	public List<Integer> findSomeRowNum(Recruitment rec) {
		List<Integer> rownum=recMapper.selectSomeRowNum(rec);
		return rownum;
	}
	//查询rec的Echarts
	@Override
	public List<Recruitment> findRecEcharts() {
		List<Recruitment> recEcharts=recMapper.selectRecEcharts();
		return recEcharts;
	}

}
