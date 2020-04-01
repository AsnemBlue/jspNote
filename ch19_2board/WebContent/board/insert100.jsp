<%@page import="com.tj.ex.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
<% String bname=null, btitle=null, bcontent=null, bip=null;
	BoardDao bDao = new BoardDao();
	for(int i=0; i<100; i++){
		bname = "hong"+i;
		btitle = "hong"+i;
		bcontent = "hong"+i;
		bip = "hong"+i;
		bDao.write(bname,btitle,bcontent,bip);
	}
	response.sendRedirect("../list.do");
	for(int i=0;i<50;i++){
		bname = "hong"+i;
		btitle = "hong"+i;
		bcontent = "hong"+i;
		bip = "hong"+i;
		int bgroup=20;
		int bstep = i;
		int bindent = i;
		bDao.reply(bname, btitle, bcontent, bgroup, bstep, bindent, bip);
	}
	
	
%>
</body>
</html>