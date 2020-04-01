<%@page import="java.util.ArrayList"%>
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
	BoardDao bDao = BoardDao.getInstance();
	out.print("<h2>1. DB글갯수 : "+bDao.getBoardTotalCnt()+"</h2>");
	out.print("<h2>2. 글목록</h2>");
	ArrayList<BoardDto> dtos = bDao.listBoard();
	for(int idx = 0; idx<dtos.size(); idx++){
		out.println(dtos.get(idx).toString()+"<br>");
		
	}
	out.println("<h2>3.글쓰기</h2>");
	BoardDto dto = new BoardDto(0, "aa", "t", "123", null, 0 , "1234", 0, 0, 0, "127.0.0.1", null);
	int result = bDao.insertBoard(dto);
	out.println(result==BoardDao.SUCCESS?"글쓰기성공":"글쓰기실패");
	out.println("<h2>3.글 가져오기4.조회수올리기</h2>");
	bDao.hitup(1);
	dto = bDao.getBoardOneLine("1");
	out.println(dto.toString()+"<br>");
	out.println("<h2>5.글수정</h2>");
	dto.setWriter("xxxxxx");
	dto.setSubject("xxxxxxx");
	dto.setContent("xxxxxxxx");
	dto.setIp("0.0.0.0");
	result = bDao.updateBoard(dto);
	out.println(result==BoardDao.SUCCESS?dto.getNum()+"수정성공":"수정실패");
	out.println("<h2>6.1번글 삭제</h2>");
	result = bDao.deletBoard(1, "111");
	out.println(result==BoardDao.SUCCESS?"삭제성공":"비번틀렸");
	
%>
	<a href="xx.jsp">xx</a>
</body>
</html>