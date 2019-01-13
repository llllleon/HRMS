package com.bjsxt.vo;

/**
 * @Description：传递结果的对象
 * @author lyj
 * @date 2018年11月20日
 *
 */
public class MsgVo {
	private String code;
	private String info;
	public MsgVo() {
	}
	
	public MsgVo(String code, String info) {
		super();
		this.code = code;
		this.info = info;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "MsgVo [code=" + code + ", info=" + info + "]";
	}
}
