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
	<form action="ex04_petResult.jsp">
		ID<input type="text" name="id"/><br>
		키우는 애완동물을 선택
		<input type="checkbox" name="pets" value="강아지">강아지
		<input type="checkbox" name="pets" value="고양이">고양이
		<input type="checkbox" name="pets" value="금붕어">금붕어
		<input type="checkbox" name="pets" value="앵무새">앵무새
		<input type="submit" value="확인">
	</form>
</body>
</html>