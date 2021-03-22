<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>三合一加值系統</title>
	<link rel="shortcut icon" href="#" />
	<style>
		body{
			margin:0;
			color:#6a6f8c;
			background:#c8c8c8;
			font:600 16px/18px 'Open Sans',sans-serif;
		}
		*,:after,:before{box-sizing:border-box}
		.clearfix:after,.clearfix:before{content:'';display:table}
		.clearfix:after{clear:both;display:block}
		a{color:inherit;text-decoration:none}

		.login-wrap{
			width:100%;
			margin:auto;
			max-width:525px;
			min-height:1080px;
			position:relative;
			background:url("./images/TongYa002.jpg") no-repeat center;
			box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
		}
		.login-html{
			width:100%;
			height:100%;
			position:absolute;
			padding:90px 70px 50px 70px;
			background:rgba(40,57,101,.9);
		}
		.login-html .sign-in-htm,
		.login-html .sign-up-htm{
			top:0;
			left:0;
			right:0;
			bottom:0;
			position:absolute;
			transform:rotateY(180deg);
			backface-visibility:hidden;
			transition:all .4s linear;
		}
		.login-html .sign-in,
		.login-html .sign-up,
		.login-form .group .check{
			display:none;
		}
		.login-html .tab,
		.login-form .group .label,
		.login-form .group .button{
			text-transform:uppercase;
		}
		.login-html .tab{
			font-size:22px;
			margin-right:15px;
			padding-bottom:5px;
			margin:0 15px 10px 0;
			display:inline-block;
			border-bottom:2px solid transparent;
		}
		.login-html .sign-in:checked + .tab,
		.login-html .sign-up:checked + .tab{
			color:#fff;
			border-color:#1161ee;
		}
		.login-form{
			min-height:345px;
			position:relative;
			perspective:1000px;
			transform-style:preserve-3d;
		}
		.login-form .group{
			margin-bottom:15px;
		}
		.login-form .group .label,
		.login-form .group .input,
		.login-form .group .button{
			width:100%;
			color:#fff;
			display:block;
		}
		.login-form .group .input,
		.login-form .group .button{
			border:none;
			padding:15px 20px;
			border-radius:25px;
			background:rgba(255,255,255,.1);
		}
		.login-form .group input[data-type="password"]{
			text-security:circle;
			-webkit-text-security:circle;
		}
		.login-form .group .label{
			color:#aaa;
			font-size:12px;
		}
		.login-form .group .button{
			background:#1161ee;
		}
		.login-form .group label .icon{
			width:15px;
			height:15px;
			border-radius:2px;
			position:relative;
			display:inline-block;
			background:rgba(255,255,255,.1);
		}
		.login-form .group label .icon:before,
		.login-form .group label .icon:after{
			content:'';
			width:10px;
			height:2px;
			background:#fff;
			position:absolute;
			transition:all .2s ease-in-out 0s;
		}
		.login-form .group label .icon:before{
			left:3px;
			width:5px;
			bottom:6px;
			transform:scale(0) rotate(0);
		}
		.login-form .group label .icon:after{
			top:6px;
			right:0;
			transform:scale(0) rotate(0);
		}
		.login-form .group .check:checked + label{
			color:#fff;
		}
		.login-form .group .check:checked + label .icon{
			background:#1161ee;
		}
		.login-form .group .check:checked + label .icon:before{
			transform:scale(1) rotate(45deg);
		}
		.login-form .group .check:checked + label .icon:after{
			transform:scale(1) rotate(-45deg);
		}
		.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
			transform:rotate(0);
		}
		.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
			transform:rotate(0);
		}

		.hr{
			height:2px;
			margin:60px 0 50px 0;
			background:rgba(255,255,255,.2);
		}
		.foot-lnk{
			text-align:center;
		}
	</style>
	<script src="./js/jquery-3.3.1.js"></script>
	<script src="./js/nicescroll.js"></script>
</head>

<body id="body">
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登入</label>
			<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">註冊</label>
			
			<div class="login-form">
				<div class="sign-in-htm">
				<form action="">
					<div class="group">
						<label for="user" class="label">帳號</label>
						<input id="user" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">密碼</label>
						<input id="pass" type="password" class="input" data-type="password">
					</div>
					
					<!--
					<div class="group">
						<input id="showPwd" type="checkbox" class="check">
						<label for="check"><span class="icon"></span>顯示密碼</label>
					</div>
					-->
					<div class="group">
						<label for="check">
							<input type="checkbox" name="showPwd" id="showPwd">顯示密碼
						</label>
					</div>
					
					<input type="hidden" name="DID" value="">

					<div class="group">
						<button class="button" id="loginBtn">登入</button>
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href="#forgot">忘記密碼?</a>
					</div>
				</div>
				</form>
				
				
				<div class="sign-up-htm">
				<form action="">
					<div class="group">
						<label for="user" class="label">帳號</label>
						<input id="user" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">Email</label>
						<input id="pass" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">再輸入一次Email</label>
						<input id="pass" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">密碼</label>
						<input id="pass" type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<label for="pass" class="label">再輸入一次密碼</label>
						<input id="pass" type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<input type="submit" class="button" value="註冊">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-1">已有帳號?</a>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$("#body").niceScroll({
        cursorcolor: "#0026BF",
        cursorborder: "1px solid #30BAFF", 
        autohidemode: "hidden",
        cursorwidth: "10px"
    });
		
		$("#loginBtn").click(function(){
			window.location.href = "./AddValue/AddValue.jsp";
		});
	</script>
</body>