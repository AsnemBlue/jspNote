<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginchk</title>
<link href="<%=conPath %>/css/login.css" rel="stylesheet">
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if(id==null || pw==null){
		response.sendRedirect(conPath+"/member/login.jsp?chk=fail");
	}else if(!id.equals("aaa") || !pw.equals("111") ){
		response.sendRedirect(conPath+"/member/login.jsp?chk=fail");
	}
	
%>
<body>
	<div id="loginForm_wrap">
		<div id="login_title">로그인결과</div>
		<div id="login_join">로그인 성공</div>
	</div>
</body>
</html>