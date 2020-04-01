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
<body>
	<table><tr>
	<%
		BookDao bDao = BookDao.getInstance();
		ArrayList<BookDto> books = bDao.listBook();
		for(int i=0; i<books.size(); i++){%>
			<td><img src="../bookimg/<%=books.get(i).getBimage1()%>"><br>
				<h5><%=books.get(i).getBtitle() %></h5><br>
				<del><%=books.get(i).getBprice() %></del><br>
				<%=books.get(i).getBprice()*(100-books.get(i).getBdiscount())/100 %>
				(<%=books.get(i).getBdiscount() %>%할인)
			</td>
			<%if(i%3==2) out.print("</tr><tr>"); %>
				
<%		}
	%>
	</tr></table>
</body>
</html>