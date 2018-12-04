package com.zs.pms.po;

import java.io.Serializable;

import oracle.jdbc.oracore.StreamInfo;

public class ChannlePo implements Serializable{

	/**
	 * 网络唯一标识号
	 */
	private static final long serialVersionUID = 122737337891863664L;

	private int id; 
	private String cname; 
	private int pid;
	private int lev; 
	private int isleaf;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getIsleaf() {
		return isleaf;
	}
	public void setIsleaf(int isleaf) {
		this.isleaf = isleaf;
	}
	
	
}
