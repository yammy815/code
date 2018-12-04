package com.zs.pms.dao;

import java.util.List;

import javax.management.Query;

import com.zs.pms.po.UserPo;
import com.zs.pms.vo.QueryUser;

/**
 * @author Administrator
 * 用户表数据接口
 */
public interface UserDao {

	//通过条件查询
	public List<UserPo> queryByCon(QueryUser query);
	//根据主键id查询用户权限
	public UserPo queryById(int id);
	//批量删除
	public void deleteByIds(int[]id);
	//修改
	public void update(UserPo user);
	//新增
	public int insert(UserPo user);
	//查询总数
	public int  queryCounts(QueryUser query);
	//删除
	public void delete(int id);
	//查分页
	public List<UserPo> queryByPage(QueryUser query);
}
