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
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	int currentPage = Integer.parseInt(pageNum);
	final int PAGESIZE = 3, BLOCKSIZE=5;
	int startRow = (currentPage-1)*PAGESIZE + 1;
	int endRow = startRow + PAGESIZE -1;

	BookDao bDao = BookDao.getInstance();
	ArrayList<BookDto> books = bDao.listBook(startRow, endRow);
	out.print("<table>");
	out.print("<tr>");	
	for(BookDto book : books){%>
		<td><a href="bdetail.jsp?bid=<%=book.getBid() %>&pageNum=<%=pageNum %>">
			<img src="../bookimg/<%=book.getBimage1()%>"></a><br>
				<%=book.getBtitle() %><br>
				<b><del><%=book.getBprice() %></del></b><br>
				<%=book.getBprice()*(100-book.getBdiscount())/100 %>
				(<%=book.getBdiscount() %>%할인)
			</td>
<%	}
	out.print("</tr></table>");
	out.print("<div class='paging'>");
	int bookTotCnt = bDao.getBookTotCnt();
	int pageCnt = (int)Math.ceil((double)bookTotCnt/PAGESIZE);
	int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
	int endPage = startPage + BLOCKSIZE -1;
	if(endPage>pageCnt) endPage = pageCnt;
	
	if(startPage>BLOCKSIZE){%>
		[ <a href="listP.jsp?pageNum=<%=startPage-1%>"> 이전</a>]
<%	}%>
<% 	for (int i=startPage; i<=endPage ; i++){
		if(i==currentPage){
			out.print(" [ "+i+" ] ");
		}else{
			out.print(" [ <a href='listP.jsp?pageNum="+i+"'>"+i+"</a> ]");
		}
	}
	if(endPage<pageCnt){%>
	 	[ <a href="listP.jsp?pageNum=<%=endPage+1%>"> 다음</a>]
<%	} %>	
	</div>
</body>
</html>