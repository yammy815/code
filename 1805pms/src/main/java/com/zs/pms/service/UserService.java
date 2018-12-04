package com.zs.pms.service;


import java.util.List;

import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.UserPo;
import com.zs.pms.vo.QueryUser;

public interface UserService {
	
	
	//按条件查询
	public List<UserPo> queryByCon(QueryUser query);
	//查询登陆的方法
	public  UserPo chkLogin(QueryUser query) throws AppExcption;
	//批量删除的方法
	public void deleteByIds(int[] id);
	//根据id查询一条
	public UserPo queryById(int id);
	//修改的方法
	public void update(UserPo user)throws AppExcption;
	//新增的方法
	public int insert(UserPo user)throws AppExcption;
	//删除的方法
	public void delete(int id)throws AppExcption;
	//查询总数的方法
	public int queryCounts(QueryUser query)throws AppExcption;
	//查分页
	public List<UserPo> queryByPage(QueryUser query,int page)throws AppExcption;
}
