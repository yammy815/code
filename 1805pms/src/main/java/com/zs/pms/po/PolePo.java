package com.zs.pms.po;

import java.io.Serializable;

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

public class PolePo implements Serializable{

	/**
	 * 网络唯一标识号
	 */
	private static final long serialVersionUID = -5558814313584895895L;

	private int id;
	private String rname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	
}
