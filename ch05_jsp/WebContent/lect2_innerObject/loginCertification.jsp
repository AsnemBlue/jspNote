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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if(id.equals("aaa") && pw.equals("111") && id!=null && pw!=null){
		out.print("아이디는 "+id+"이고 <br>비밀번호는 "+pw+"로 인증 성공");
	}else{
%>
	
<%		
		response.sendRedirect("loginFrm.jsp?chk=1");
	}
	//sendRedirect로 message로 한글 보낼경우 인코딩이 필요, msg=URLEmcoder.dncode("할말","utf-8");
	
%>
</body>
</html>