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
<%
	int su = Integer.parseInt(request.getParameter("su"));
	int sum = 0;
	for(int i=1; i<=su; i++){
		sum += i;
	}
	request.setAttribute("sum", sum);
%>
	<jsp:forward page="ex03_suView.jsp"/>
</body>
</html>