package com.zs.pms.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.UserPo;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.DateUtil;
import com.zs.pms.vo.QueryUser;


/**
 * @author Administrator 控制器
 */
@Controller // 是一个控制器
public class ChkLoginController {
	@Autowired
	UserService us;
@RequestMapping("/tologin.do")
public String tologin(){
	return "login";
}
@RequestMapping("/totop.do")
public String totop(){
	return "top";
}
@RequestMapping("toleft.do")
public String toleft(){
	return "left";
}
@RequestMapping("toright.do")
public String toright(){
	return "right";
}
@RequestMapping("/login.do")
	public String login(QueryUser query,ModelMap map,HttpSession session){
	//从session中获取kaptcha生成的验证码
	String ocode=(String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
	//判断验证码  如果不相同
	if(!query.getIdentity().equals(ocode)){
		//页面回带信息
		map.addAttribute("MSG", "验证码输入有误，请重新输入");
		//回到登录页面
		return "login";
	}
	//验证码相同 校验登陆
	UserPo user;
	try {
		user=us.chkLogin(query);
		//数据回带页面
		session.setAttribute("USER", user);
		//当前日期
		session.setAttribute("TODAY", DateUtil.getStrDate(new Date()));
		return "main";	
	} catch (AppExcption e) {//业务异常
		// TODO Auto-generated catch block
		//页面回带信息
		map.addAttribute("MSG", e.getErrMsg());
		//回到登录页面
		return "login";
	}catch (Exception e) {//系统异常
		// TODO: handle exception
		e.printStackTrace();
		//回到错误页面
		return "error";
	}
			
}

}
