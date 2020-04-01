<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] names = {"hong", "kim", "sin"};
		for(String name : names){
			out.print("<p>"+name+"</p>");
		}
		for(int i=0;i<names.length;i++){
			out.print("<p style='color:blue;'>"+i+names[i]+"</p>");
		}
	%>
	<hr>
	<c:set var="names" value="<%=names %>"/><!-- 원래 서블릿에서 담아서 오기땜에 스트립이 필요 없음 -->
	<c:forEach var="name" items="${names }">
		<p>${name }</p>
	</c:forEach>
	<hr>
	<c:set var="idx" value="0"/>	<!-- scope="page"가 기본 -->
	<c:forEach var="name" items="${names }">
		<p>${idx }번째 : ${name }</p>
		<c:set var="idx" value="${idx+1 }"/>
	</c:forEach>
	<p>최종 idx값은 ${idx }</p>
</body>
</html>