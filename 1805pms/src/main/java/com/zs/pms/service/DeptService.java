package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.TDepPo;

public interface DeptService {

	//根据id查询部门
	public List<TDepPo> queryById(int pid);

}
