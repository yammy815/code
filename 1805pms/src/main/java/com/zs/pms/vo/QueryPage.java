package com.zs.pms.vo;

import com.google.code.kaptcha.Constants;
import com.zs.pms.utils.Contants;

/*
 * 分页对象
 * 
 */
public class QueryPage {

	//分页（开始位置和结束位置）
		protected int start;//起始数
		protected int end;//截止数
		protected int page;//当前页
		
		
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			this.page = page;
		}
		/**
		 * 计算起始数
		 * @return
		 */
		public int getStart() {
			//return start;
			//（当前页-1）*每页条数+1
			
			return (page-1)*Contants.PAGECOUNT+1;
		}
		public void setStart(int start) {
			this.start = start;
		}
		public int getEnd() {
			//截止数
			return page*Contants.PAGECOUNT;
		}
		public void setEnd(int end) {
			this.end = end;
		}
		
		
		

}
