
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

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

<script type="text/javascript" language="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>

<link rel="stylesheet" href="../res/css/style.css" />






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User-update</title>

<!-- 添加表单验证 -->
<script type="text/javascript">
	//用户名：数字加字母，结束前不能全部是数字，6——16位
	var CHKLOGINNAME="^(?![0-9]+$)[a-zA-Z0-9]{2,16}$";
	//密码：数字加字母，结束前不能全是数字或字母，6-16位
	var CHKPASSWORD="^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}$";
	//出生日期：yyyy-MM-dd  月份1-12  日期 1-31
	var CHKDATE="^[0-9]{4}-0?[1-9]|1[0-2]-0?[1-9]|[1-2][0-9]|3[0-1]$";
	//邮箱：xxxxxx@xxx.com  或者企业邮箱  _例 qwe@wanyuan.com_cn
	var CHKEMAIL="^[0-9a-zA-Z]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名
	var CHKREALNAME="^[\u4e00-\u9fa5]{2,}$";
	
	//验证用户名
	/*function chkloginname(){
		//获取用户名
		var lgEle=document.getElementById("loginname");
		var loginname=lgEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKLOGINNAME);
		//获取用户名是否输入成功的元素对象
		var spanEle=document.getElementById("resultName");
		//判断是否匹配成功
		if (reg.test(loginname)) {
			//表示输入正确
			spanEle.innerHTML="√";
			spanEle.style.color="green";
			return true;
		} else {
			//输入不正确
			spanEle.innerHTML="用户名必须包含数字和字母，不能低于6位";
			spanEle.style.color="red";
			//清空文本框
			lgEle.value="";
			//重新获得焦点
			lgEle.focus();
			return false;
		}
	}*/
	//验证用户名
	function chkloginname(){
		//获取用户名输入框的值
		var loginname=$("#loginname").val();
		//定义用户匹配的正则表达式
		var reg=new RegExp(CHKLOGINNAME);
		//判断用户名输入的格式与正则格式是否相符
		if (reg.test(loginname)) {
			//表示输入正确
			$("#resultName").html("√");
			$("#resultName").css("color","green");
			return true;
		}else {
			//如果格式不符
			$("#resultName").html("用户名必须包含数字和字母，不能低于2位");
			$("#resultName").css("color","red");
			//清空文本框
			$("#loginname").val("");
			//重新获取焦点
			$("#loginname").focus();
			return false;
		};
	};
	//验证真实姓名
	/*function chkrealname(){
		//获取用户名
		var lgEle=document.getElementById("realname");
		var realname=lgEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKREALNAME);
		//获取用户名是否输入成功的元素对象
		var spanEle=document.getElementById("resultRealName");
		//判断是否匹配成功
		if (reg.test(realname)) {
			//表示输入正确
			spanEle.innerHTML="√";
			spanEle.style.color="green";
			return true;
		} else {
			//输入不正确
			spanEle.innerHTML="姓名不符格式，必须两位以上";
			spanEle.style.color="red";
			//清空文本框
			lgEle.value="";
			//重新获得焦点
			lgEle.focus();
			return false;
		}
	}*/
	//验证真实姓名的方法
	function chkrealname(){
		//获取输入框中输入的值
		var realname=$("#realname").val();
		//定义匹配真实姓名的正则表达式
		var reg=new RegExp(CHKREALNAME);
		//判断输入的与正则要求的格式是否一致
		if (reg.test(realname)) {
			//输入正确
			$("#resultRealName").html("√");
			$("#resultRealName").css("color","green");
			return true;
		} else {
			//输入不正确
			$("#resultRealName").html("姓名格式输入不正确，请重新输入!");
			$("#resultRealName").css("color","red");
			$("#realname").val("");
			//重新聚焦
			$("#realname").focus();
			return false;
		};
	};
	//验证出生年月
	/*function chkbirthday(){
		//获取用户名
		var lgEle=document.getElementById("birthday");
		var birthday=lgEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKDATE);
		//获取用户名是否输入成功的元素对象
		var spanEle=document.getElementById("resultDate");
		//判断是否匹配成功
		if (reg.test(birthday)) {
			//表示输入正确
			spanEle.innerHTML="√";
			spanEle.style.color="green";
			return true;
		} else {
			//输入不正确
			spanEle.innerHTML="姓名不符格式，必须两位以上";
			spanEle.style.color="red";
			//清空文本框
			lgEle.value="";
			//重新获得焦点
			lgEle.focus();
			return false;
		}
	}*/
	//验证出生年月的方法
	function chkbirthday(){
		//获取输入框中输入的值
		var birthday =$("#birthday").val();
		//定义匹配真实姓名的正则表达式
		var reg=new RegExp(CHKDATE);
		//判断输入的与正则要求的格式是否一致
		if (reg.test(birthday)) {
			//输入正确
			$("#resultDate").html("√");
			$("#resultDate").css("color","green");
			return true;
		} else {
			//输入不正确
			$("#resultDate").html("日期格式输入不正确，请重新输入!");
			$("#resultDate").css("color","red");
			//清空输入框
			$("#birthday").val("");
			//重新聚焦
			$("#birthday").focus();
			return false;
		};
	};
	//验证邮箱
	/*function chkemail(){
		//获取用户名
		var lgEle=document.getElementById("email");
		var email=lgEle.value;
		//定义匹配用户名的正则表达式
		var reg=new RegExp(CHKEMAIL);
		//获取用户名是否输入成功的元素对象
		var spanEle=document.getElementById("resultEmail");
		//判断是否匹配成功
		if (reg.test(email)) {
			//表示输入正确
			spanEle.innerHTML="√";
			spanEle.style.color="green";
			return true;
		} else {
			//输入不正确
			spanEle.innerHTML="姓名不符格式，必须两位以上";
			spanEle.style.color="red";
			//清空文本框
			lgEle.value="";
			//重新获得焦点
			lgEle.focus();
			return false;
		}
	}*/
	//验证邮箱的方法
	function chkemail(){
		//获取输入框中输入的值
		var email =$("#email").val();
		//定义匹配真实姓名的正则表达式
		var reg=new RegExp(CHKEMAIL);
		//判断输入的与正则要求的格式是否一致
		if (reg.test(email)) {
			//输入正确
			$("#resultEmail").html("√");
			$("#resultEmail").css("color","green");
			return true;
		} else {
			//输入不正确
			$("#resultEmail").html("邮箱格式输入不正确，请重新输入!");
			$("#resultEmail").css("color","red");
			//清空输入框
			$("#email").val("");
			//重新聚焦
			$("#email").focus();
			return false;
		};
	};

	//验证所有
	function chkAll(){
		return chkloginname()&&chkpassword()&&chkRePwd()&&chkrealname()&&chkbirthday()&&chkemail();
	}
	//验证修改的方法
	function update(){
		var msg="确定要修改吗？\n\n请确定";
		if(confirm(msg)==true){
			return true;
		}else {
			return false;
		}
	}
	
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 修改</div>
	<form class="ropt">
		<input type="button" onclick="history.back();" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="update.do?id=${user.id }" method="post" onsubmit="return chkAll()">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
			
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired"></span>
						<span class="pn-frequired">${msg }</span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						用户名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="loginname" id="loginname" onblur="chkloginname()" maxlength="100" value="${USER.loginname}" placeholder="请输入账号"/>
						<span id="resultName" name="resultName"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" class="required" name="password" id="password"  maxlength="100" value="${USER.password }" placeholder="请输入密码"/>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						真实姓名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="realname"  id="realname" onblur="chkrealname()" maxlength="100" value="${USER.realname }" placeholder="请输入真是姓名"/>
						<span id="resultRealName" name="resultRealName"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<c:if test="${USER.sex=='男'}">
						<input type="radio" name="sex" value="男" checked="checked"/>男
						<input type="radio" name="sex" value="女"/>女
						</c:if>
						<c:if test="${USER.sex!='男'}">
						<input type="radio" name="sex" value="男"/>男
						<input type="radio" name="sex" value="女" checked="checked"/>女
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						出生年月:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="Wdate" name="birthday" id="birthday" onclick="WdatePicker()" maxlength="100" value="${USER.birthdayTxt}" />
						<span id="resultDate" name="resultDate"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						电子邮箱:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="email"  id="email" onblur="chkemail()" maxlength="100" value="${USER.email }" placeholder="请输入电子邮箱"/>
						<span id="resultEmail" name="resultEmail"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<!-- 一级部门 -->
						<select id="dep1" name="dept">
						<c:forEach items="${DLIST}" var="dept">
						<!-- 该用户所在部门的上级部门id等于一级部门id  就选择 -->
						<c:if test="${USER.deptno.pid==dept.deptno }">
							<option value="${dept.deptno}" selected="selected">${dept.dname}</option>
						</c:if>
						<!-- 否则不选中 -->
						<c:if test="${USER.deptno.pid!=dept.deptno }">
							<option value="${dept.deptno}">${dept.dname}</option>
						</c:if>
						</c:forEach>
						</select>
						<!-- 二级部门 -->
						<select id="dep2" name="deptno.deptno">
						<c:forEach items="${DLIST2}" var="dept1">
						<!-- 如果该用户所在的部门的id等于二级部门的id  就选择 -->
						<c:if test="${USER.deptno.deptno==dept1.deptno }">
							<option value="${dept1.deptno}" selected="selected">${dept1.dname}</option>
						</c:if>
						<!-- 否则就不选择 -->
						<c:if test="${USER.deptno.deptno!=dept1.deptno }">
							<option value="${dept1.deptno}">${dept1.dname}</option>
						</c:if>
						</c:forEach>
						</select>
					</td>
				</tr>
				
				<!--  <tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否可用:</td><td width="80%" class="pn-fcontent">
						<c:if test="${user.isenable==1 }">
						<input type="hidden" class="required" name="isenable" value="1" maxlength="100" checked="checked"/>可用
						<input type="hidden" class="required" name="isenable" value="2" maxlength="100"/>不可用
						</c:if>
						<c:if test="${user.isenable==2}">
						<input type="hidden" class="required" name="isenable" value="1" maxlength="100" />可用
						<input type="hidden" class="required" name="isenable" value="2" maxlength="100" checked="checked"/>不可用
						</c:if>
					</td>
				</tr> -->
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
					<input type="submit" class="submit" onclick="javascript:return update();" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>