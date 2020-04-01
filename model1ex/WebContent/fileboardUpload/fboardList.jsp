<%@page import="com.tj.model1ex.dto.FileboardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.model1ex.dao.FileboardDao"%>
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
body{background-color: #ffffaa;}
#content_form{
	width:1000px; margin:0 auto; height:400px;
text-align: center;
color:#003300;
padding-top:50px;
margin-bottom: 50px;
}
h1{color:#003300; text-align:center;}
table{width:1000px;}
td{height:22px; line-height: 22px;}
tr td:nth-of-type(3) {
	text-align:left; width:300px;
}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div id="content_form">
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	int currentPage = Integer.parseInt(pageNum);
	final int PAGESIZE = 10, BLOCKSIZE=10;
	int startRow = (currentPage-1)*PAGESIZE + 1;
	int endRow = startRow + PAGESIZE -1;

	FileboardDao fDao = FileboardDao.getInstance();
	ArrayList<FileboardDto> boards = fDao.listFileboard(startRow, endRow);%>
	<table>
		<tr><td colspan="7"> 
<% 		if(session.getAttribute("customer")!=null){%>
			<a href="fboardWriteForm.jsp">글쓰기</a>
<%		} %> 		
		</td></tr>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>메일</th><th>IP</th><th>작성일</th><th>조회수</th></tr>
<% 	for(FileboardDto board : boards){%>	
		<tr><td><%=board.getFnum() %></td>
			<td><%=board.getCname() %></td>
			<td>
	 			<img src='../img/level.gif' width='<%=board.getFre_level()*15 %>' height='10'>
<%			if(board.getFre_step()>0){%>
	 			<img src="../img/re.gif" alt="핫게시물">
<%			} %>
<%			if(board.getFhit()>10){%>
	 			<img src="../img/hot.gif" alt="핫게시물">
<%			} %>
			<a href="fboardContent.jsp?fnum=<%=board.getFnum() %>&pageNum=<%=pageNum %>&hit=true" ><%=board.getFsubject() %></a>
<%			if(board.getFfilename()!=null){%>
	 			<img src="../img/fileup.jpg" alt="첨부파일">
<%			} %>
			</td>
			<td><%=board.getCemail()!=null?board.getCemail():"-" %></td>
			<td><%=board.getFip() %></td>
			<td><%=board.getFrdate() %></td>
			<td><%=board.getFhit() %></td>
		</tr>
<%	} %>
	</table>
	<div class='paging'>
<%	int fileboardTotCnt = fDao.getFileboardTotCnt();
	int pageCnt = (int)Math.ceil((double)fileboardTotCnt/PAGESIZE);
	int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
	int endPage = startPage + BLOCKSIZE -1;
	if(endPage>pageCnt) endPage = pageCnt;
	
	if(startPage>BLOCKSIZE){ %>
		[ <a href="fboardList.jsp?pageNum=<%=startPage-1%>"> 이전</a>]
<%	}%>
<% 	for (int i=startPage; i<=endPage ; i++){
		if(i==currentPage){
			out.print(" [ "+i+" ] ");	
		}else{
			out.print(" [ <a href='fboardList.jsp?pageNum="+i+"'>"+i+"</a> ]");
		}
	}
	if(endPage<pageCnt){%>
	 	[ <a href="fboardList.jsp?pageNum=<%=endPage+1%>"> 다음</a>]
<%	} %>	
	</div>	
	
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>