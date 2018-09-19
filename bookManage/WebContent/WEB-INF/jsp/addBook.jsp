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
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<script type="text/javascript">
	function fnAddBook(){
		if ($("#name").val()== ""||$("#group").val()== ""||$("#by1").val=="") {	
			alert("图书信息尚未填写完整!");
			return;
		}
		$.ajax({
			type:'POST',
			url:'${pageContext.request.getContextPath()}/bookInfoManager/addBooks',
			data:$("#bookadd").serialize(),
			success:function(result){
				alert("图书添加成功~")
			},
	        error: function (err) {
	        	alert("图书添加失败~")
	        }
		});
	}
</script>
<body>
    <form action="" id="bookadd" method="post" >
        <div class = "all" style=font-size:15px>
            <div class="head">添加图书</div>
            <div class="lanmu">
			    <div class="lanmu_title">书本名称:</div>
			    <div class="lanmu_main">
			    	<input type="text" id="name" name="name" value="">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">书本分类:</div>
			    <div class="lanmu_main">
			    	<select id="group" name="bkgroup" size="1">
						<option value="科技杂谈">科技杂谈</option>
						<option value="文学小说">文学小说</option>
						<option value="政治法律">政治法律</option>
						<option value="环境科学">环境科学</option>
						<option value="马列思想">马列思想</option>
						<option value="校内教科书">校内教科书</option>
					</select>
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">书本简介:</div>
			    <div class="lanmu_main">
			    	<textarea id="by1" name="by1" cols="80" rows="3"  placeholder="" value="" ></textarea>
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title"></div>
			    <div class="lanmu_main">
			    	<input type="button" id="xzBtn" value="新增图书" onclick="fnAddBook()">
			    </div>
		    </div>
        </div>
    </form>
</body>
</html>