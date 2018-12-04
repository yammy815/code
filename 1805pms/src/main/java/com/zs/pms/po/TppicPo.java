package com.zs.pms.po;

import java.io.Serializable;

public class TppicPo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1454188344486985988L;

	private int id;
	private int pid; 
	private String picurl; 
	private int isdefault;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	public int getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(int isdefault) {
		this.isdefault = isdefault;
	}
	
	
}
