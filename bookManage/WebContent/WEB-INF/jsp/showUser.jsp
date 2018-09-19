<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kuangjia.css">
<script src="../js/jquery-3.2.1.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<script type="text/javascript">
function fnUpdateUser(){
	if(parseInt($("#num").val())<0||parseInt($("#num").val())>100||$("#num").val()==""){
		alert("信用度不在正常范围哦~");
		console.log(parseInt($("#num").val()));
		return;
	}
	$.ajax({
		type:'POST',
		url:'${pageContext.request.getContextPath()}/userManager/updateUser',
		data:$("#userUpdate").serialize(),
		success:function(result){
			alert("修改成功！")
		},
        error: function (err) {
        	alert("修改失败!")
        }
	});
}
</script>
<body>
    <form action="" id="userUpdate" method="post" >
        <div class = "all" style=font-size:15px>
            <div class="head">用户管理</div>
            <div class="lanmu">
			    <div class="lanmu_title">用户ID:</div>
			    <div class="lanmu_main">
			    	<input type="text" name="id" readonly="readonly" value="${user.id}">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">用户名:</div>
			    <div class="lanmu_main">
			    	<input type="text" name="name" readonly="readonly" value="${user.name}">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">信用度:</div>
			    <div class="lanmu_main">
			    	<input type="text" id="num" name="num"  value="${user.num}">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">联系方式:</div>
			    <div class="lanmu_main">
			    	<input type="text" name="tel" readonly="readonly"  value="${user.tel}">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title"></div>
			    <div class="lanmu_main">
			    	<input type="button" id="xzBtn" value="修改用户" onclick="fnUpdateUser()">
			    </div>
		    </div>
        </div>
    </form>
</body>
</html>