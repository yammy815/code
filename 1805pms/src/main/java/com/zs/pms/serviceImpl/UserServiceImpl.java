package com.zs.pms.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.UserPo;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.Contants;
import com.zs.pms.utils.MD5;
import com.zs.pms.vo.QueryUser;
@Service
public class UserServiceImpl implements UserService{
@Autowired
	private UserDao ud;
//@Autowired
	//private UserDao2 udao2;
	@Override
	//登陆
	public UserPo chkLogin(QueryUser query) throws AppExcption {
		
		//将明码变成密码
		MD5 md5=new MD5();
		//加密后的密码
		String p1=md5.getMD5ofStr(query.getPassword());
		//将密码放到query参数中
		query.setPassword(p1);
		// TODO Auto-generated method stub
		//调用条件查询的方法将信息 返回类型为List<UserPo>类型
		List<UserPo> list=ud.queryByCon(query);
		//取出的信息不符合   没有或者多条  用户
		if(list==null||list.size()!=1){
			throw new AppExcption(1001, "用户名或密码错误，请重新输入。");
		}
		//有用户信息就获得第一条
		UserPo uPo=list.get(0);
		//关联权限列表返回
		return ud.queryById(uPo.getId());
		
	}
	@Override
	//批量删除
	public void deleteByIds(int[] id)  {
		// TODO Auto-generated method stub
		ud.deleteByIds(id);
	}
	@Override
	//修改的方法
	public void update(UserPo user) throws AppExcption {
		//不可用
		if(user.getIsenable()==-1){
			throw new AppExcption(1003, "不能修改不可用用户");
		}
		//获得原来的用户的信息
		UserPo nuser=ud.queryById(user.getId());
		//判断密码
		if(user.getPassword()!=null && (!"".equals(user.getPassword()))&& !user.equals(nuser.getPassword())){
			//密码加密
			MD5 md5=new MD5();
			//将加密后的密码set到USER 中
			user.setPassword(md5.getMD5ofStr(user.getPassword()));
		}
		ud.update(user);
	}
	@Override
	public List<UserPo> queryByCon(QueryUser query) {
		// TODO Auto-generated method stub
		return ud.queryByCon(query);
	}
	//条件查询
	/*public List<UserPo> queryByCon2(QueryUser query) {
		// TODO Auto-generated method stub
		return udao2.queryUser(query);
	}*/
	@Override
	@Transactional(rollbackFor=Exception.class)//该业务支持事物
	public int insert(UserPo user) throws AppExcption {
		// TODO Auto-generated method stub
		//ud.insert(user);//回滚  新增不成功
		ud.insert(user);
		//int a=1/0;//抛异常
		return ud.insert(user);
	}
	@Override
	// 根据id删除一条
	public void delete(int id) throws AppExcption {
		// TODO Auto-generated method stub
		ud.delete(id);
	}
	@Override
	//查总页数
	public int queryCounts(QueryUser query) throws AppExcption {
		// TODO Auto-generated method stub
		//获得总条数
		int counts=ud.queryCounts(query);
		//判断 决定页数
		if(counts%Contants.PAGECOUNT==0){
			//能整除的  页数就等于总条数除以每页的条数
			return counts/Contants.PAGECOUNT;
		}else{
			//不能整除需要新加一页（+1）
			return counts/Contants.PAGECOUNT+1;
		}
		
	}
	@Override
	//查分页
	public List<UserPo> queryByPage(QueryUser query,int page) throws AppExcption {
		// TODO Auto-generated method stub
		//将当前页set到参数query中
		query.setPage(page);
		//返回查询的方法  参数为query
		return ud.queryByPage(query);
	}
	@Override
	//根据id获得一条
	public UserPo queryById(int id) {
		// TODO Auto-generated method stub
		return ud.queryById(id);
	}
}
