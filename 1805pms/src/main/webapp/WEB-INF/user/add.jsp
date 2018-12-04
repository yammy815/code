
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<script src="../thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> 
<script src="../js/jquery-1.11.0.min.js" language="javascript" type="text/javascript"></script>
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
<title>User-add</title>


<!-- 添加表单验证 -->
<script type="text/javascript">
	//用户名：数字加字母，结束前不能全部是数字，6——16位
	var CHKLOGINNAME="^(?![0-9]+$)[a-zA-Z0-9]{4,16}$";
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
			//$("#resultName").html("√");
			//$("#resultName").css("color","green");
			//return true;
			if (chkExistLoginname(loginname)) {
				return true;
			} else {
				return false;
			}
		}else {
			//如果格式不符
			$("#resultName").html("用户名必须包含数字和字母，不能低于4位");
			$("#resultName").css("color","red");
			//清空文本框
			$("#loginname").val("");
			//重新获取焦点
			$("#loginname").focus();
			return false;
		}; 
	};/* 
	//验证用户名是否重复
	function chkExistLoginname(loginname){
		//默认重复
		var flag=false;
		$.ajax({
			//请求路径
			url:'chkexist.do',
			//请求方式
			type:'post',
			//请求参数
			data:'type=1&loginname='+loginname,
			//是否异步
			async:false,//(同步)
			//预期服务器返回的数据类型
			dataType:'text',
			//相映成功调用回调函数
			success:function(flagg){
				//判断是否重复
				if (flagg=="true") {//不重复
					$("#resultName").html("√");
					$("#resultName").css("color","green");
				   flag=true;
				} else {//重复
					$("#resultName").html("此用户已存在");
					$("#resultName").css("color","red");
					flag=false;
				}
			},
			error:function(){
				alert("数据请求失败…………");
			}
		});
		return flag;
	} */
	//验证密码
	/*function chkpassword(){
		//获取密码
		var pwdEle=document.getElementById("password");
		var password=pwdEle.value;
		//定义匹配密码的正则表达式
		var reg=new RegExp(CHKPASSWORD);
		//获取密码是否输入成功的元素对象
		var spanEle=document.getElementById("resultPwd");
		//判断密码是否输入成功
		if (reg.test(password)) {
			//成功
			spanEle.innerHTML="√";
			spanEle.style.color="green";
			return true;
		} else {
			//失败
			spanEle.innerHTML="密码必须包含数字和字母，且不能低于6位";
			spanEle.style.color="red";
			//清空
			pwdEle.value="";
			//重新聚焦
			pwdEle.focus();
		    return false;
		}
	}*/
	//验证密码
 	function chkpassword(){
		
		//获取密码输入框的值
		var password=$("#password").val();
		
	 	//定义匹配密码的正则表达式
		var reg=new RegExp(CHKPASSWORD);
		
		 //判断输入的密码的格式与正则表达式是否匹配
		 if (reg.test(password)) {
			
			//输入正确
			$("#resultPwd").html("√");
			$("#resultPwd").css("color","green");
			return true;
		}else{
			//输入失败
			//如果格式不符
			$("#resultPwd").html("密码必须包含数字和字母，不能低于6位");
			$("#resultPwd").css("color","red");
			//清空文本框
			$("#password").val("");
			//重新获取焦点
			$("#password").focus();
			//清空输入框
			return false;
		};     
	}; 
	// 验证两次密码是否一致
	/*function chkRePwd(){
		//获取密码
		var repwdEle=document.getElementById("repwd");
		var repwd=repwdEle.value;
		//获取第一次输入的密码
		var password=document.getElementById("password");
		//获取两次密码输入成功的元素对象
		var spanEle=document.getElementById("resultRepwd");
		//判断两次输入是否一致
		if (repwd==password) {
			//密码一致
			spanEle.innerHTML="√";
			spanEle.style.color="green";
			return true;
		} else {
			//密码不一致
			spanEle.innerHTML="两次输入的密码不一致，请重新输入";
			spanEle.style.color="red";
			return false;
		};
	}*/
 	//验证两次密码输入是否一致
	function chkRePwd(){
		//获取输入框中的二次密码
		var repwd=$("#repwd").val();
		//获取第一次输入的密码
		var password=$("#password").val();
		//判断两次密码输入是否一致
		if (repwd==password) {
			//密码一致
			$("#resultRepwd").html("√");
			$("#resultRepwd").css("color","green");
			return true;
		} else {
			$("#resultRepwd").html("两次输入的密码不一致，请重新输入");
			$("#resultRepwd").css("color","red");
			//清空二次，密码输入框
			$("#repwd").val("");
			//重新聚焦
			$("#repwd").focus();
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
			spanEle.innerHTML="日期不符格式，请重新输入";
			spanEle.style.color="red";
			//清空文本框
			lgEle.value="";
			//重新获得焦点
			lgEle.focus();
			return false;
		}
	}*/
	//验证出生年月的方法
	/*function chkbirthday(){
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
	};*/

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
			spanEle.innerHTML="邮箱不符格式，请重新输入";
			spanEle.style.color="red";
			//清空文本框
			lgEle.value="";
			//重新获得焦点
			lgEle.focus();
			return false;
		}
	}*/
	//验证邮箱的方法
	/* function chkemail(){
		//获取输入框中输入的值
		var email =$("#email").val();
		//定义匹配真实姓名的正则表达式
		var reg=new RegExp(CHKEMAIL);
		//判断输入的与正则要求的格式是否一致
		if (reg.test(email)) {
			//输入正确
			//$("#resultEmail").html("√");
			//$("#resultEmail").css("color","green");
			//return true;
			if (chkExistEmail(email)) {
				return true;
			} else {
				return false;
			}
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
	};  */
	//验证邮箱是否重复
	/* function chkExistEmail(email){
		//默认重复
		var flag=false;
		$.ajax({
			//请求路径
			url:'chkexist.do',
			//请求方式
			type:'post',
			//请求参数
			data:'type=2&email='+email,
			//是否异步
			async:false,
			//预期服务器返回的数据类型
			dataType:'text',
			//响应成功调用回调函数
			success:function(flagg){
				if (flagg=="true") {//没有重复
					$("#resultEmail").html("√");
					$("#resultEmail").css("color","green");
					flag=true;
				} else {
					$("#resultEmail").html("此邮箱已存在!");
					$("#resultEmail").css("color","red");
					flag=false;
				}
			},
			error:function(){
				alert('请求数据失败……');
			}
		});
		return flag;
	}
 */ 	//查询所有
 	function chkAll() {
		//获取所有的验证结
		
		var loginname = chkloginname();
		var password = chkpassword();
		var repsw = chkRePwd();
		var email = chkemail();
		var realname = chkrealname();
		if (loginname==true&&password==true&&repsw==true&&email==true&&realname==true) {
			return true;
		} else {
			return false;
		}
	}   
	//文档就绪事件
 	$(function(){
 	 	//下拉框change事件  ajax用jQuery的形式表达
 		$("#dep1").change(//id选择器
 				function(){
 				//清空第二个下拉框
 				$("#dep2").empty();
 					//ajax异步提交方法
 					$.post("getdep.do",//提交的url（参数）
 						{pid:this.value},	//json类型数据，传值
 					//成功后回调的方法
 						function(data){
 		 					if(data!=null){
 		 						$(data).each(
 		 							function(){
 		 								//添加数据到第二个下拉框
 		 								$("#dep2").append("<option value="+this.id+">"+this.dname+"</option>")
 		 							}
 		 						)
 		 					}
 		 				},
 						"json"//返回类型
 					);
 				});
 	});
 	//文件上传
	function upload() {
		//ajax请求 局部提交
		//设置参数
		var args={
				//url：绝对路径
				url:$("#path").val()+"/upload/common.do",
				//返回类型
				dataType:"text",
				//提交方式
				type:"post",
				success:function(result){
					//设置图片的属性
					$("#img").attr("src",$("#path").val()+"/upload/"+result);
					//将路径设置到隐藏域中
					$("#pic").val(result);
				}
		}
		//表单局部提交
		$("#jvForm").ajaxSubmit(args);
	}
  	
