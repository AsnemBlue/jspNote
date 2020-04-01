<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginpro</title>
<link href="<%=conPath %>/css/login.css" rel="stylesheet">
<script>
</script>
</head>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String chkId = session.getAttribute("id").toString();
	String chkPw = session.getAttribute("pw").toString();
	
 	 if(id==null || pw==null){
		response.sendRedirect(conPath+"/member/login.jsp?chk=fail");
	}else if(!id.equals(chkId) || !pw.equals(chkPw) ){
		response.sendRedirect(conPath+"/member/login.jsp?chk=fail");
	}else if(id.equals(chkId) && pw.equals(chkPw) ){
		session.setAttribute("name", id  );
%>
<script>
	location.href="main.jsp?chk=true";
</script> 
<%} %>


<body>
</body>
</html>