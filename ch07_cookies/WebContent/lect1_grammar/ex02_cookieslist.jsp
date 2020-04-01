<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키들 리스트</h1>
	<%
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			String name = cookies[i].getName();	//i번째 쿠키의 이름
			String value = cookies[i].getValue();
			out.print("<h2>"+i+"번째 쿠키 : "+name+"의 값 : "+value);
		}
	%>
	<hr>
	<a href="ex01_cookieConstruct.jsp">쿠키생성</a><br>
	<a href="ex02_cookieslist.jsp">쿠키값 리스트 확인</a><br>
	<a href="ex03_thatCookie.jsp">특정 쿠키값(이름이 cookieName) 찾기</a><br>
	<a href="ex04_cookieDel.jsp">쿠키 삭제</a>
</body>
</html>