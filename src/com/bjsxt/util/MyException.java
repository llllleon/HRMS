package com.bjsxt.util;

/**
 * @Description: 自定义异常
 * @author lyj
 * @date 2018年11月20日
 *
 */
public class MyException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6562825642180637748L;
	private String msg;
	public MyException() {}
	public MyException(String msg) {
		super();
		this.msg = msg;
	}
}
