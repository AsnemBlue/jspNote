<%@page import="com.tj.dao.MemberDao"%>
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
<%	request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="com.tj.dto.MemberDto"/>
	<jsp:setProperty name="dto" property="*" />
<%
	MemberDao memberDao = MemberDao.getInstance();
	int result = memberDao.insertMember(dto);
	if(result>0){
		out.print("<h2>회원가입성공</h2>");
	}else{
		out.print("<h2>회원가입실패</h2>");
	}
%>
	<jsp:include page="memberList.jsp"/>
</body>
</html>