<%@page import="com.tj.dao.BoardDao"%>
<%@page import="com.tj.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
<%
	BoardDto dto = new BoardDto();
	BoardDao dao = BoardDao.getInstance();
	for(int i=0; i<70; i++){
		dto.setWriter("길동이"+i);
		dto.setSubject("title"+i);
		dto.setContent("내용"+i);
		dto.setEmail("email"+i+"@mail.com");
		dto.setPw("111");
		dto.setIp("192.168.20."+i);
		dao.insertBoard(dto);
	}
	response.sendRedirect("list.jsp");
%>
</body>
</html>