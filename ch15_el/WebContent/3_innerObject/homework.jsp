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
	<form action="">
	<table>
		<tr><td>
		<input type="number" name="n1" value="<%=(int)(Math.random()*9)+1 %>" readonly="readonly">
		 * 
		<input type="number" name="n2" value="<%=(int)(Math.random()*9)+1 %>" readonly="readonly">
		 = 
		<input type="number" name="ans">
		</td></tr>
		<tr><td>
		<input type="submit" value="확인">
		</td></tr>
		<tr><td>
		<h2><b>${param.n1 } * ${param.n2 } = ${param.ans } 는 
		${param.n1*param.n2 eq param.ans }
		${not empty param.ans ? (param.n1*param.n2 eq param.ans?"정답":"오답" ):""}  </b></h2>
		</td></tr>
	</table>
		
	</form>
</body>
</html>