<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />




<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- 引入标签库 -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk"/>
<title>User-list</title>

	<!-- 验证删除 /修改的方法 -->
	<script type="text/javascript">
		function del(){
			var msg="确定要删除吗？\n\n请确定";
			if(confirm(msg)==true){
				return true;
			}else {
				return false;
			}
			
		}
		
	</script>
</head>
<body>
<form action="list.do" method="post" style="padding-top:5px">
&nbsp;&nbsp;&nbsp;登录名：<input type="text" name="loginname" value="${user.loginname}"/>
     <select name="isenable">
     <c:if test="${user.isenable==0}">
     <option value="0" selected="selected">请选择</option>
     <option value="1">有效</option>
     <option value="-1">无效</option>
      </c:if>
      
       <c:if test="${user.isenable==1}">
     <option value="0">请选择</option>
     <option value="1" selected="selected">有效</option>
     <option value="-1">无效</option>
      </c:if>
      
       <c:if test="${user.isenable==-1}">
     <option value="0" >请选择</option>
     <option value="1">有效</option>
     <option value="-1" selected="selected">无效</option>
      </c:if>
     </select>
    <input type="submit" class="query" value="查询"/>
</form>
<form class="ropt">
		<input type="submit" onclick="this.form.action='toadd.do';" value="添加" class="add"/>
		<input type="button" onclick="javascript:return location.reload()" value="刷新" class="return-button"/>
	</form>
<form action="deletes.do" method="post">
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 列表</div>
	
	<div class="clear"></div>
</div>
<div class="body-box">
<input type="hidden" name="pageNo" value=""/>
<form method="post" id="tableForm">
<input type="hidden" value="" name="pageNo"/>
<input type="hidden" value="" name="queryName"/>
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>用户ID</th>
			<th>用户账号</th>
			<th>真实姓名</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>邮箱</th>
			<th>部门名称</th>
			<th>是否可用</th>
			<th>头像</th>
			<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${queryPage}" var="user">
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="${user.id}"/></td>
			<td align="center">${user.id}</td>
			<td align="center">${user.loginname}</td>
			<td align="center">${user.realname}</td>
			<td align="center">${user.sex}</td>
			<td align="center">${user.birthdayTxt}</td>
			<td align="center">${user.email}</td>
			<td align="center">${user.deptno.dname}</td>
			<td align="center">${user.isenabled}</td>
			<td align="center"><img src="../upload/${user.pic}" height="50px" width="50px" /></td>
			
			<td align="center">
			<a href="get.do?id=${user.id}" class="pn-opt" >修改</a>
			<a href="delete.do?id=${user.id}" class="pn-opt" onclick="if(!confirm('是否删除数据?')){return false;}">删除</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div class="page pb15" style="float: right;">
		<input class="del-button" type="submit" value="删除" onclick="if(!confirm('是否删除数据?')){return false;}"/>
		<span class="r inb_a  page_b">
			<!-- [当前页/尾页] -->
			当前第${page} 页/ 共 ${count}页
			<a href="list.do?page=1&loginname=${user.loginname}&isenable=${user.isenable}">首页</a>
			<!-- 判断 上一页和下一页在什么条件下能用 -->
			<a href="list.do?page=${(page-1)<=0?1:(page-1)}&loginname=${user.loginname}&isenable=${user.isenable}">上一页</a>
				<!-- 页面跳转 -->
			 到第<input type='text' id='page'  size='3' />页 <input type='button' id='skip' class='hand btn60x20' value='确定' onclick="javascript:window.location.href ='list.do?&page=' + $('#page').val() +'&mohuname=${mohuname }&mohuenabled=${mohuenabled }'"/>
			<a href="list.do?page=${(page+1)>count?count:page+1}&loginname=${user.loginname}&isenable=${user.isenable}">下一页</a>
			<a href="list.do?page=${count}&loginname=${user.loginname}&isenable=${user.isenable}">尾页</a>
			当前第${page}页/共${count}页
		</span>
	</div>
<div style="margin-top:15px;">
<!-- 	<input class="del-button" type="button" value="取消" onclick="optCancel();"/>
	<input class="submit" type="button" value="通过" onclick="optPass();"/> -->
</div>
</form>
</div>
</form>
</body>
</html>