<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{margin:0 auto;}
	p{text-align:center;}
</style>

</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	<table>
		<tr>
			<%for(int i=num;i<=num2;i++){%>
				<td><%=i %> 단</td>
			<%} %>
		</tr>
		<%for(int j=1;j<10;j++){%>
			<tr>
				<%for(int i=num;i<=num2;i++){%>
					<td><%=i %> * <%=j %> = <%=i*j %></td>
				<%} %>
			</tr>
		<%} %>
	</table>
	<p><button onclick="history.go(-1)">뒤로가기</button></p>
	
</body>
</html>