<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>信息管理系统界面</title>
<link href="${pageContext.request.contextPath}/css/main-style.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function(){
		setInterval(check,1000 * 11);
	});
	function check() {
		<!--Q1-->
		/* //不能成功的原因，只要到了这个页面，username必定有值，不进行请求或者刷新的话，无法更新结果
		var isUser = "${username}";
		console.log(isUser);
		if(isUser == ""){
			window.location.href = "${pageContext.request.contextPath}/login.jsp";
		} */
		<!--Q2-->
		/* //正常情况：没有被拦截，那肯定是空值
		//开启即被拦截的情况：flag已经有值，所有运行后即跳到登录页面
		var isUser = "${flag}";
		if(isUser == "true"){
			window.location.href = "${pageContext.request.contextPath}/login.jsp";
		}
		console.log(isUser); */
		<!--Q3-->
		//错误原因：没有真正的刷新值
		//解决办法：开放拦截器资源，让它访问后台获取session
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/userManager/checkUser',
			success:function(result){
				console.log(result);
				if("failure" == result){
					window.location.href = "${pageContext.request.contextPath}/login.jsp";
				}
			}
		});
		<!--Q4-->
		/* //失败的原因，我的理解是ajax的url请求是隐式的，虽然被拦截，请求的地址也确实转向了login，但是我们无法观察到
		//通过改变拦截器的最终定向，证明了结果，因此被拦截，页面没有跳转，因为访问的页面是ajax中隐式的
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/userManager/index',
			success:function(result){
				console.log("执行了");
			}
		}); */

	}
	$(function(){
		//一级导航栏
		$(".menu_first").click(function(e){
			$(".ink").remove();
			$(".menu_first").next().slideUp(200);
			$(".menu_first").removeClass("active");
			$(e.target).addClass("submenu-indicator-minus");
			$(".menu_first").removeClass("submenu-indicator-minus");
			if($(e.target).next().css("display")=="none"){
				$(e.target).addClass("active");
				$(e.target).next().slideDown(200);
			}
			else{
				$(e.target).removeClass("submenu-indicator-minus");
			}
		})
		
		//按钮光效
		$("a").click(function(e){
			parent = $(this);
			if(parent.find(".ink").length == 0)
				parent.prepend("<span class='ink'></span>");
				
			ink = parent.find(".ink");
			ink.removeClass("animate");
			if(!ink.height() && !ink.width())
			{
				d = Math.max(parent.outerWidth(), parent.outerHeight());
				ink.css({height: d, width: d});
			}
			x = e.pageX - parent.offset().left - ink.width()/2;
			y = e.pageY - parent.offset().top - ink.height()/2;
			ink.css({top: y+'px', left: x+'px'}).addClass("animate");
		})
	})
</script>
</head>
<style>
#did{
	text-align: right;
	line-height: 80px;
	color: white;
	font-size: 18px;
	font-weight: bold;
 }
 #dia{
 	font-size: 13px;
 	color: white;
 }
</style>
<body>
	<div id="header">
		<div class="top_left"><img src="../images/loginlogo.png"/></div>
		<div id="did">当前用户:&nbsp;&nbsp;${username}&nbsp;&nbsp;&nbsp;<a id="dia" href="${pageContext.request.contextPath}/loginAgain.jsp">切换用户</a></div>
	</div>
	<div id="menu">
		<ul>
			<li>
				<a class="menu_first"><i class="fa fa-cog"></i>图书管理<span class="submenu-indicator">+</span></a>
				<ul style="display: none">
					<li>
						<li>
							<a class="menu_second" href="${pageContext.request.contextPath}/bookInfoManager/addBook" target="right">新增图书</a>
						</li>
						<li>
							<a class="menu_second" href="${pageContext.request.contextPath}/bookInfoManager/showBook" target="right">查询图书</a>
						</li>
					</li>
				</ul>
			</li>
			<li>
				<a class="menu_first"><i class="fa fa-cog"></i>用户操作<span class="submenu-indicator">+</span></a>
				<ul style="display: none">
					<li>
						<li>
							<a class="menu_second" href="${pageContext.request.contextPath}/userManager/userInfo" target="right">查看及修改</a>
						</li>
					</li>
				</ul>
			</li>
			<li>
				<a class="menu_first"><i class="fa fa-cog"></i>借阅管理<span class="submenu-indicator">+</span></a>
				<ul style="display: none">
					<li>
						<li>
							<a class="menu_second" href="${pageContext.request.contextPath}/borrowManager/showBorrow" target="right">归还书籍</a>
						</li>
					</li>
				</ul>
			</li>
			<li>
				<a class="menu_first"><i class="fa fa-cog"></i>历史借阅<span class="submenu-indicator">+</span></a>
				<ul style="display: none">
					<li>
						<li>
							<a class="menu_second" href="${pageContext.request.contextPath}/borrowHis/showBorrowHis" target="right">查看记录</a>
						</li>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="body">
		<iframe scrolling="auto" rameborder="0" src="${pageContext.request.contextPath}/userManager/userInfo" name="right" width="100%" height="100%"></iframe>
	</div>
</body>
</html>