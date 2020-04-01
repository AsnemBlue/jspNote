<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동전이 있는 곳을 맞춰봐</title>
<style>
*{text-align: center;}
#wrap{
margin:20px auto;
width:700px;
height:500px;
}
div>p:nth-child(1) {
	color:red;
}
div p{font-weight: bold;}
input[type="submit"]{
	height:100px; width:150px;
	background-color: #4287f5;
	color: white;
}
</style>
</head>
<body>
<%
String num = request.getParameter("num");
String answer = request.getParameter("answer");
if(num==null || answer==null || !num.equals(answer)){
	response.sendRedirect("08_yaba.jsp?rnum="+num+"&ranswer="+answer+"&chk=1");
}


%>
<div id="wrap">
	<p>정답입니다.</p>
	<p>동전이 있던 곳은 <%=answer %></p>
		<form action="08_yaba.jsp">
			<input type="submit" value="다시 도전">
		</form>
</div>
</body>
</html>