package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;

public class ArticlePo implements Serializable{

	/**
	 * 网络唯一标识号
	 */
	private static final long serialVersionUID = 5980076156158812295L;

	private int id;//文章编号
	private String title;//文章标题
	private String content;//文章内容
	private String author;//文章作者
	private Date crtime;//发表时间
	//private int channle;//所属频道 
	//一对一关联
	private ChannlePo channle;
	
	public ChannlePo getChannle() {
		return channle;
	}
	public void setChannle(ChannlePo channle) {
		this.channle = channle;
	}
	private int isremod;//是否推荐
	private int ishot;//是否热点
	private int updator;
	private Date updatime;
	
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getCrtime() {
		return crtime;
	}
	public void setCrtime(Date crtime) {
		this.crtime = crtime;
	}
	
	public int getIsremod() {
		return isremod;
	}
	public void setIsremod(int isremod) {
		this.isremod = isremod;
	}
	public int getIshot() {
		return ishot;
	}
	public void setIshot(int ishot) {
		this.ishot = ishot;
	}
	
}
