package com.zs.pms.vo;

public class QueryUser extends QueryPage {

	private String loginname;
	private String password;
	private int isenable;
	private String sex;
	private String identity;
	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getIsenable() {
		return isenable;
	}

	public void setIsenable(int isenable) {
		this.isenable = isenable;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

}
