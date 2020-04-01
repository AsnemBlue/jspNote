<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="x.jsp">없는 파일 클릭 404에러</a>
	<% 
	//String nutt = request.getParameter("xx").toUpperCase(); //NullPointException
	//Integer.parseInt(request.getParameter("xx")); //NumberFormatException
	int[] arr = {10, 20, 30};
	for(int i=0; i<=arr.length ; i++){
		out.print(arr[i]);
	}
	%>
	
</body>
</html>