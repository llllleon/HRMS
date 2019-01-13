package com.bjsxt.pojo;

import java.io.Serializable;

public class Login implements Serializable{
	private String lasttime;
	private String logip;
	private String logname;
	private Integer logid;
	public Login() {
	}
	public Login(String lasttime, String logip, String logname, Integer logid) {
		super();
		this.lasttime = lasttime;
		this.logip = logip;
		this.logname = logname;
		this.logid = logid;
	}
	public Login(String lasttime, String logip, String logname) {
		super();
		this.lasttime = lasttime;
		this.logip = logip;
		this.logname = logname;
	}
	public String getLasttime() {
		return lasttime;
	}
	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}
	public String getLogip() {
		return logip;
	}
	public void setLogip(String logip) {
		this.logip = logip;
	}
	public String getLogname() {
		return logname;
	}
	public void setLogname(String logname) {
		this.logname = logname;
	}
	public Integer getLogid() {
		return logid;
	}
	public void setLogid(Integer logid) {
		this.logid = logid;
	}
	@Override
	public String toString() {
		return "Login [lasttime=" + lasttime + ", logip=" + logip + ", logname=" + logname + ", logid=" + logid + "]";
	}
	
	
	
	
}
