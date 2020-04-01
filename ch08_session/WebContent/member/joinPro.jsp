<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<%=conPath %>/css/join.css' rel='stylesheet'>
</head>
<body>
<%@include file="header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String hidden = request.getParameter("hidden");
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String birth = request.getParameter("birth");
String[] hobbys= request.getParameterValues("hobby");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String[] mailSend= request.getParameterValues("mailSend");
session.setAttribute("id"  , id    );
session.setAttribute("pw"  , pw    );
%>
	<div id='joinForm_wrap'>
		<div id='join_title'>회원가입정보</div>
		<hr color=#D4A190 />
		hiddenParam : <%=hidden%>
		<br>이름 : <%=name%>
		<br>아이디 : <%=id%>
		<br>비번 : 
		<%
		for(int i=0; i<pw.length(); i++) {
			out.print('*');
		}
		%>
		<br>생년월일 : <%=birth%>
		<br>취미 : 
		<%
		if(hobbys!=null) {
			for(int i=0;i<hobbys.length;i++) {
				if(i==0) {
					out.print(hobbys[i]);					
				}else {
					out.print(", "+hobbys[i]);
				}
			}
		}
		%>
		<br>성별 : <%=gender%>
		<br>이메일 : <%=email%>
		<br>메일수신동의 : 
		<%
		if(mailSend!=null) {
			for(int i=0;i<mailSend.length;i++) {
				if(i==0) {
					out.print(mailSend[i]);					
				}else {
					out.print(", "+mailSend[i]);
				}
			}
		}
			
		
		%>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>
