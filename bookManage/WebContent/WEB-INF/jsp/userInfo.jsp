<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>部门信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kuangjia.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
</head>
<script type="text/javascript">
	function update(id) {
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/userManager/selectUser?id='+id,
			success:function(result){
				window.location.href="${pageContext.request.getContextPath()}/userManager/selectUser?id="+id;
			},
			error: function (err) {
            	alert("查看失败")
            }
		});
	}
	function selectUser() {
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/userManager/userInfo',
			data:$("#showUser").serialize(),
			success:function(result){
				/*删除不要的内容  */
				$("#showTable").remove();
				var $data = $(result)                      // 将整个文档转化为jquery对象
				var target_div = $data.find("#showTable"); // 获取到你要显示的div
				$("#showDiv").append(target_div);
			},
			error: function (err) {
            	alert("搜索失败")
            }
		});
	}
</script>
<body>
	<div class="panel admin-panel">
           <form id="showUser"  method="">
          		<div class="panel-head">用户列表
           	<input type="text" id="user" name="user" onkeydown="if(event.keyCode==13){selectUser();return false;}"  value="" />
           	<input type="button" onclick="selectUser()" value="查询" />
           </form>
		<div id="showDiv" style="width:100%;margin:0px auto;text-align:center">
			<table id="showTable" class="table table-hover text-center">
		      	<tr id="main">
		        	<th width="10%">用户ID</th>
		        	<th width="15%">用户名</th>
		        	<th width="10%">信用度</th>
		        	<th width="15%">联系方式</th>
		        	<th width="15%">操作</th>
		      	</tr>
				<c:forEach items="${list}" var="li">
		        	<tr>
		               <td>${li.id}</td>
		               <td>${li.name}</td> 
		               <td>${li.num}</td>
		               <td>${li.tel}</td>   
		               <td><a href="javascript:void(0);" onclick="update(${li.id})">修改</a></td>  
		           	</tr>
		      	</c:forEach>
   			</table>
		</div>
		<div style="text-align:right;">
			<a href="${pageContext.request.contextPath}/userManager/userInfo?start=0">首  页</a>
			<c:if test="${page.start != 0}"> 
				<a href="${pageContext.request.contextPath}/userManager/userInfo?start=${page.start-page.count}">上一页</a>
			</c:if> 
			<c:if test="${page.start < page.last}"> 
				<a href="${pageContext.request.contextPath}/userManager/userInfo?start=${page.start+page.count}">下一页</a>
			</c:if> 
			<a href="${pageContext.request.contextPath}/userManager/userInfo?start=${page.last}">末  页</a>
			<span>当前页数:&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber type="number" value="${(page.start+page.count)/5}" maxFractionDigits="0"/></span>
		</div>
	</div>
</body>
</html>