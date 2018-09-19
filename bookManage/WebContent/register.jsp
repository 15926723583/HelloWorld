<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
<link rel="stylesheet" href="css/pintuer.css"/>
<link rel="stylesheet" href="css/kuangjia.css">
<script src="js/jquery-3.2.1.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<style type="text/css">
	span{
		color: red;
		margin-left: 5px;
		visibility: hidden;
	}
</style>
<script type="text/javascript">
	var nameflag = false;
	var namflag = false;
	var pwdflag = false;
	var pwd2flag = false;
	var telflag = false;
	function nameblur(id) {
		var reg1 = /[\u4e00-\u9fa5]/;
		if(reg1.test($("#name").val())){
			nameflag = true;
			document.getElementById(id+"span").style.visibility = "hidden";
		}else{
			document.getElementById(id+"span").style.visibility = "visible";
		}
	}
	function namblur(id) {
		var reg2 = /^[a-zA-Z0-9_-]{4,16}$/;
		if(reg2.test($("#nam").val())){
			namflag = true;
			document.getElementById(id + "span").style.visibility = "hidden";
		}else{
			document.getElementById(id + "span").style.visibility = "visible";
		}
	}
	function pwdblur(id) {
		var reg2 = /^[a-zA-Z0-9_-]{4,16}$/;
		if(reg2.test($("#pwd").val())){
			pwdflag = true;
			document.getElementById(id + "span").style.visibility = "hidden";
		}else{
			document.getElementById(id + "span").style.visibility = "visible";
		}
	}
	function pwd2blur(id) {
		var p1 = $("#pwd").val();
		var p2 = $("#pwd2").val();
		if(p1 == p2){
			pwd2flag = true;
			document.getElementById(id + "span").style.visibility = "hidden";
		}else{
			document.getElementById(id + "span").style.visibility = "visible";
		}
	}
	function telblur(id) {
		var reg = /13[123569]{1}\d{8}|15[1235689]\d{8}|188\d{8}/;
		if(reg.test($("#tel").val())){
			telflag = true;
			document.getElementById(id+"span").style.visibility = "hidden";
		}else{
			document.getElementById(id+"span").style.visibility = "visible";
		}
	}
	function fnRegiser(){
		if ($("#name").val()== ""||$("#nam").val()== ""||$("#pwd").val==""||$("#pwd2").val==""||$("#tel").val=="") {	
			alert("注册信息尚未填写完整!");
			return;
		}
		if(nameflag && namflag && pwdflag && pwd2flag && telflag){
			$.ajax({
				type:'POST',
				url:'${pageContext.request.getContextPath()}/userManager/addUser',
				data:$("#userform").serialize(),
				success:function(result){
					if(result = "success"){
						alert("注册成功~快去登录吧！");
						window.close();
					}else{
						alert("注册失败!");
					}
				},
		        error: function (err) {
		        	alert("数据库异常~")
		        }
			});
		}else{
			alert("注册信息不合规范，请按提示修改！")
			return;
		}
	}
</script>
<body>
    <form action="" id="userform" method="post" >
        <div class = "all" style=font-size:15px>
            <div class="head">用户注册</div>
            <div class="lanmu">
			    <div class="lanmu_title">用户姓名:</div>
			    <div class="lanmu_main">
			    	<input type="text" onblur="nameblur('name')" id="name" name="name" value=""><span id="namespan">*用户姓名不合法，请使用汉字</span>
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">登录用户名:</div>
			    <div class="lanmu_main">
			    	<input type="text" onblur="namblur('nam')" id="nam" name="nam" value=""><span id="namspan">*用户名不合法</span>
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">密码:</div>
			    <div class="lanmu_main">
			    	<input type="text" onblur="pwdblur('pwd')" id="pwd" name="pwd" value=""><span id="pwdspan">*密码不合法</span>
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">确认密码:</div>
			    <div class="lanmu_main">
			    	<input type="text" onblur="pwd2blur('pwd2')"  id="pwd2" name="pwd2" value=""><span id="pwd2span">*密码两次不一致</span>
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title">联系方式:</div>
			    <div class="lanmu_main">
			    	<input type="text" onblur="telblur('tel')" id="tel" name="tel" value=""><span id="telspan">*联系方式不合法</span>
                </div>
		    </div>
		    <div class="lanmu">
			    <div class="lanmu_title"></div>
			    <div class="lanmu_main">
			    	<input type="button" id="xzBtn" value="注册" onclick="fnRegiser()">
			    	<input type="reset" id="xzBtn" value="重置">
			    </div>
		    </div>
        </div>
    </form>
</body>
</html>