<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>요청 주소 : <%=request.getRemoteAddr() %>★</h2>
	<h2>컨텍스트 path : <%=request.getContextPath() %>★</h2>
	<h2>요청 방식 : <%=request.getMethod() %></h2>
	<h2>세션객체 : <%=request.getSession() %>- 로그인 처리★</h2> 
	<h2>해당 프로토콜 : <%=request.getProtocol() %></h2>
	<h2>url 요청 : <%=request.getRequestURL() %></h2>
	<h2>uri 요청 : <%=request.getRequestURI() %>★</h2>
	<h2>서버 이름 : <%=request.getServerName() %></h2>
	<h2>포트 번호 : <%=request.getServerPort() %></h2>
	
</body>
</html>