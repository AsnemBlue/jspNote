<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
<%String chk = request.getParameter("chk");%>
	<form action="loginCertification.jsp">
		<table>
			<tr><td>아이디</td>
				<td><input type="text" name="id"></td>
			<tr><td>패스워드</td>
				<td><input type="password" name="pw"></td>
			<tr><td colspan="2"><input type="submit" value="로그인"></td></tr>
			<tr><td colspan="2">
			<%
				if(chk!=null && chk.equals("1")){
			%>
				<script>alert("확인하세요");</script>		
			<%
					out.print("비밀번호와 아이디를 확인하세요");}			
			%>
			</td></tr>
		</table>
	</form>
</body>
</html>