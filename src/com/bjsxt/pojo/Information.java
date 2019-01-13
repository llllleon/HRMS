package com.bjsxt.pojo;

import java.io.Serializable;

import java.sql.Date;

public class Information implements Serializable{
//	INFONO        NUMBER(10)                     档案编码       
	private Integer infono;
//	INFONAME      VARCHAR2(100) Y                姓名  
	private String infoname;
//	EMAIL         VARCHAR2(100) Y                邮箱                       
	private String email;
//	ADDRESS       VARCHAR2(100) Y                地址   
	private String address;
//	IDCARD        VARCHAR2(100) Y                身份证                     
	private String idcard;
//	SCHOOL        VARCHAR2(100) Y                毕业院校                   
	private String	school;
//	HOSPITAL      VARCHAR2(100) Y                社保卡号                   
	private String hospital;
//	INFOSTATUS    VARCHAR2(100) Y                档案状态、试用期、正式员工、已离职、已删除、实习员工 
	private String infostatus;
//	SEX           VARCHAR2(100) Y                性别                       
	private String sex;
//	PHONE         VARCHAR2(100) Y                电话 8848                  
	private String phone;
//	HOMEADDRESS         VARCHAR2(100) Y                户口地址                     
	private String homeaddress;
//	PROFESSIONAL  VARCHAR2(100) Y                专业                       
	private String professional;
//	POLITICS      VARCHAR2(100) Y                政治面貌                   
	private String politics;
//	BANK          VARCHAR2(100) Y                开户行                     
	private String bank;
//	USERNO        VARCHAR2(100) Y                登记人     (姓名了哟)                
	private String uname;
//		登记人编号
//	EDUCATION     VARCHAR2(100) Y                学历                       
//	BANKNO        VARCHAR2(100) Y                银行卡号                   
	private String bankno;
//	INFOTIME      DATE          Y                建档时间                   
	private String infotime; 
//	INFORMATION   VARCHAR2(255) Y                个人履历                   
	private String information;
//	INFOReMARK    VARCHAR2(255) Y                备注信息                   
	private String inforemark;
//	INFOFILE      VARCHAR2(255) Y                简历附件（路径名称）        
	private String infofile;
//	PHOTO         VARCHAR2(255) Y                照片（路径）                
	private String photo;
//	PNAME         VARCHAR2(100) Y                职位名称                   
	private String pname;
//	POSNO         NUMBER(10)    Y                职位编码                   
	private Integer posno;
//	DEPTNO        NUMBER(10)    Y                部门编号                   
	private Integer deptno;
//	PTNAME        VARCHAR2(100) Y                薪酬标准（职称名称）        
	private String ptname;
//	PTNO          NUMBER(10)    Y                薪酬标准编码（职称编码）    
	private Integer ptno; 
//	CHECKSTATUS VARCHAR2(100) Y                审核状态、1起草、2审核中、3审核通过、4驳回、5变更审核中 
	private String checkstatus;

//	invalidtime     VARCHAR2(100) Y                合同期限   
	private Integer invalidtime;
//	dsname	String								部门简称
	private String dsname;
	private String education;
	private Integer userno;	
	
	public Information() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Information(Integer infono, String infoname, String email, String address, String idcard, String school,
			String hospital, String infostatus, String sex, String phone, String homeaddress, String professional,
			String politics, String bank, String uname, Integer userno, String education, String bankno,
			String infotime, String information, String inforemark, String infofile, String photo, String pname,
			Integer posno, Integer deptno, String ptname, Integer ptno, String checkstatus, Integer invalidtime,
			String dsname) {
		super();
		this.infono = infono;
		this.infoname = infoname;
		this.email = email;
		this.address = address;
		this.idcard = idcard;
		this.school = school;
		this.hospital = hospital;
		this.infostatus = infostatus;
		this.sex = sex;
		this.phone = phone;
		this.homeaddress = homeaddress;
		this.professional = professional;
		this.politics = politics;
		this.bank = bank;
		this.uname = uname;
		this.userno = userno;
		this.education = education;
		this.bankno = bankno;
		this.infotime = infotime;
		this.information = information;
		this.inforemark = inforemark;
		this.infofile = infofile;
		this.photo = photo;
		this.pname = pname;
		this.posno = posno;
		this.deptno = deptno;
		this.ptname = ptname;
		this.ptno = ptno;
		this.checkstatus = checkstatus;
		this.invalidtime = invalidtime;
		this.dsname = dsname;
	}
	public Integer getInfono() {
		return infono;
	}
	public void setInfono(Integer infono) {
		this.infono = infono;
	}
	public String getInfoname() {
		return infoname;
	}
	public void setInfoname(String infoname) {
		this.infoname = infoname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public String getInfostatus() {
		return infostatus;
	}
	public void setInfostatus(String infostatus) {
		this.infostatus = infostatus;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHomeaddress() {
		return homeaddress;
	}
	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
	}
	public String getPolitics() {
		return politics;
	}
	public void setPolitics(String politics) {
		this.politics = politics;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getBankno() {
		return bankno;
	}
	public void setBankno(String bankno) {
		this.bankno = bankno;
	}
	public String getInfotime() {
		return infotime;
	}
	public void setInfotime(String infotime) {
		this.infotime = infotime;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getInforemark() {
		return inforemark;
	}
	public void setInforemark(String inforemark) {
		this.inforemark = inforemark;
	}
	public String getInfofile() {
		return infofile;
	}
	public void setInfofile(String infofile) {
		this.infofile = infofile;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
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
	public Integer getDeptno() {
		return deptno;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	public String getPtname() {
		return ptname;
	}
	public void setPtname(String ptname) {
		this.ptname = ptname;
	}
	public Integer getPtno() {
		return ptno;
	}
	public void setPtno(Integer ptno) {
		this.ptno = ptno;
	}
	public String getCheckstatus() {
		return checkstatus;
	}
	public void setCheckstatus(String checkstatus) {
		this.checkstatus = checkstatus;
	}
	public Integer getInvalidtime() {
		return invalidtime;
	}
	public void setInvalidtime(Integer invalidtime) {
		this.invalidtime = invalidtime;
	}
	public String getDsname() {
		return dsname;
	}
	public void setDsname(String dsname) {
		this.dsname = dsname;
	}
	@Override
	public String toString() {
		return "Information [infono=" + infono + ", infoname=" + infoname + ", email=" + email + ", address=" + address
				+ ", idcard=" + idcard + ", school=" + school + ", hospital=" + hospital + ", infostatus=" + infostatus
				+ ", sex=" + sex + ", phone=" + phone + ", homeaddress=" + homeaddress + ", professional="
				+ professional + ", politics=" + politics + ", bank=" + bank + ", uname=" + uname + ", userno=" + userno
				+ ", education=" + education + ", bankno=" + bankno + ", infotime=" + infotime + ", information="
				+ information + ", inforemark=" + inforemark + ", infofile=" + infofile + ", photo=" + photo
				+ ", pname=" + pname + ", posno=" + posno + ", deptno=" + deptno + ", ptname=" + ptname + ", ptno="
				+ ptno + ", checkstatus=" + checkstatus + ", invalidtime=" + invalidtime + ", dsname=" + dsname + "]";
	}


}
