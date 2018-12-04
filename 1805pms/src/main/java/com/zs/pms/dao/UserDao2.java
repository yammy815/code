package com.zs.pms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.zs.pms.po.UserPo;
import com.zs.pms.vo.QueryUser;

@Repository//连接数据库

public interface UserDao2 {

	//条件查询
		@Select("select * from tuser where loginname=#{loginname} and password=#{passsword}")
		public List<UserPo> queryUser(QueryUser user);
	
}
