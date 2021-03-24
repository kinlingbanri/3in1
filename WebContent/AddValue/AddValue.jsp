<%@page import="com.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	System.out.println("Session username : " + memVO.getUsername());
	Object DID = session.getAttribute("DID");
	System.out.println("Session DID : " + DID.toString());
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">	
  <title>加值系統</title>

	<link rel="shortcut icon" href="#" />
	<link rel="stylesheet" href="../css/bootstrap.css">
	<style>
		.element::-webkit-scrollbar { width: 0 !important }
		.element { -ms-overflow-style: none; }
		.element { overflow: -moz-scrollbars-none; }
	</style>
	
	<script src="../js/jquery-3.3.1.js"></script>
	<script src="../js/bootstrap-4.0.0/bootstrap.js"></script>
</head>

<body style="font-family: Microsoft JhengHei;">
  
  <!-- .navbar-expand-{sm|md|lg|xl}決定在哪個斷點以上就出現漢堡式選單 -->
  <!-- navbar-dark 文字顏色 .bg-dark 背景顏色 -->
  <!-- .navbar-expand-{sm|md|lg|xl}決定在哪個斷點以上就出現漢堡式選單 -->
  <!-- navbar-dark 文字顏色 .bg-dark 背景顏色 -->
  <nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#AAAAAA !important;">
    <!-- .navbar-brand 左上LOGO位置 -->
    <a class="navbar-brand" href="#">
<!--       <img src="../images/icons8-menu.svg" width="30" height="30" class="d-inline-block align-top" alt=""> -->
      <span class="h3 mx-1" style="font-weight:bold;">加值服務</span>
    </a>
    <!-- .navbar-toggler 漢堡式選單按鈕 -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <!-- .navbar-toggler-icon 漢堡式選單Icon -->
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <!-- .collapse.navbar-collapse 用於外層中斷點群組和隱藏導覽列內容 -->
    <!-- 選單項目&漢堡式折疊選單 -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-top:4px;">
      <ul class="navbar-nav mr-auto">
        <!-- active表示當前頁面 -->
        <li class="nav-item active">
          <a class="nav-link" href="#" style="text-align: right; color: #FFFFFF;">交易紀錄<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="text-align: right; color: #FFFFFF;">會員資料</a>
        </li>
				<li class="nav-item">
					<button id="menuLogoutBtn" class="nav-link"
						style="float:right; color: #FFFFFF; padding-top: 6px]; border: none;
						background: none;">登出</button>
<!--           <a class="nav-link" href="#" style="text-align: right; color: #FFFFFF;">登出</a> -->
        </li>
    </div>
  </nav>
  
  <section>
		<div style="text-align: center;">
			<h2>
				中山店加值機1號
			</h2>
			<h4 style="font-size:20px; color:#DDDDDD;">
				優惠價
			</h4>
		</div>
		<div>
			<table width="100%" border="0">
				<tbody>
					<tr>
						<td style="text-align: right;">200元</td>
						<td style="text-align: center;">-&gt;&nbsp;</td>
						<td style="text-align: left; color:aqua;">220點</td>
					</tr>
					<tr>
						<td style="text-align: right;">500元</td>
						<td style="text-align: center;">-&gt;&nbsp;<br></td>
						<td style="text-align: left; color:aqua;">600點<br></td>
					</tr>
					<tr>
						<td style="text-align: right;">1000元</td>
						<td style="text-align: center;">-&gt;&nbsp;</td>
						<td style="text-align: left; color:aqua;">1300點</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="margin: 7% 0 0 0; text-align:center;">
			<p style="margin: 0 0 0 0; font-size:16px;">已投入金額</p>
			<p style="font-weight: bold; color: #FF993C; margin: 0 0 0 0;">0元</p>
			<p style="margin: 6px 0 0 0;">加值點數為</p>
			<p style="font-weight: bold; color: #FF993C;">0點</p>
			<p style="margin: 0 0 0 0; font-size:16px;">系統將於以下時間結束後自動完成加值</p>
			<p style="margin: 0 0 0 0; font-size:16px;">或請按完成，手動完成加值</p>
			<p id="timer" style="color:red; font-weight:bold; font-size:18px;">30秒</p>
			<button class="btn btn-outline-success" style="font-weight:bold;" id="logoutBtn">
				登出
			</button>
		</div>
  </section><!-- End Section -->  
  
  
  <script>

		var count = 30;
		var myTimerVar= setInterval(function(){ myTimer()}, 1000);
		
		function myTimer(){
			if(count == 0){
				clearInterval(myTimerVar);
			}else{
				count = count - 1;
				console.log("count : " + count);
				var countStr = count + "秒";
				document.getElementById("timer").innerText = countStr;
			}
		}
		
		$("#logoutBtn").click(function(){
			count = 30;
			var countStr = count + "秒";
			document.getElementById("timer").innerText = countStr;
			clearInterval(myTimerVar);		
			myTimerVar= setInterval(function(){ myTimer()}, 1000);
		});
		
		$("#menuLogoutBtn").click(function(){
			$.ajax({
			    type: 'POST',                     //GET or POST
			    url: "../LogoutServlet",            //請求的頁面
			    cache: false,                     //防止抓到快取的回應
			    data: {},
			    success: function (jsonObject) {         //當請求成功後此事件會被呼叫
			    	window.location.href = "../index.jsp";
			    },
			    error: function(e){
			    	console.log("e: " + e);
			    },            //當請求失敗後此事件會被呼叫
			    statusCode: {                     //狀態碼處理
			      404: function() {
			        alert("page not found");
			      }
			    }
				});
			});
 
  </script>
</body>
</html>