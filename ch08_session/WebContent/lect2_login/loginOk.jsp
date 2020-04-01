<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String msg= "";
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//DB연결을 통해 id와 pw검색
	if(id!=null && id.equals("aaa")){	//유효id인지
		if(pw!=null & pw.equals("111")){
			session.setAttribute("id",id);
			session.setAttribute("name","홍길동");
			response.sendRedirect("welcome.jsp");
		}else{
			msg = URLEncoder.encode("pw를 체크하세요","utf-8");
			response.sendRedirect("login.jsp?msg="+msg);
		}
	}else{	//id인지불가
		msg = URLEncoder.encode("id를 체크하세요","utf-8");
		response.sendRedirect("login.jsp?msg="+msg);
	}
%>
</body>
</html>