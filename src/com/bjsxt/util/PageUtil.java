package com.bjsxt.util;

import java.util.List;

/**
 * 分页工具类
 * @author Administrator
 *
 */
public class PageUtil {
	/**
	 * 1 数据里面的数据总行数
	 */
	private int rowcount;// 数据里面的数据总行数
	/**
	 *2  一页多少行数据
	 */
	private int pagesize=10;// 一页多少行数据  
	/**
	 * 3 查询起始行    limit startrow,pagesize;
	 */
	private int startrow;//查询起始行    limit startrow,pagesize;
	/**
	 * 4 当前点击的导航
	 */
	private int currnav;//当前点击的导航  
	/**
	 * 5 页面维护的固定导航个数
	 * 		百度的10 
	 * 		 
	 */
	private int navnum;//页面维护的固定导航个数  
	/**
	 * 6 页面数据整体导航个数  总页数
	 */
	private int navcount;//页面数据整体导航个数
	/**
	 * 7 页面展示的起始导航 
	 */
	private int begin;//页面展示的起始导航 
	/**
	 * 8  页面展示的结束导航 
	 */
	private int end;//页面维护展示的结束导航
	/**
	 * 9 上一页
	 */
	private int prev;// 上一页
	/**
	 * 10 下一页
	 */
	private int next;//下一页
	/**
	 * 11首页 
	 */
	private int first=1;//首页 
	/**
	 * 12 尾页
	 */
	private int last;//尾页
	/**
	 * 13 数据
	 */
	private List pageData;//存放分页的数据
	
	

	/**
	 * 
	 */
	public PageUtil() {
		super();
	}


	/**
	 * 必须要传的参数：
	 * 		    
	 * 		数据总行数 （从数据库查询 ） rowcount  ；   维护的导航个数  navnum；
	 *      一页显示的行数 pagesize ； 当前页currnav
	 */
	public PageUtil(int rowcount, int pagesize, int currnav, int navnum) {
		super();
		this.rowcount = rowcount;
		this.pagesize = pagesize;
		this.currnav = currnav;
		this.navnum = navnum;
		/**
		 * 起始行  mysql limit 0 , 10 
		 * 0 
		 */
		this.startrow = (this.currnav -1 )* this.pagesize;
		
		/**
		 * 6 页面数据整体导航个数  总页数
		 * 		所有数据 行数/一页显示的行数
		 * int  navcount = (int)Math.ceil( (rowcount*1.0 ) / pagesize);
		 */
		this.navcount =(int)Math.ceil( (rowcount*1.0 ) / pagesize);
		
		 
		
		/**
		 * 7 页面展示的起始导航  begin
		 * 		1 ，5 比较取最大值    ； -1 1 
		 */
		this.begin = Math.max(1, this.currnav - this.navnum /2);
		
		/**
		 * 和 尾页比较 ；总页数比较 
		 * 		min（a， b）两个值比较取最小
		 * 		
		 */
		this.end = Math.min(this.navcount, this.begin + (this.navnum-1));
		
		/**
		 * 上一页
		 */
		this.prev = Math.max(1,this.currnav -1);
		/**
		 * 下一页
		 */
		this.next = this.currnav + 1;
		
		/**
		 * 首页
		 */
		this.first = 1;
		/**
		 * 尾页
		 */
		this.last = this.navcount;
		
		/**
		 * 处理 begin
		 * 		760  当前页是 75页的时候 ， begin 70  end 76 
		 * 			现在的状态：end-begin 非正常的 76-70 =6 
		 * 		维护的固定导航个数是 10 
		 * 			正常的：end -begin = 9 
		 * 
		 * 		让 6和9比较
		 * 
		 */
		if(this.end - this.begin <9 ){
			//当  一共是 8行数据    -8 <1 
			this.begin =Math.max(1, this.end - (this.navnum-1));
		}
	}
	
	
	/**
	 * @return the rowcount
	 */
	public int getRowcount() {
		return rowcount;
	}

	/**
	 * @param rowcount the rowcount to set
	 */
	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}
	/**
	 * @return the pagesize
	 */
	public int getPagesize() {
		return pagesize;
	}
	/**
	 * @param pagesize the pagesize to set
	 */
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	/**
	 * @return the startrow
	 */
	public int getStartrow() {
		return startrow;
	}
	/**
	 * @param startrow the startrow to set
	 */
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	/**
	 * @return the currnav
	 */
	public int getCurrnav() {
		return currnav;
	}
	/**
	 * @param currnav the currnav to set
	 */
	public void setCurrnav(int currnav) {
		this.currnav = currnav;
	}
	/**
	 * @return the navnum
	 */
	public int getNavnum() {
		return navnum;
	}
	/**
	 * @param navnum the navnum to set
	 */
	public void setNavnum(int navnum) {
		this.navnum = navnum;
	}
	/**
	 * @return the navcount
	 */
	public int getNavcount() {
		return navcount;
	}
	/**
	 * @param navcount the navcount to set
	 */
	public void setNavcount(int navcount) {
		this.navcount = navcount;
	}
	/**
	 * @return the begin
	 */
	public int getBegin() {
		return begin;
	}
	/**
	 * @param begin the begin to set
	 */
	public void setBegin(int begin) {
		this.begin = begin;
	}
	/**
	 * @return the end
	 */
	public int getEnd() {
		return end;
	}
	/**
	 * @param end the end to set
	 */
	public void setEnd(int end) {
		this.end = end;
	}
	/**
	 * @return the prev
	 */
	public int getPrev() {
		return prev;
	}
	/**
	 * @param prev the prev to set
	 */
	public void setPrev(int prev) {
		this.prev = prev;
	}
	/**
	 * @return the next
	 */
	public int getNext() {
		return next;
	}
	/**
	 * @param next the next to set
	 */
	public void setNext(int next) {
		this.next = next;
	}
	/**
	 * @return the first
	 */
	public int getFirst() {
		return first;
	}
	/**
	 * @param first the first to set
	 */
	public void setFirst(int first) {
		this.first = first;
	}
	/**
	 * @return the last
	 */
	public int getLast() {
		return last;
	}
	/**
	 * @param last the last to set
	 */
	public void setLast(int last) {
		this.last = last;
	}
	/**
	 * @return the pageData
	 */
	public List getPageData() {
		return pageData;
	}
	/**
	 * @param pageData the pageData to set
	 */
	public void setPageData(List pageData) {
		this.pageData = pageData;
	}
	
	public static void main(String[] args) {
//		PageUtil pageUtil = new PageUtil(四个参数  );
		//get数据前 ，技术  属性值  ； 最好是 在创建对象的时候计算属性值
//		pageUtil.getBegin();
		int rowcount = 760;//760  8
		int pagesize = 10;
		int currnav = 75;
		int navnum = 10;
		PageUtil pageUtil = new PageUtil(rowcount, pagesize, currnav, navnum);
		System.out.println("起始行索引："+pageUtil.getStartrow());
		System.out.println("begin:"+pageUtil.getBegin());
		System.out.println("当前页："+pageUtil.getCurrnav());
		System.out.println("end:"+pageUtil.getEnd());
		System.out.println("尾页："+pageUtil.getLast());
	}
}







