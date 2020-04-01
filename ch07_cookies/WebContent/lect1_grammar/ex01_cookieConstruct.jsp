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
<%
	Cookie cookie = new Cookie("cookieName","cookieValue"); //쿠키생성
	Cookie cookie2 = new Cookie("test","testpw"); //쿠키생성
	cookie.setMaxAge(60*60); //한시간 유효한 쿠키
	response.addCookie(cookie);
	response.addCookie(cookie2);
%>
	<h2>지금 막 생성된 쿠키 이름 : <%=cookie.getName() %></h2>
	<h2>지금 막 생성된 쿠키 값 : <%=cookie.getValue() %></h2>
	<hr>
	<a href="ex02_cookieslist.jsp">쿠키값 리스트 확인</a><br>
	<a href="ex03_thatCookie.jsp">특정 쿠키값(이름이 cookieName) 찾기</a><br>
	<a href="ex04_cookieDel.jsp">쿠키 삭제</a>
</body>
</html>