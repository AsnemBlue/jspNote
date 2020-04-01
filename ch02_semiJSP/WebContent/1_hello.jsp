<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {color:red;}
</style>
<script>
	window.onload = function(){alert('Hello world');};
</script>
</head>
<body>
	<h1>Hello, world</h1>
	<%
	int total = 0;
	for(int i=1; i<=100; i++){
		total+=i;
	}
	%>
	<h2>1부터 100까지 더한 값은 <%=total %>입니다.</h2>
</body>
</html>