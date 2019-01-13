package com.bjsxt.vo;

public class LoginVo {
	private String uname;
	private String pwd;
	public LoginVo() {
	}
	public LoginVo(String uname, String pwd) {
		super();
		this.uname = uname;
		this.pwd = pwd;
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
	@Override
	public String toString() {
		return "LoginVo [uname=" + uname + ", pwd=" + pwd + "]";
	}
	
}
