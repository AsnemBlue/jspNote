<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
<style type="text/css">
h2{color:red;}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id 	= request.getParameter("id"  );
	String pw 	= request.getParameter("pw"  );
	String name = request.getParameter("name");
	session.setAttribute("id"  , id  );
	session.setAttribute("pw"  , pw  );
	session.setAttribute("name", name);
%>
	<h2><%=name %>님 약관에 동의하십니까?</h2>
	<hr>
		<p>정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 </p>
		<p>수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 </p>
		<p>보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
	<hr>
	<fieldset>
		<legend>약관 동의</legend>
		<form action="joinOk.jsp">
			<input type="radio" name="agree" value="y">동의
			<input type="radio" name="agree" value="n" checked="checked">거부
			<input type="submit" value="확인">
		</form>
	</fieldset>
</body>
</html>