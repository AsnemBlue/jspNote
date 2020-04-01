<%@page import="com.tj.model1ex.dao.FileboardDao"%>
<%@page import="com.tj.model1ex.dto.FileboardDto"%>
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
</style>
<body>
</body>
<jsp:include page="../main/header.jsp"/>
<div id="content_form">
<%		
	if(session.getAttribute("customer")==null){
		response.sendRedirect("fboardList.jsp");
	}
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	int	fnum = Integer.parseInt(request.getParameter("fnum"));
	FileboardDao fDao =FileboardDao.getInstance();
	FileboardDto fDto = new FileboardDto();
	fDto = fDao.getFileBoard(fnum);
	
%>
	<form action="fboardUpdatePro.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="<%=pageNum %>">
			<input type="hidden" name="dbfilename" value="<%=fDto.getFfilename() %>">
		<table>
			<caption>글수정</caption>
			<tr><th>글번호</th>
						<td><input type="text" name="fnum" value="<%=fnum %>" readonly="readonly"></td>
				</tr>
			<tr><th>제목</th>
				<td><input type="text" name="fsubject" maxlength="30" required="required" autofocus="autofocus"></td>
			</tr>
			<tr><th>첨부파일</th>
				<td><input type="file" name="ffilename"></td>
			</tr>
			<tr><th>본문</th>
				<td><textarea rows="10" cols="20" name="fcontent" class="text"></textarea></td>
			</tr>
			<tr><th>글비밀번호</th>
				<td><input type="text" name="fpw" maxlength="30" required="required"></td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="글등록" class="btn"></td></tr> 
		</table>
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</html>