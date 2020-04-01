<%@page import="com.tj.book.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.book.BookDao"%>
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
<body>etBdiscount()
<%
	BookDao bDao = BookDao.getInstance();
	ArrayList<BookDto> books = bDao.listBook();
%>
	<table>
		<caption>책 리스트</caption>
		<tr><th>책</th><th>책이름</th><th>책표지</th><th>가격</th><th>할인율</th></tr>
<%		if(books.size()==0){
			out.println("<tr><td colspan='5'>등록된 책이 없습니다</td></tr>");
		}else{
			for(BookDto book : books){
				out.print("<tr><td>"+book.getBid()+"</td><td>"+book.getBtitle()+"</td><td>"+
							"<img src='../bookimg/"+book.getBimage1()+"' width='50'></td>"+
							"<td>"+book.getBprice()+"</td><td>"+book.getBdiscount()+"%</td></tr>");
			}
		}
			
%>
	</table>
</body>
</html>