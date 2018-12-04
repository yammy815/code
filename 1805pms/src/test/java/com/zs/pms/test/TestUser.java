package com.zs.pms.test;

import java.util.Date;

import org.apache.tomcat.util.buf.UDecoder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.PermissionPo;
import com.zs.pms.po.TDepPo;
import com.zs.pms.po.UserPo;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;
@RunWith(SpringJUnit4ClassRunner.class)//使用spring框架测试
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestUser {
@Autowired
	UserService us;

	public void testLogin(){
		//创建queryUser对象
		QueryUser qUser =new QueryUser();
		//set值
		qUser.setLoginname("test1");
		qUser.setPassword("123");//明码
		qUser.setIsenable(1);
		try {
			//调用登陆的方法
			UserPo uPo=us.chkLogin(qUser);
			System.out.println(uPo.getRealname()+"、"+uPo.getDeptno().getDname());
			//取出权限列表的权限名
			for(PermissionPo per:uPo.getPermissions()){
				System.out.println(per.getPname());
			}
			System.out.println("----------------------整理后-----------------------");
			for(PermissionPo per1:uPo.getMenu()){
				System.out.println(per1.getPname());
				for(PermissionPo per2:per1.getChildren()){
					System.out.println("\t\t"+per2.getPname());
				}
			}
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			System.out.println(e.getErrMsg());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	//查询的方法
	

	public void testQuery(){
		QueryUser qUser=new QueryUser();
		qUser.setLoginname("test5");
		qUser.setPassword("qwe123");
		//qUser.setIsenable(1);
		//qUser.setPage(2);
		us.queryByCon(qUser);
	}
	//批量删除的方法
	public void testDelete() throws AppExcption{
		int [] id={2018,3018};
		us.deleteByIds(id);
	}

		
	//修改的方法
	public void update(){
		UserPo user=new UserPo();
		user.setId(2008);
		user.setBirthday(new Date());
		user.setEmail("qqq@123.com");
		user.setIsenable(1);
		user.setPassword("qwe123");
		user.setPic("aaa.jpg");
		user.setRealname("test11");
		user.setSex("男");
		user.setUpdator(1001);
		//部门
		TDepPo dep=new TDepPo();
		dep.setDeptno(6);
		user.setDeptno(dep);
		try {
			us.update(user);
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	
	//新增的方法
	public void testInsert(){
		UserPo user =new UserPo();
		TDepPo dep=new TDepPo();
		dep.setDeptno(6);
		user.setLoginname("trans007"); 
		user.setPassword("007"); 
		user.setSex("男"); 
		user.setBirthday(new Date()); 
		user.setEmail("qwe12@qq.com"); 
		user.setDeptno(dep); 
		user.setRealname("詹姆斯邦德"); 
		user.setCreator(0006); 
		user.setCreatime(new Date());
		user.setPic("aaa.jsp");
		user.setIsenable(1);
		
		try {
			us.insert(user);
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			System.out.println(e.getErrMsg());
		}catch(Exception e1){
			e1.printStackTrace();
		}
	}
	
	
	//根据id删除的方法
	public void testDelete1(){
		int id=1009;
		//执行删除的方法
		try {
			us.delete(id);
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	//查询总条数
	public void testQueryCounts(){
		QueryUser qUser=new QueryUser();
		qUser.setSex("男");
		try {
			System.out.println("当前总页数:"+us.queryCounts(qUser));
			//输出数据
			for(UserPo users:us.queryByPage(qUser, 2)){
				System.out.println(users.getRealname());
			}
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
