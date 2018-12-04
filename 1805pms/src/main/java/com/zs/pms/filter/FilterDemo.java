package com.zs.pms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FilterDemo implements  Filter{

	@Override
	public void destroy() {
		// TODO 自动生成的方法存根
		
	}

	@Override
	/**
	 * 具体执行的方法
	 */
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
//		将请求req  响应 resp强转成HttpServlet类型
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
		/**
		 * 过滤器  设置编码格式
		 */
//		设置请求的编码格式
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
//		继续向后执行过滤链，又回到这个方法，将不是utf-8的编码格式改为utf-8
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO 自动生成的方法存根
		
	}

}
