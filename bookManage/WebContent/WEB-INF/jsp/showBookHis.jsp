<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	function selectBookHis() {
		$.ajax({
			type:'GET',
			url:'${pageContext.request.getContextPath()}/borrowHis/showBorrowHis',
			data:$("#showBookHis").serialize(),
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
	function  aTo() {
		var flag = confirm("是否导出数据为excel表?");
		if(flag){
			var value = $("#value").val();
			window.location.href="${pageContext.request.getContextPath()}/borrowHis/toExport?value=" + value;
		}
	}
</script>
<body>
	<div class="panel admin-panel">
           <form id="showBookHis"  method="">
           		<div class="panel-head">借阅历史列表
	           	<input type="text" id="value" name="value" onkeydown="if(event.keyCode==13){selectBookHis();return false;}"  value="" />
	           	<input type="button" onclick="selectBookHis()" value="查询" />
	           	<input type="button" onclick="aTo()" value="导出到Excel" />
           </form>
           </div>
		<div id="showDiv" style="width:100%;margin:0px auto;text-align:center">
			<table id="showTable" class="table table-hover text-center">
				<tr style="text-align: center;">
					<td>图书编号</td>
					<td>图书名称</td>
					<td>借阅人ID</td>
					<td>借阅人姓名</td>
					<td>联系方式</td>
					<td>借阅时间</td>
					<td>约定归还时间</td>
					<td>归还情况</td>
				</tr>
				<c:forEach items="${borrlist}" var="bl">
		           <tr style="text-align: center;">
		               <td>${bl.bkid}</td>
		               <td>${bl.bkname}</td>
		               <td>${bl.usid}</td>
		               <td>${bl.usname}</td> 
		               <td>${bl.ustel}</td> 
		               <td>${bl.betime}</td>   
		               <td>${bl.endtime}</td>   
		               <td>${bl.isgui}</td>  
		           </tr>
		      	 </c:forEach>
			</table>
		</div>
	</div>
</body>
</html>