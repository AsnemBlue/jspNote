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
	<c:set var="vn" value="${param.visitNum }"/>
	<c:if test="${vn==0 }">
		<h2>첫방문 감사</h2>
	</c:if>
	<c:if test="${vn==1 }">
		<h2>두번째방문 감사</h2>
	</c:if>
	<c:if test="${vn<=5 && vn>=0 }">
		<h2>몇번왔네 감사</h2>
	</c:if>
	<c:if test="${vn>5 }">
		<h2>많이 왔네 감사</h2>
	</c:if>
	<c:if test="${vn<0 }">
		<h2>예외</h2>
	</c:if>
</body>
</html>