<%@page import="com.tj.dto.BoardDto"%>
<%@page import="com.tj.dao.BoardDao"%>
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
	String pageNum = request.getParameter("pageNum");
	/* String num = request.getParameter("num");
	BoardDao bDao = BoardDao.getInstance();
	BoardDto dto = bDao.getBoardOneLine(num); */
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao bDao = BoardDao.getInstance();
	bDao.hitup(num);
	BoardDto dto = bDao.getBoardOneLine(num);
%>
	<table>
		<caption>글 내용 상세보기</caption>
		<tr><th>글번호</th><td><%=num %></td></tr>
		<tr><th>글제목</th><td><%=dto.getSubject() %></td></tr>
		<tr><th>메일</th> <td><%=dto.getEmail()==null?"-":dto.getEmail()%></td></tr>
		<tr><th>조회수</th><td><%=dto.getHit() %></td></tr>
		<tr><th>본문</th><td><pre><%=dto.getContent()%></pre></td></tr>
		<tr><th>ip</th><td><%=dto.getIp() %></td></tr>
		<tr><th>작성시간</th><td><%=dto.getrDate() %></td></tr>
		<tr><td colspan="2">
		<button onclick="location.href='updateForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'">수정</button>
		<button onclick="location.href='deleteForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'">삭제</button>
		<button onclick="location.href='writeForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'">답변</button>
		<button onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">목록</button>
	</table>
</body>
</html>