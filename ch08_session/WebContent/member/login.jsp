<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="<%=conPath %>/css/login.css" rel="stylesheet">
</head>
<%
	String chk = request.getParameter("chk");
%>
<body>
<%@include file="header.jsp" %>
<form action="<%=conPath %>/member/loginpro.jsp">
	<div id="loginForm_wrap">
		<div id="login_title">로그인</div>
		<%=session.getAttribute("cid") %>
			<table>
				<tr><th>아이디</th>
					<td><input type="text" name="id" value="<%
							String sessionId = (String)session.getAttribute("id");
					if(sessionId!=null){
						out.println(sessionId);
					}
					%>"></td></tr>
				<tr><th>비밀번호</th>
					<td><input type="text" name="pw"></td></tr>
				<tr><td colspan="2"> </td></tr>
				<tr><td colspan="2"> 
					<input type="submit" class="loginBtn_style" value="로그인">
				</td></tr>
				<tr><td colspan="2" >
				<% 
					if(chk!=null && chk.equals("fail")){%>
						<p id="login_findIdPw" onclick="alert('id=aaa/pw=111')">아이디/비밀번호를 잊으셨나요?</p>
					
				<%}%>
				</td> </tr>				
			</table>
		<div id="login_join">
			아직 회원이 아니신가요? 
			<a href="<%=conPath %>/member/join.jsp">>회원가입</a>
		</div>	
	</div>
	<%@include file="footer.jsp" %>
</form>
</body>
</html>