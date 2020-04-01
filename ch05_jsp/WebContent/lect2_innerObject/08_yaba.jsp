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

input[type="button"]{
	height:100px; width:150px;
	background-color: #4287f5;
	color: white;
}
#wrap>div{
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
<% 
int answer = (int) (Math.random() * 3) +1;
String chk = request.getParameter("chk");
String rnum = request.getParameter("rnum");
String ranswer = request.getParameter("ranswer");
%>
<div id="wrap">
	<form>
		<input type="button" name="num" value="1번" onclick="location.href='08_yabaCertification.jsp?num=1&answer=<%=answer%>'">
		<input type="button" name="num" value="2번" onclick="location.href='08_yabaCertification.jsp?num=2&answer=<%=answer%>'">
		<input type="button" name="num" value="3번" onclick="location.href='08_yabaCertification.jsp?num=3&answer=<%=answer%>'">
	</form>
	<div id="alert">
	<%if(chk!=null && chk.equals("1")){
		out.print("<br><br>Wrong! Try Again!<br>");
		out.print(rnum+"은(는) 아니고 정답은 "+ranswer);
	}%>
	</div>
</div>
</body>
</html>