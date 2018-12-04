package com.zs.pms.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zs.pms.dao.DeptDao;
import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.TDepPo;
import com.zs.pms.service.DeptService;

@Service//业务
public class DeptServiceImpl implements DeptService{
     @Autowired
     DeptDao dao;

	@Override
	public List<TDepPo> queryById(int pid) {
		// TODO Auto-generated method stub
		return dao.queryById(pid);
	}

	
	
     

}
