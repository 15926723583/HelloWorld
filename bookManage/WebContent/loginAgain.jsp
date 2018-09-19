<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).keydown(function(event){
			if(event.keyCode == 13){
				fnLogin();
			}
		});
	});
	function fnLogin() {
		$.ajax({
			type:'POST',
			url:'userManager/loginInfo',
			data:$("#login_form").serialize(),
			success:function(result){
				if(result == "adminsuccess"){
					window.location.href="userManager/index";
				}else if(result == "usersuccess"){
					alert("用户界面还没做呢，急什么")
				}else{
					alert("登录失败，请检查用户名与密码是否输入正确！");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="loginTop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li>
				<a href="index.jsp">回首页</a>
			</li>
			<li>
				<a href="#">帮助</a>
			</li>
			<li>
				<a href="#">关于</a>
			</li>
		</ul>
	</div>
	<div class="loginBody">
		<span class="loginLogo"></span>
		<div class="loginForm">
			<form id="login_form"  method="post">
				<ul>
					<li>
						<input name="nam" type="text" class="loginuser" placeholder="请输入用户名" id="name" />
					</li>
					<li>
						<input name="pwd" type="password" class="loginpwd" id="password" placeholder="请输入密码" />
					</li>
					<li>
						<select name="character" class="loginuser">
							<option value="用户">用户</option>
							<option value="管理员">管理员</option>
						</select>
					</li>
					<li>
						<input type="button" class="loginbtn" value="登录" onclick="fnLogin()" />
						<input type="button" class="loginbtn" value="注册" onclick="fnTanchuang()" />
						<label>
							<input name="" type="checkbox" value="" checked="checked" />记住密码
						</label>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
function fnTanchuang(){
	var h= window.screen.height;
	var w= window.screen.width;
	window.open("register.jsp","newwindow","height="+h/2+",width="+w/2+",top="+h/4+",left="+w/4);
}
</script>
</html>