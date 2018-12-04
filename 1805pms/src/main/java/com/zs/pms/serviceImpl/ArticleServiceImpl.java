package com.zs.pms.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.ArticleDao;
import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.ArticlePo;
import com.zs.pms.service.ArticleService;
import com.zs.pms.utils.Contants;
import com.zs.pms.vo.QueryArticle;
@Service//业务处理
public class ArticleServiceImpl implements ArticleService{
@Autowired//自动注入
	ArticleDao aDao;
	//按条件查询
	@Override
	public List<ArticlePo> queryByCon(QueryArticle query) {
		// TODO Auto-generated method stub
		return aDao.queryByCon(query);
	}

	//根据id查询一条
	@Override
	public ArticlePo queryById(int id) {
		// TODO Auto-generated method stub
		return aDao.queryById(1);
	}

	//新增
	@Override
	@Transactional(rollbackFor=Exception.class)//该业务支持事物
	public int insert(ArticlePo article) throws AppExcption{
		// TODO Auto-generated method stub
		aDao.insert(article);//回滚，新增不成功
		int a=1/0;//抛异常
		return aDao.insert(article);
	}

	//修改
	@Override
	public void update(ArticlePo article)throws AppExcption {
		// TODO Auto-generated method stub
		aDao.update(article);
	}

	//删除一条
	@Override
	public void delete(int id)throws AppExcption {
		// TODO Auto-generated method stub
		aDao.delete(id);
	}

	//批量删除
	@Override
	public void deleteByIds(int[] ids) {
		// TODO Auto-generated method stub
		aDao.deleteByIds(ids);
	}

	//查询总条数
	@Override
	public int queryCounts(QueryArticle query) throws AppExcption{
		// TODO Auto-generated method stub
		//获得总条数
		int counts=aDao.queryCounts(query);
		//判断总页数
		if(counts%Contants.PAGECOUNT==0){
			//总条数除以每页条数==0
			return counts/Contants.PAGECOUNT;
		}else{
			return counts/Contants.PAGECOUNT+1;
		}
	}

	//查分页
	@Override
	public List<ArticlePo> queryByPage(QueryArticle query, int page)throws AppExcption {
		// TODO Auto-generated method stub
		//将当前页set到参数query中
		query.setPage(page);
		//返回查询分页的方法
		return aDao.queryByPage(query);
	}

}
