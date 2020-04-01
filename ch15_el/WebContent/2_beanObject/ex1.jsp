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
	<jsp:useBean id="member" class="com.tj.ex.MemberInfo" scope="page"/>
	<jsp:setProperty  name="member" property="*"/>
	<h2>bean태크 이용</h2>
	<h3>이름 <jsp:getProperty name="member" property="name" /> </h3>
	<h3>id <jsp:getProperty name="member" property="id" /> </h3>
	<h3>pw <jsp:getProperty name="member" property="pw" /> </h3>
	<h2>getter</h2>
	<h2>이름 : <%=member.getName() %></h2>
	<h2>id : <%=member.getId() %></h2>
	<h2>pw : <%=member.getName() %></h2>
	<h2>el</h2>
	<h2>name : ${member.name }</h2>
	<h2>id : ${member.id }</h2>
	<h2>pw : ${member.pw }</h2>
</body>
</html>