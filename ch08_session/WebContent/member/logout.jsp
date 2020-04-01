<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mainForm_wrap{
		width:1000px; margin: 10px auto; height: 600px; 
		border: 1px solid #D4A190;
		line-height: 600px;
		text-align: center;
		font-size: 2em; color: #A47160;
	}
</style>
<script>
	setTimeout(function () { location.href="main.jsp"; }, 3000);
</script>
</head>
<body>
	<%session.removeAttribute("name");%>
	<%@include file="header.jsp" %>
	<div id="mainForm_wrap">
		logout되었습니다(3초뒤 main이동)
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>
