<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/join.css" rel="stylesheet">
<style>
#joinForm_wrap{
	width:1000px;
	height:600px;
	line-height: 600px;
}

h1{
	color:#003300; text-align:center; 
}
</style>
<script>
	setTimeout(function(){
		<%session.invalidate(); %>
		location.href = '../main/main.jsp';
	},3000);
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="joinForm_wrap">
	<h1>로그아웃되었습니다. 잠시후 페이지 이동이 있겠습니다</h1>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>