<%@page import="com.tj.dto.FriendDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
<style>
p{
width:300px;
margin:0 auto;
}
</style>
</head>
<body>
<form action="friendInputListPro.jsp">
	<p>친구이름<input type="text" name="name" size="4">
		전화<input type="text" name="tel" size="7">
		<input type="submit" value="추가"> 
	</p>
</form>
	<table>
		<tr><th>번호</th><th>이름</th><th>전화</th></tr>
		<%
		FriendDao friendDao = FriendDao.getInstance();
		ArrayList<FriendDto> dtos = friendDao.listup();
		for(FriendDto dto : dtos){%>
			<tr><td><%=dto.getNum() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getTel() %></td></tr>
		<%} %>
	</table>
</body>
</html>