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
	<h2>예외처리</h2>
	<c:catch var="error"> <!-- catch절에서 예외발생시 예외타입과 예외메세지 error에 저장 -->
		<h2>테스트</h2>
		<%=8/0 %>
		<p>예외 발생되면 즉시 catch절 탈출.</p>
	</c:catch>
	예외타입과 메세지 : <c:out value="${error }" default="예외 발생 안 됨"/>
</body>
</html>