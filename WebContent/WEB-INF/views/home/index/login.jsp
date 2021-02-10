<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>用户登录</title>
	<link rel="stylesheet" href="../resources/home/css/base.css" />
	<link rel="stylesheet" href="../resources/home/css/global.css" />
	<link rel="stylesheet" href="../resources/home/css/login-register.css" />
	<link rel="shortcut icon" href="../resources/home/images/icon-fee.png">
	<script type="text/javascript" src="../resources/home/js/jquery.js" ></script>
	<style>
		#mentions{
			font-size:15px;
			text-align:center;
			color:red;
			display:none;
		}
	</style>
</head>
<body>
	<div class="header wrap1000">
		<a href="/OnlineShop"><img src="../resources/home/images/logo.png" alt="" /></a>
	</div>
	
	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户登录</h3>
			</div>
			<div class="form-bd">
				<form action="">
					<dl>
						<dt>用户名</dt>
						<dd><input type="text" name="user" class="text" /></dd>
					</dl>
					<dl>
						<dt>密&nbsp;&nbsp;&nbsp;&nbsp;码</dt>
						<dd><input type="password" name="pwd" class="text"/></dd>
					</dl>
					<dl>
						<dt>验证码</dt>
						<dd>
							<input type="text" name="code" class="text" size="10" style="width:58px;"> 
							<img id="login-code" src="../system/get_cpacha?vl=4&w=100&h=30&type=userLoginCpacha" alt="" align="absmiddle" style="position:relative;top:-2px;"/> <a href="javascript:changeCode()" style="color:#999;">看不清，换一张</a>
						</dd>
					</dl>
					<dl id="mentions"></dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd><input type="button" id="login-submit" value="登  录" class="submit"/></dd>
					</dl>
				</form>
				<dl>
					<dt>&nbsp;</dt>
					<dd> 还不是本站会员？立即 <a href="register" class="register">注册</a></dd>
				</dl>
			</div>
			<div class="form-ft">
			
			</div>		
		</div>
		<div class="login-form-left fl">
			<img src="../resources/home/images/left.jpg" alt="" />
		</div>
	</div>
	
	<div class="footer clear wrap1000">
		<p> <a href="/OnlineShop">首页</a>  </p>
		<p>Copyright &copy; 2020.HoOsOn's Company name All rights reserved.</p>
	</div>
</body>
<script>
	function changeCode(){
		$("#login-code").attr('src','../system/get_cpacha?vl=4&w=100&h=30&type=userLoginCpacha&t='+new Date().getTime());	
	}
	$("#login-submit").click(function(){
		var name = $("input[name='user']").val();
		var password = $("input[name='pwd']").val();
		var code = $("input[name='code']").val();
		var mentions=$("#mentions");
		mentions.empty();
		if(name == ''){
			mentions.css("display","block");
			mentions.append("用户名不能为空");
			//alert(mentions);
			return;
		}
		if(password == ''){
			mentions.css("display","block");
			mentions.append("密码不能为空");
			
			return;
		}
		if(code == ''){
			mentions.css("display","block");
			mentions.append("验证码不能为空");
			
			return;
		}
		$.ajax({
			url:'login',
			type:'POST',
			data:{name:name,password:password,code:code},
			dataType:'json',
			success:function(data){
				if(data.type == 'success'){
					//alert('登录成功!');
					window.location.href = 'index';
				}else{
					mentions.css("display","block");
					mentions.append(data.msg);
					//alert(data.msg);
				}
			}
		});
	});
</script>
</html>
