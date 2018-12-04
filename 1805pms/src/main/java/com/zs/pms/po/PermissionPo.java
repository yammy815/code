package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PermissionPo implements Serializable{

	/**
	 * 网络唯一标识号
	 */
	private static final long serialVersionUID = -3617329900243591175L;

	private int  id; 
	private String pname; 
	private int pid; 
	private int lev; 
	private int isleaf;
	private String url; 
	private String icon;
	
	//第二级列表
		private List<PermissionPo> children=new ArrayList<PermissionPo>();
		
		public List<PermissionPo> getChildren() {
			return children;
		}
		public void setChildren(List<PermissionPo> children) {
			this.children = children;
		}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	
}
