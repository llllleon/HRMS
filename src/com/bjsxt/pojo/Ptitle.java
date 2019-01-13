package com.bjsxt.pojo;

import java.io.Serializable;

//职称标准
public class Ptitle implements Serializable{
/*	PTNO     NUMBER(10)                              
	PTNAME   VARCHAR2(100) Y                         
	PTREMARK VARCHAR2(100) Y                         
	STATUS   NUMBER(10)    Y                         
	DEPTNO   NUMBER(10)    Y                         
	POSNO    NUMBER(10)    Y */  
	
	
	private Integer ptno;//编号
	private String ptname;//职称名称
	private String ptremark;//备注
	private String status;//状态
	private Integer deptno;//所属部门
	
	public Integer getPtno() {
		return ptno;
	}
	public void setPtno(Integer ptno) {
		this.ptno = ptno;
	}
	public String getPtname() {
		return ptname;
	}
	public void setPtname(String ptname) {
		this.ptname = ptname;
	}
	public String getPtremark() {
		return ptremark;
	}
	public void setPtremark(String ptremark) {
		this.ptremark = ptremark;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getDeptno() {
		return deptno;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	public Ptitle(Integer ptno, String ptname, String ptremark, String status, Integer deptno) {
		super();
		this.ptno = ptno;
		this.ptname = ptname;
		this.ptremark = ptremark;
		this.status = status;
		this.deptno = deptno;
	}
	public Ptitle() {
		super();
	}
	@Override
	public String toString() {
		return "Ptitle [ptno=" + ptno + ", ptname=" + ptname + ", ptremark=" + ptremark + ", status=" + status
				+ ", deptno=" + deptno + "]";
	}

}
