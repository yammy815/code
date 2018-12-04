package com.zs.pms.test;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppExcption;
import com.zs.pms.po.ArticlePo;
import com.zs.pms.po.ChannlePo;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryArticle;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring框架测试
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestArticle {
@Autowired
	ArticleService as;
	
	//新增测试
	public void testInsert(){
		ArticlePo apo=new ArticlePo();
		ChannlePo cpo=new ChannlePo();
		cpo.setId(1);
		apo.setTitle("爱狗日记");
		apo.setContent("对待狗子要加倍好！！！！！！！！！！");
		apo.setAuthor("二姐");
		apo.setChannle(cpo);
		apo.setCrtime(new Date());
		apo.setIsremod(1);
		apo.setIshot(1);
		
		try {
			as.insert(apo);
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询
	public void tsetQuery(){
		//根据条件查询
		/*QueryArticle query=new QueryArticle();
		query.setTitle("Don't");
		query.setAuthor("犯人们");
		as.queryByCon(query);*/
		//根据Id查询
		as.queryById(33);
	}
	
	//删除一条
	public void testDelete(){
		int id=21;
		try {
			as.delete(id);
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//修改
	public void testUpdate(){
		ArticlePo apo=new ArticlePo();
		apo.setId(29);
		apo.setTitle("戴斯把谁都");
		apo.setContent("登登登登登登");
		try {
			as.update(apo);
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//查询总条数
	public void testQueryCounts(){
		QueryArticle qArticle=new QueryArticle();
		qArticle.setAuthor("二姐");
		try {
			System.out.println("当前总条数:"+as.queryCounts(qArticle));
			//输出数据
			for(ArticlePo article:as.queryByPage(qArticle, 1)){
				System.out.println(article.getTitle());
			}
		} catch (AppExcption e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	//批量删除
	public void tsetDeleteIds(){
		int[]ids={12,32}; 
		as.deleteByIds(ids);
	}
}
