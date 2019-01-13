package com.bjsxt.pojo;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Description：薪资标准
 * @author lyj
 * @date 2018年11月29日
 *
 */
public class SalStand implements Serializable{
	/*
	   number(10)                     薪资标准编号   	
	 varchar2(100) y                薪资标准名称（职称） 	
	standsum  number(7,2)   y                薪资总额             	
	creatno   varchar2(100) y                制定人               	
	uname     varchar2(100) y                登记人（当前用户）   	
	salitemno date          y                登记时间             	
	salupdate varchar2(100) y                变更原因             	
	salaudit  varchar2(100) y                审核状态 起草 审核中 通过  驳回 	
	status    varchar2(100) y                启用状态 */
	/**
	 * 薪资标准编号
	 */
	private Integer standno;                     
	/**
	 *  薪资标准名称（职称） 	
	 */
	private String standname;             
	/**
	 * 薪资总额 
	 */
	private Double standsum;                           	
	/**
	 * 制定人
	 */
	private String creatno ;                              	
	/**
	 * 登记人（当前用户）
	 */
	private String uname;                     	
	/**
	 * 登记时间
	 */
	private String standtime;                   	
	/**
	 * 变更原因
	 */
	private String salupdate;                            	
	/**
	 * 审核状态 起草 通过 驳回
	 */
	private String salaudit;                
	/**
	 * 启用状态 1启用 0停止
	 */
	private String status;  
	/**
	 * 明细表id
	 */
	private Integer salitemno;  
	
	public SalStand() {
	}

	public SalStand(Integer standno, String standname, Double standsum, String creatno, String uname, String standtime,
			String salupdate, String salaudit, String status, Integer salitemno) {
		super();
		this.standno = standno;
		this.standname = standname;
		this.standsum = standsum;
		this.creatno = creatno;
		this.uname = uname;
		this.standtime = standtime;
		this.salupdate = salupdate;
		this.salaudit = salaudit;
		this.status = status;
		this.salitemno = salitemno;
	}

	public Integer getStandno() {
		return standno;
	}

	public void setStandno(Integer standno) {
		this.standno = standno;
	}

	public String getStandname() {
		return standname;
	}

	public void setStandname(String standname) {
		this.standname = standname;
	}

	public Double getStandsum() {
		return standsum;
	}

	public void setStandsum(Double standsum) {
		this.standsum = standsum;
	}

	public String getCreatno() {
		return creatno;
	}

	public void setCreatno(String creatno) {
		this.creatno = creatno;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getStandtime() {
		return standtime;
	}

	public void setStandtime(String standtime) {
		this.standtime = standtime;
	}

	public String getSalupdate() {
		return salupdate;
	}

	public void setSalupdate(String salupdate) {
		this.salupdate = salupdate;
	}

	public String getSalaudit() {
		return salaudit;
	}

	public void setSalaudit(String salaudit) {
		this.salaudit = salaudit;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getSalitemno() {
		return salitemno;
	}

	public void setSalitemno(Integer salitemno) {
		this.salitemno = salitemno;
	}

	@Override
	public String toString() {
		return "SalStand [standno=" + standno + ", standname=" + standname + ", standsum=" + standsum + ", creatno="
				+ creatno + ", uname=" + uname + ", standtime=" + standtime + ", salupdate=" + salupdate + ", salaudit="
				+ salaudit + ", status=" + status + ", salitemno=" + salitemno + "]";
	}
	
	
	
}
