package com.bjsxt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.PositionMapper;
import com.bjsxt.pojo.Dept;
import com.bjsxt.pojo.Position;
import com.bjsxt.service.PositionService;
import com.bjsxt.util.MyException;
@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	private PositionMapper positionMapper;
	/**
	 * 查询全部
	 */
	@Override
	public List<Position> findAll() {
		List<Position> selectAll = positionMapper.selectAll();
		return selectAll;
	}
	/**
	 * 添加岗位
	 */
	@Override
	public void addPosition(Position position) {
		try {
			positionMapper.insertPosition(position);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
	}
	/**
	 * 查询职位分类
	 */
	@Override
	public List<Position> findByPtype() {
		List<Position> ptype = positionMapper.selectByPtype();
		return ptype;
	}
	/**
	 * 查询所属部门
	 */
	@Override
	public List<Dept> findDept() {
		List<Dept> selectDept = positionMapper.selectDept();
		return selectDept;
	}
	/**
	 * 查询数据库的最后一条记录
	 */
	@Override
	public int findLastPosno() {
		int posno = positionMapper.selectLastPosno();
		return posno;
	}
	/**
	 * 删除记录
	 */
	@Override
	public void dropByPosno(Integer posno) {
		try {
			positionMapper.deleteByPosno(posno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
	}
	/**
	 * 根据条件模糊查询
	 */
	@Override
	public List<Position> findPosByArgs(Position position) {
		List<Position> posByArgs = positionMapper.selectPosByArgs(position);
		return posByArgs;
	}
	/**
	 * 根据查询结果统计查询条数
	 */
	@Override
	public int findcountByArgs(Position position) {
		int countNum = positionMapper.selectcountByArgs(position);
		return countNum;
	}
	/**
	 * 查询全部
	 */
	@Override
	public int findcountByArgs() {
		int countAll=positionMapper.selectcountAll();
		return countAll;
	}
}
