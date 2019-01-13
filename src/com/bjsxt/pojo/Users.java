package com.bjsxt.pojo;

import java.io.Serializable;

public class Users implements Serializable{
/*	USERNO   NUMBER(10)                     用户编号 
UNAME    VARCHAR2(100) Y                用户名   
PWD      VARCHAR2(100) Y                密码     
PHONE    VARCHAR2(100) Y                电话     
POSNO    NUMBER(10)    Y                职位编号 
DEPTNO   NUMBER(10)    Y                部门编号 
USERDESC VARCHAR2(100) Y                用户描述 
SUPERNO  NUMBER(10)    Y                上级编号 
REALNAME VARCHAR2(100) Y                真实姓名  */
	
	private Integer userno;
	private String uname;
	private String pwd;
	private String phone;
	private Integer posno;
	private Integer deptno;
	private String userdesc;
	private Integer superno;
	private String realname;
	public Users() {
		super();
	}
	public Users(Integer userno, String uname, String pwd, String phone, Integer posno, Integer deptno, String userdesc,
			Integer superno, String realname) {
		super();
		this.userno = userno;
		this.uname = uname;
		this.pwd = pwd;
		this.phone = phone;
		this.posno = posno;
		this.deptno = deptno;
		this.userdesc = userdesc;
		this.superno = superno;
		this.realname = realname;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getPosno() {
		return posno;
	}
	public void setPosno(Integer posno) {
		this.posno = posno;
	}
	public Integer getDeptno() {
		return deptno;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	public String getUserdesc() {
		return userdesc;
	}
	public void setUserdesc(String userdesc) {
		this.userdesc = userdesc;
	}
	public Integer getSuperno() {
		return superno;
	}
	public void setSuperno(Integer superno) {
		this.superno = superno;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	@Override
	public String toString() {
		return "Users [userno=" + userno + ", uname=" + uname + ", pwd=" + pwd + ", phone=" + phone + ", posno=" + posno
				+ ", deptno=" + deptno + ", userdesc=" + userdesc + ", superno=" + superno + ", realname=" + realname
				+ "]";
	}
	

	
}
