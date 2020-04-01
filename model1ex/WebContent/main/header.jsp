<%@page import="com.tj.model1ex.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{padding:0; margin: 0;}
header { 
	background-color: #ffffaa; font-size: 9pt;
}
header a {text-decoration: none; font-weight: bold;}
header li { list-style: none;}
header .gnb{width: 100%;	background-color: #003300;}
header .gnb ul {
	overflow: hidden;
	width:700px;
	height: 30px;
	line-height: 30px;
	margin: 0 auto;
}
header .gnb ul li {	float: right;	margin-right: 30px;}
header .gnb a { 
	color : #FFF0B5;
	font-size: 0.9em;
	display: block;
	padding-left:15px;
	padding-right:15px;
}
header .logo{
	width:120px; text-align:center;
	margin: 20px auto;
	cursor: pointer;
}
header .logo img{width:100%;}
header .lnb {
  width: 100%;
  border-top: 1px dashed #003300;
	border-bottom: 1px dashed #003300;
}
header .lnb ul{
	overflow: hidden;
	width:300px;
	margin: 0 auto;
}
header .lnb ul li {
	margin: 5px;
	float:right;
	padding:5px 40px;
	line-height: 25px;
}
header .lnb a {
	height:1.1em;
	color: #003300;
	font-size:1.1em;
	margin-bottom: 20px;
}

</style>
</head>
<body>
<%
	CustomerDto customer =(CustomerDto)session.getAttribute("customer");
%>
	<header>
		<div class="gnb">
			<%if(customer==null){ %>
				<ul>
					<li><a href="<%=conPath %>/fileboardUpload/fboardList.jsp">고객센터</a></li>
					<li><a href="<%=conPath %>/customer/join.jsp">회원가입</a></li>
					<li><a href="<%=conPath %>/customer/login.jsp">로그인</a></li>
				</ul>
			<%} 
			if(customer!=null){ %>
				<ul>
					<li><a href="<%=conPath %>/fileboardUpload/fboardList.jsp">고객센터</a></li>
					<li><a href="<%=conPath %>/customer/logout.jsp">로그아웃</a></li>
					<li><a href="<%=conPath %>/customer/modify.jsp">정보수정</a></li>
					<li><a><%=customer!=null?customer.getCname():"" %>님 ▶</a></li>			
				</ul>
			<%} %>
		</div>
		<div class="logo" onclick="location.href='../main/main.jsp'">
			<img src="<%=conPath %>/img/logo.png" alt="로고">
		</div>
		<div class="lnb">
		<ul>
			<li><a href="<%=conPath %>/book/listP.jsp">도서보기</a></li>
			<%	if(customer!=null){%>
			<li><a href="<%=conPath %>/book/bookRegister.jsp">도서등록</a></li>
			<%	} %>
		</ul>
	</div>

	</header>
</body>
</html>
