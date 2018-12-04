package com.zs.pms.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.TDepPo;
import com.zs.pms.po.UserPo;
import com.zs.pms.service.DeptService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

/**
 * @author Administrator 用户控制器
 */
@Controller // 是一种控制器
public class UserController {

	@Autowired
	UserService us;
	@Autowired
	DeptService ds;
	//页面查询
	@RequestMapping("/user/list.do")
	public String list(QueryUser user, String page, ModelMap map) throws AppExcption {

		if (page == null || "".equals(page)) {
			page = "1";
		}
		// 带回总页的数据
		map.addAttribute("count", us.queryCounts(user));
		// 带回分页的数据
		map.addAttribute("queryPage", us.queryByPage(user, Integer.parseInt(page)));
		// 带回查询数据
		map.addAttribute("user", user);
		// 带回当前页数
		map.addAttribute("page", page);

		// 返回user/list.jsp
		return "user/list";

	}

	// 新增的方法
	@RequestMapping("/user/toadd.do")
	public String toadd(ModelMap map) {
		// 获得一级部门
		List<TDepPo> list1 = ds.queryById(0);
		// 回带页面信息
		map.addAttribute("DLIST", list1);
		// 获得一级部门下的二级部门
		List<TDepPo> list2 = ds.queryById(list1.get(0).getDeptno());
		// 回带页面信息
		map.addAttribute("DLIST2", list2);
		return "user/add";
	}

	/**
	 * 以ajax的方式响应 方法返回string 直接返回文本 方法返回对象 返回json格式 自动调用jsonArray
	 * 
	 * @param pid
	 * @return
	 */
	@RequestMapping("/user/getdep.do")
	@ResponseBody
	public List<TDepPo> getDept(int pid) {
		List<TDepPo> list = ds.queryById(pid);
		return list;
	}

	/*
	 * 新增用户
	 */
	@RequestMapping("/user/add.do")
	public String add(UserPo user,HttpSession session,ModelMap map) {

		try {
			// 获得session中的用户信息
			UserPo cuser = (UserPo) session.getAttribute("USER");
			user.setCreator(cuser.getId());//创建人
			user.setIsenable(1);//是否可用
			//user.setPic(" ");//图片
			// 调用新增的方法
			us.insert(user);
			// 跳转到指定url上 不需要传参
			return "redirect:list.do";
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			map.addAttribute("MSG", e.getErrMsg());
			//执行方法  需要传参
			return this.toadd(map);
		}
	}
	
	//删除
	@RequestMapping("user/delete.do")
	public String delete(int id){
		
		//调用删除的方法
		try {
			us.delete(id);
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//删除成功跳转到list页面
		return "redirect:list.do";
	}
	
	//批量删除
	@RequestMapping("user/deletes.do")
	public String deletes(int[] ids){
		us.deleteByIds(ids);
		return "redirect:list.do";
	}
	
	//修改  -------获得要修改的用户信息
	@RequestMapping("user/get.do")
	
	public String get(int id,ModelMap map){
		//获得要修改的用户的ID
		UserPo user=us.queryById(id);
		//回带数据信息
		map.addAttribute("USER", user);
		//获得一级部门
		List<TDepPo> list1=ds.queryById(0);
		//回带数据信息
		map.addAttribute("DLIST", list1);
		//获得该用户的一级部门下的二级部门
		List<TDepPo> list2=ds.queryById(user.getDeptno().getPid());
		//回带数据信息
		map.addAttribute("DLIST2", list2);
		return "user/update";
	}
	//修改
	@RequestMapping("user/update.do")
	public String update(UserPo user,HttpSession session,ModelMap map){
		//获得session中的用户信息
		UserPo cuser=(UserPo)session.getAttribute("CUSER");
		//修改人
		user.setUpdator(cuser.getId());
		//调用修改方法
		try {
			us.update(user);
			//修改成功   重新加载页面
			return "redirect:list.do";
		} catch (AppExcption e) {
			//修改不成功
			map.addAttribute("MSG", e.getErrMsg());
			
			return get(user.getId(), map);
		}
	}
}
