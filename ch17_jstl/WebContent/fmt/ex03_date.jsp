<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
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
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()) %>"/>
	<c:set var="nowTimes" value="<%=new Timestamp(System.currentTimeMillis()) %>"/>
	<c:set var="nowUtil" value="<%=new java.util.Date() %>"/>
	nowDate : ${nowDate }<br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="medium"/><br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="long"/><br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="full"/><br>
	
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="short"/><br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="medium"/><br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="long"/><br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="full"/><br>
	
	<fmt:formatDate value="${nowDate }" type="both" dateStyle="long" timeStyle="medium"/><br>
	<fmt:formatDate value="${nowDate }" pattern="yyyy/MM/dd(E요일	) hh:mm:ss:SS(a)"/>
	<fmt:formatDate value="${nowDate }" pattern="yy년MM월dd E요일 hh시mm분ss초SS"/>
</body>
</html>