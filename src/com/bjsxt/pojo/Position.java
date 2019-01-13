package com.bjsxt.pojo;

import java.io.Serializable;

//职位表
public class Position implements Serializable{
	//	POSNO NUMBER(10)                           
	//	PNAME VARCHAR2(100) Y                        
	//	PTYPE VARCHAR2(100) Y                        
	//	PDESC VARCHAR2(100) Y                        
	//	PREMARK VARCHAR2(100) Y                        
	//	STATUS NUMBER(10) Y                        
	//	DEPTNO NUMBER(10) Y
	private Integer posno;	//职位编码
	private String pname;	//职位名称
	private String ptype;	//职位分类
	private String pdesc;	//职位描述
	private String premark;	//备注
	private	String status;	//是否启用
	private Integer deptno;	//组织编码
	public Position() {
		// TODO Auto-generated constructor stub
	}
	public Position(Integer posno, String pname, String ptype, String pdesc, String premark, String status,
			Integer deptno) {
		super();
		this.posno = posno;
		this.pname = pname;
		this.ptype = ptype;
		this.pdesc = pdesc;
		this.premark = premark;
		this.status = status;
		this.deptno = deptno;
	}
	public Integer getPosno() {
		return posno;
	}
	public void setPosno(Integer posno) {
		this.posno = posno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public String getPremark() {
		return premark;
	}
	public void setPremark(String premark) {
		this.premark = premark;
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
	@Override
	public String toString() {
		return "Position [posno=" + posno + ", pname=" + pname + ", ptype=" + ptype + ", pdesc=" + pdesc + ", premark="
				+ premark + ", status=" + status + ", deptno=" + deptno + "]";
	}
	
	
}