/* 	//验证所有
	function chkAll(){
		  var chkall=chkloginname()&&chkpass()&&chkRePwd()&&chkbirth()&&chkemail()&&chktruename();  
		return chkloginname()&&chkpassword()&&chkRePwd()&&chkrealname()&&chkemail();
	} */
</script>
</head>
<body>
<!-- 获得应用的绝对路径 -->
<input type="hidden" id="path" value="${pageContext.request.contextPath }" />
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 添加</div>
	<form class="ropt">
		<input type="button" onclick="history.back();" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form name="fm" id="jvForm" action="add.do" method="post" onsubmit="return chkAll()" enctype="multipath/form-data" >
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
						<input type="text" class="required" name="loginname" id="loginname" onblur="chkloginname()" maxlength="100" value="${user.username }" placeholder="请输入账号"/>
						<span id="resultName" name="resultName"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" class="required" name="password" id="password" onblur="chkpassword()" maxlength="100" placeholder="请输入密码"/>
						<span id="resultPwd"  name="resultPwd"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						确认密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" class="required" name="repwd" id="repwd" onblur="chkRePwd()" maxlength="100" placeholder="请确认密码"/>
						<span id="resultRepwd" name="resultRepwd"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						真实姓名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="realname" id="realname" onblur="chkrealname()" maxlength="100" placeholder="请输入真实姓名"/>
						<span id="resultRealName"name="resultRealName"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<input type="radio" class="required" name="sex" value="男" maxlength="100" checked="checked"/>男
						<input type="radio" class="required" name="sex" value="女" maxlength="100"/>女
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						出生年月:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="Wdate" name="birthday"  id="birthday" onblur="WdatePicker()" maxlength="100" />
						<span id="resultDate" name="resultDate"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						电子邮箱:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="email" id="email" onblur="chkemail()" maxlength="100" placeholder="请输入电子邮箱"/>
						<span id="resultEmail" name="resultEmail"></span>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select id="dep1" name="dept">
						<c:forEach items="${DLIST}" var="dept">
							<option value="${dept.deptno}">${dept.dname}</option>
						</c:forEach>
						</select>
						<select id="dep2" name="deptno.deptno">
						<c:forEach items="${DLIST2}" var="dept1">
							<option value="${dept1.deptno}">${dept1.dname}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						头像:</td><td width="80%" class="pn-fcontent">
						<input type="file" name="file" onblur="chkemail()" onchange="upload()" maxlength="100"/>
						<img id="img" width="150px" height="100px" />
							<!-- 提交图片路径 -->
						<input type="hidden" name="pic" id="pic"/>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>