package com.zs.pms.vo;

public class QueryArticle extends QueryPage{

	//条件查询提供的条件
	private String title;
	private String author;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
}
