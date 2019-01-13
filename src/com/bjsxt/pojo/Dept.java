package com.bjsxt.pojo;

public class Dept {
	//	DEPTNO NUMBER(10)                  部门编号 
	//	DSNAME VARCHAR2(100) Y               部门简称 
	//	DANAME VARCHAR2(100) Y               部门全称 
	//	SUPDEPT VARCHAR2(100) Y               所属部门（上级部门） 
	//	LOCATION VARCHAR2(100) Y               地理位置 
	//	DREMARK VARCHAR2(100) Y               部门备注 
	//	STATUS NUMBER(10) Y         
	private  Integer deptno;
	private String dsname;
	private String daname;
	private String supdept;
	private String location;
	private String dremark;
	private String status;
	public int getDeptno() {
		return deptno;
	}
	public Dept(Integer deptno, String dsname, String daname, String supdept, String location, String dremark,
			String status) {
		super();
		this.deptno = deptno;
		this.dsname = dsname;
		this.daname = daname;
		this.supdept = supdept;
		this.location = location;
		this.dremark = dremark;
		this.status = status;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDsname() {
		return dsname;
	}
	public void setDsname(String dsname) {
		this.dsname = dsname;
	}
	public String getDaname() {
		return daname;
	}
	public void setDaname(String daname) {
		this.daname = daname;
	}
	public String getSupdept() {
		return supdept;
	}
	public void setSupdept(String supdept) {
		this.supdept = supdept;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDremark() {
		return dremark;
	}
	public void setDremark(String dremark) {
		this.dremark = dremark;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	public Dept() {
		super();
	}
	@Override
	public String toString() {
		return "Dept [deptno=" + deptno + ", dsname=" + dsname + ", daname="
				+ daname + ", supdept=" + supdept + ", location=" + location
				+ ", dremark=" + dremark + ", status=" + status + "]";
	}

	
}
