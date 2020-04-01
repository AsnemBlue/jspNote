<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	console.log('예외타입 : ' + '<%=exception.getClass().getName()%>');
	console.log('예외메세지 : ' + '<%=exception.getMessage()%>');
</script>
</head>
<body>
	<h2>공사중입니다. 빠른시일내로 복구하겠습니다.</h2>
	(error500.jsp)
</body>
</html>