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
<body>
    <form action="" id="bookadd" method="post" >
        <div class = "all" style=font-size:15px>
            <div class="head">查看图书</div>
            <div class="lanmu">
			    <div class="lanmu_title">书本ID:</div>
			    <div class="lanmu_main">
			    	<input type="text" readonly="readonly" value="${book.id}">
                </div>
		    </div>
            <div class="lanmu">
			    <div class="lanmu_title">书本名称:</div>
			    <div class="lanmu_main">
			    	<input type="text" readonly="readonly" value="${book.name}">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">书本分类:</div>
			    <div class="lanmu_main">
			    	<input type="text" readonly="readonly"  value="${book.bkgroup}">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">书本状态:</div>
			    <div class="lanmu_main">
			    	<input type="text" readonly="readonly"  value="${book.stat}">
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">书本简介:</div>
			    <div class="lanmu_main">
			    	<textarea readonly="readonly" cols="80" rows="3"  placeholder="" value="" >${book.by1}</textarea>
                </div>
		    </div>
        </div>
    </form>
</body>
</html>