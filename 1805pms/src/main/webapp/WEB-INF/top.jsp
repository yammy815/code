
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function getTime(){
		//日期函数
		var date=new Date();	
		//年
		var year=date.getFullYear();
		//月
		var mon=date.getMonth()+1;
		//日
		var d=date.getDate();
		//时
		var hour=date.getHours();
		if(hour<10){
			hour="0"+hour;
		}
		//分
		var min=date.getMinutes();
		if(min<10){
			min="0"+min;
		}
		//秒
		var sec=date.getSeconds();
		if(sec<10){
			sec="0"+sec;
		}
		document.getElementById("currentTime").innerHTML=year+"年"+mon+"月"+d+"日    "+hour+"时"+min+"分"+sec+"秒";
	}
	window.setInterval(getTime,1000);
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    <td width="61%" height="64"><img src="images/logo.gif" width="262" height="64"></td>
    <td width="39%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="74%" height="38" class="admin_txt"><b>${USER.realname}</b> &nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="<%=new Date() %>" pattern="a"/>好,今天是<span id="currentTime" onblur="getTime()"></span><fmt:formatDate value="<%=new Date()%>" pattern="E"/>&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;&nbsp;&nbsp;感谢登录使用！</td>
        <td width="22%"><img src="images/out.gif" alt="安全退出" width="46" height="20" border="0" onclick="javascript:window.history.go(-(history.length-1))"></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" colspan="3">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

    