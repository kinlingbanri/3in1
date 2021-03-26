<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
System.out.println("Logout.jsp");
Object object = session.getAttribute("DID");
String DID = object.toString();
System.out.println("session DID : " +DID );
String returnURL = "0;url=index.jsp?DID=" + DID; 

	//跳躍到登入畫面
	response.setHeader("refresh", returnURL);
	//清除session資料
	session.invalidate();
%>
    
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
<meta charset="UTF-8">
<title>三合一加值系統</title>
<link rel="shortcut icon" href="#" />
</head>
<body>

</body>
</html>