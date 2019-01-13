package com.bjsxt.pojo;

public class Recruitment {
	private Integer recno;//招聘编号
	private String rectype;//招聘 类型
	private Integer recnum;//招聘人数
	private String pname;//岗位名称
	private Integer posno;//岗位编号
	private String postype;//岗位类型
	private String uname;//登记人
	private String rectime;//登记时间
	private String recdesc;//招聘描述
	private String requirement;//招聘要求
	private String dsname;//部门名称
	private String endtime;//截止时间
	public Integer getRecno() {
		return recno;
	}
	public void setRecno(Integer recno) {
		this.recno = recno;
	}
	public String getRectype() {
		return rectype;
	}
	public void setRectype(String rectype) {
		this.rectype = rectype;
	}
	public Integer getRecnum() {
		return recnum;
	}
	public void setRecnum(Integer recnum) {
		this.recnum = recnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getPosno() {
		return posno;
	}
	public void setPosno(Integer posno) {
		this.posno = posno;
	}
	public String getPostype() {
		return postype;
	}
	public void setPostype(String postype) {
		this.postype = postype;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRectime() {
		return rectime;
	}
	public void setRectime(String rectime) {
		this.rectime = rectime;
	}
	public String getRecdesc() {
		return recdesc;
	}
	public void setRecdesc(String recdesc) {
		this.recdesc = recdesc;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getDsname() {
		return dsname;
	}
	public void setDsname(String dsname) {
		this.dsname = dsname;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public Recruitment(Integer recno, String rectype, Integer recnum, String pname, Integer posno, String postype,
			String uname, String rectime, String recdesc, String requirement, String dsname, String endtime) {
		super();
		this.recno = recno;
		this.rectype = rectype;
		this.recnum = recnum;
		this.pname = pname;
		this.posno = posno;
		this.postype = postype;
		this.uname = uname;
		this.rectime = rectime;
		this.recdesc = recdesc;
		this.requirement = requirement;
		this.dsname = dsname;
		this.endtime = endtime;
	}
	public Recruitment() {
		super();
	}
	@Override
	public String toString() {
		return "Recruitment [recno=" + recno + ", rectype=" + rectype + ", recnum=" + recnum + ", pname=" + pname
				+ ", posno=" + posno + ", postype=" + postype + ", uname=" + uname + ", rectime=" + rectime
				+ ", recdesc=" + recdesc + ", requirement=" + requirement + ", dsname=" + dsname + ", endtime="
				+ endtime + "]";
	}
	
}
