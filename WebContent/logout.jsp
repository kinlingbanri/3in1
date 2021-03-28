<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Object object = session.getAttribute("DID");
	String DID = object.toString();
	System.out.println("Logout.jsp session DID : " +DID );

	//清除session資料
	session.invalidate();
	//跳躍到登入畫面
	String returnURL = "0;url=index.jsp?DID=" + DID;
	response.setHeader("refresh", returnURL);

	
	
// 	session.invalidate();
// 	request.getSession();
// 	session.setAttribute("DID", DID);
// 	String url = "index.jsp?DID=" + DID;
// 	response.sendRedirect(url);
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