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
	function fun(id) {
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/bookInfoManager/showBookById?id='+id,
			success:function(result){
				window.location.href="${pageContext.request.getContextPath()}/bookInfoManager/showBookById?id="+id;
			},
			error: function (err) {
            	alert("查看失败")
            }
		});
		console.log(id);
	}
	function recomBook(id) {
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/bookInfoManager/recomBook',
			data:{"id":id},
			success:function(result){
				console.log(result)
				if(result == "success"){
					alert("推荐成功!")
				}else{
					alert("推荐失败!")
				} 
			},
			error: function (err) {
            	alert("推荐失败!")
            }
		});
	}
	function selectBook() {
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/bookInfoManager/showBook',
			data:$("#showBook").serialize(),
			success:function(result){
				/*删除不要的内容  */
				$("#showTable").remove();
				var $data = $(result)                      // 将整个文档转化为jquery对象
				var target_div = $data.find("#showTable"); // 获取到你要显示的div
				// 将这个div显示
				$("#showDiv").append(target_div); //怎么显示你自己处理
			},
			error: function (err) {
            	alert("搜索失败")
            }
		});
	}
</script>
<body>
	<div class="panel admin-panel">
           <form id="showBook"  method="">
           		<div class="panel-head">图书列表
	           	<input type="text" id="bkname" name="bkname" onkeydown="if(event.keyCode==13){selectBook();return false;}"  value="" />
	           	<input type="button" onclick="selectBook()" value="查询" />
           </form>
           </div>
		<div id="showDiv" style="width:100%;margin:0px auto;text-align:center">
			<table id="showTable" class="table table-hover text-center">
				<tr style="text-align: center;">
					<td>书本索引</td>
					<td>书本名称</td>
					<td>书本分类</td>
					<td>书本状态</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${booklist}" var="bl">
		           <tr style="text-align: center;">
		               <td>${bl.id}</td>
		               <td>${bl.name}</td> 
		               <td>${bl.bkgroup}</td>
		               <td>${bl.stat}</td>   
		               <td>
		               		<a href="javascript:void(0);" onclick="fun(${bl.id})">查看&nbsp;|</a>
		               		<a href="javascript:void(0);" onclick="recomBook(${bl.id})">推荐</a>
		               </td>  
		           </tr>
		      	 </c:forEach>
			</table>
		</div>
		<!-- pageHelper写法  -->
		<div style="text-align:right;">
			<a href="?start=0">首  页</a>
			<c:if test="${page.start != 0}"> 
				<a href="?start=${page.start-page.count}">上一页</a>
			</c:if> 
			<c:if test="${page.start < page.last}"> 
				<a href="?start=${page.start+page.count}">下一页</a>
			</c:if> 
			<a href="?start=${page.last}">末  页</a>
			<span>当前页数:&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber type="number" value="${(page.start+page.count)/5}" maxFractionDigits="0"/></span>
		</div>
	</div>
</body>
</html>