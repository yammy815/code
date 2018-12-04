package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TDepPo;

public interface DeptDao {
	
	public List<TDepPo> queryById(int pid) ;
	
}
