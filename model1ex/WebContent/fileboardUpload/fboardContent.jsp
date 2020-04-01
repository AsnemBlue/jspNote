<%@page import="com.tj.model1ex.dto.CustomerDto"%>
<%@page import="com.tj.model1ex.dto.FileboardDto"%>
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
</head>
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
</style>
<body>
</body>
<jsp:include page="../main/header.jsp"/>
<%
	int fnum = Integer.parseInt(request.getParameter("fnum"));
	String pageNum = request.getParameter("pageNum");
	FileboardDao fDao = FileboardDao.getInstance();
	if(request.getParameter("hit")!=null && request.getParameter("hit").equals("true")){
		fDao.hitUp(fnum);
	}
	FileboardDto fileboard = fDao.getFileBoard(fnum);
	CustomerDto customer =(CustomerDto)session.getAttribute("customer");
%>
<div id="content_form">
	<form><input type="hidden" value="ffilename"></form>
	<form><input type="hidden" value="ffilename"></form>
	<table>
		<tr><th>글번호</th><td><%=fileboard.getFnum() %></td></tr>
		<tr><th>제목</th><td><%=fileboard.getFsubject() %></td></tr>
		<tr><th>작성자</th><td><%=fileboard.getCname() %> (<%=fileboard.getCemail() %>)</td></tr>
		<tr><th>첨부파일</th><td>
<%		if(fileboard.getFfilename()!=null) {%>
		<a href="../fileboard/<%=fileboard.getFfilename()%>" target="_blank"><%=fileboard.getFfilename() %></a>
<%		} %>
		</td></tr>
		<tr><th>본문</th><td><%=fileboard.getFcontent() %></td></tr>
		<tr><th>작성일</th><td><%=fileboard.getFrdate() %></td></tr>
		<tr><th>조회수</th><td><%=fileboard.getFhit() %></td></tr>
		<tr><th>IP</th><td><%=fileboard.getFip() %></td></tr>
		<tr><td colspan="2">
			<button onclick="location='fboardList.jsp?pageNum=<%=pageNum%>'">목록</button>
<%		if(customer!=null && fileboard.getCid().equals(customer.getCid())) {%>
			<button onclick="location='fboardUpdateForm.jsp?fnum=<%=fnum%>&pageNum=<%=pageNum%>'">수정</button>
<%		} %>			
<%		if(customer!=null) {%>
			<button onclick="location='fboardWriteForm.jsp?fnum=<%=fnum%>&pageNum=<%=pageNum%>'">답변</button>
<%		} %>
			<button onclick="location='fboardDeleteForm.jsp?fnum=<%=fnum%>&pageNum=<%=pageNum%>'">글삭제</button>
		</td></tr>
	</table>
</div>
<jsp:include page="../main/footer.jsp"/>
</html>