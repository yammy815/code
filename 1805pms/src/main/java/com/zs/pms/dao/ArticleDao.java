package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.ArticlePo;
import com.zs.pms.vo.QueryArticle;

public interface ArticleDao {

	//按条件查询的方法
	public List<ArticlePo> queryByCon(QueryArticle query);
	//根据主键查询
	public ArticlePo queryById(int id);
	//新增
	public int insert(ArticlePo article);
	//根据id删除一条
	public void delete(int id);
	//修改
	public void update(ArticlePo article);
	//查询总条数
	public int queryCounts(QueryArticle query);
	//查分页
	public List<ArticlePo> queryByPage(QueryArticle query);
	//批量删除
	public void deleteByIds(int[] ids);
}
