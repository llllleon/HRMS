package com.bjsxt.pojo;

import java.sql.Date;

public class approveinfo {
/*APPROVENO   NUMBER(10)                     审批表编号 
INFONO      NUMBER(10)    Y                档案编号 
USERNO      NUMBER(10)    Y                审批人   
APPROTIME   DATE          Y                审批时间 
CHECKSTATUS VARCHAR2(100) Y                审批状态 
INFOSTATUS  VARCHAR2(100) Y                档案状态 
APPRODESC   VARCHAR2(100) Y                备注描述 */
	
	private Integer approveno;
	private Integer infono;
	private Integer userno;
	private String approtime;
	private String checkstatus;
	private String infostatus;
	private String approdesc;
	public approveinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public approveinfo(Integer approveno, Integer infono, Integer userno, String approtime, String checkstatus,
			String infostatus, String approdesc) {
		super();
		this.approveno = approveno;
		this.infono = infono;
		this.userno = userno;
		this.approtime = approtime;
		this.checkstatus = checkstatus;
		this.infostatus = infostatus;
		this.approdesc = approdesc;
	}
	public Integer getApproveno() {
		return approveno;
	}
	public void setApproveno(Integer approveno) {
		this.approveno = approveno;
	}
	public Integer getInfono() {
		return infono;
	}
	public void setInfono(Integer infono) {
		this.infono = infono;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getApprotime() {
		return approtime;
	}
	public void setApprotime(String approtime) {
		this.approtime = approtime;
	}
	public String getCheckstatus() {
		return checkstatus;
	}
	public void setCheckstatus(String checkstatus) {
		this.checkstatus = checkstatus;
	}
	public String getInfostatus() {
		return infostatus;
	}
	public void setInfostatus(String infostatus) {
		this.infostatus = infostatus;
	}
	public String getApprodesc() {
		return approdesc;
	}
	public void setApprodesc(String approdesc) {
		this.approdesc = approdesc;
	}
	@Override
	public String toString() {
		return "approveinfo [approveno=" + approveno + ", infono=" + infono + ", userno=" + userno + ", approtime="
				+ approtime + ", checkstatus=" + checkstatus + ", infostatus=" + infostatus + ", approdesc=" + approdesc
				+ "]";
	}

	
}
