package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.ArticlePo;
import com.zs.pms.vo.QueryArticle;

public interface ArticleService {

	//条件查询
	public List<ArticlePo> queryByCon(QueryArticle query);
	//根据主键查询
	public ArticlePo queryById(int id);
	//新增
	public int insert(ArticlePo article) throws AppExcption;
	//修改
	public void update(ArticlePo article)throws AppExcption;
	//删除一条
	public void delete(int id)throws AppExcption;
	//批量删除
	public void deleteByIds(int[] ids);
	//查询总条数
	public int queryCounts(QueryArticle query)throws AppExcption;
	//查分页
	public List<ArticlePo> queryByPage(QueryArticle query,int page)throws AppExcption;
}
