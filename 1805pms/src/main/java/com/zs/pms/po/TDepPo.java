package com.zs.pms.po;

import java.io.Serializable;

import com.sun.org.apache.bcel.internal.generic.INEG;

public class TDepPo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3146320438829861616L;

	private int deptno; 
	private String dname; 
	private int pid;
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	
}
