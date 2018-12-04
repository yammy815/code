package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zs.pms.utils.DateUtil;

public class  UserPo implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = -7856115097737552254L;
	
	private int id;
	private String loginname;
	private String password;
	private String sex;
	private Date birthday; 
	//用于显示
	private String birthdayTxt;
	
	private String email;
	private String isenabled;
	public String getIsenabled() {
		if (isenable==1) {
			return "可用";
		}else {
			return  "不可用";
		}
		
	}
	public void setIsenabled(String isenabled) {
		this.isenabled = isenabled;
	}
	//关联对象
	private TDepPo deptno; 

	
	public TDepPo getDeptno() {
		return deptno;
	}
	public void setDeptno(TDepPo deptno) {
		this.deptno = deptno;
	}
	//关联权限列表  一对多
	private List<PermissionPo> permissions;
	
	public List<PermissionPo> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<PermissionPo> permissions) {
		this.permissions = permissions;
	}
	
	//权限列表菜单
	private List<PermissionPo> menu=new ArrayList<>();
	/*
	 * 整理菜单
	 */
	public List<PermissionPo> getMenu() {
		//清空
		menu.clear();
		//取出一级权限标题
		for(PermissionPo per1:permissions){
			//如果pid=0 ，就是一级标题  取出
			if(per1.getPid()==0){
				//清空
				per1.getChildren().clear();
				//System.out.println(per1.getPname());
				//取出二级权限标题
				for(PermissionPo per2:permissions){
					//二级的上级id=一级的id
					if(per2.getPid()==per1.getId()){
						//将二级放入一级
						per1.getChildren().add(per2);
					}
				}
				//将取出的权限名添加到集合menu中
				menu.add(per1);
			}
			
		}
		return menu;
		
	}
	
	private String realname; 
	private int creator;
	private Date creatime; 
	private int updator;
	private Date updatime; 
	private String pic;
	private int isenable;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
		public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatime() {
		return creatime;
	}
	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	
	public Date getUpdatime() {
		return updatime;
	}
	public void setUpdatime(Date updatime) {
		this.updatime = updatime;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getIsenable() {
		return isenable;
	}
	public void setIsenable(int isenable) {
		this.isenable = isenable;
	}
	//date转string  用于显示日期
	public String getBirthdayTxt() {
		return DateUtil.getStrDate(birthday);
	}
	public void setBirthdayTxt(String birthdayTxt) {
		this.birthdayTxt = birthdayTxt;
	}
	
	
}
