package com.bjsxt.pojo;

import java.io.Serializable;

/**
 * @Description：薪资标准明细表
 * @author lyj
 * @date 2018年11月29日
 *
 */
public class SalStandItem implements Serializable{
	/*
	salitemno   number(10)                   薪资标准明细表 
	base        number(7,2) y                基本工资  
	comm        number(7,2) y                奖金绩效  
	traffic     number(7,2) y                交通补助  
	mobile      number(7,2) y                通讯补助  
	eat         number(7,2) y                餐补      
	house       number(7,2) y                住房补助  
	travel      number(7,2) y                出差补助  
	overwork    number(7,2) y                加班补助  
	subtract    number(7,2) y                应扣金额  
	standno  	 number（10）					 薪酬标准单编号
	*/
	
	/**
	 * 薪资标准明细表
	 */
	private Integer salitemno; 
	/**
	 * 基本工资 
	 */
	private Double base;                      
	/**
	 * 奖金绩效
	 */
	private Double comm;                       
	/**
	 * 交通补助
	 */
	private Double traffic ;                   
	/**
	 *通讯补助
	 */
	private Double mobile ;                    
	/**
	 * 餐补 
	 */
	private Double eat ;                          
	/**
	 * 住房补助
	 */
	private Double house ;                     
	/**
	 * 出差补助
	 */
	private Double travel ;                    
	/**
	 * 加班补助
	 */
	private Double overwork ;                  
	/**
	 * 应扣金额
	 */
	private Double subtract;  
	
	public SalStandItem() {
	}
	
	public SalStandItem(Integer salitemno, Double base, Double comm,
			Double traffic, Double mobile, Double eat, Double house,
			Double travel, Double overwork, Double subtract) {
		super();
		this.salitemno = salitemno;
		this.base = base;
		this.comm = comm;
		this.traffic = traffic;
		this.mobile = mobile;
		this.eat = eat;
		this.house = house;
		this.travel = travel;
		this.overwork = overwork;
		this.subtract = subtract;
	}

	public SalStandItem(Double base, Double comm,
			Double traffic, Double mobile, Double eat, Double house,
			Double travel, Double overwork ) {
		super();
		this.base = base;
		this.comm = comm;
		this.traffic = traffic;
		this.mobile = mobile;
		this.eat = eat;
		this.house = house;
		this.travel = travel;
		this.overwork = overwork;
	}
	public Integer getSalitemno() {
		return salitemno;
	}
	public void setSalitemno(Integer salitemno) {
		this.salitemno = salitemno;
	}
	public Double getBase() {
		return base;
	}
	public void setBase(Double base) {
		this.base = base;
	}
	public Double getComm() {
		return comm;
	}
	public void setComm(Double comm) {
		this.comm = comm;
	}
	public Double getTraffic() {
		return traffic;
	}
	public void setTraffic(Double traffic) {
		this.traffic = traffic;
	}
	public Double getMobile() {
		return mobile;
	}
	public void setMobile(Double mobile) {
		this.mobile = mobile;
	}
	public Double getEat() {
		return eat;
	}
	public void setEat(Double eat) {
		this.eat = eat;
	}
	public Double getHouse() {
		return house;
	}
	public void setHouse(Double house) {
		this.house = house;
	}
	public Double getTravel() {
		return travel;
	}
	public void setTravel(Double travel) {
		this.travel = travel;
	}
	public Double getOverwork() {
		return overwork;
	}
	public void setOverwork(Double overwork) {
		this.overwork = overwork;
	}
	public Double getSubtract() {
		return subtract;
	}
	public void setSubtract(Double subtract) {
		this.subtract = subtract;
	}

	@Override
	public String toString() {
		return "SalStandardItem [salitemno=" + salitemno + ", base=" + base
				+ ", comm=" + comm + ", traffic=" + traffic + ", mobile="
				+ mobile + ", eat=" + eat + ", house=" + house + ", travel="
				+ travel + ", overwork=" + overwork + ", subtract=" + subtract+ "]";
	}

}
