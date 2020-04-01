<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String conPath = request.getContextPath();
	String appPath = application.getContextPath();
	String absolutePath = application.getRealPath(".");
%>
	<h2>conPath : <%=conPath %></h2>
	<h2>appPath : <%=appPath %></h2>
	<h2>absolutePath : <%=absolutePath %></h2>
<%
	String filePath = application.getRealPath("WEB-INF/input.txt");
	BufferedReader reader= null;
	try{
		reader = new BufferedReader(new FileReader(filePath));
		while(true){
			String str = reader.readLine();
			if(str==null)break;
			out.println(str+"<br>");
		}
	}catch(Exception e){
		out.println(e.getMessage());
	}finally{
		if(reader!=null) reader.close();
	}
%>
	<h2>접근할 text 파일 경로 : <%=filePath %></h2>
</body>
</html>