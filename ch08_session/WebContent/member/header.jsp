<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	header{width:1000px; margin:0 auto;}
	header #nav ul{overflow: hidden;}
	header #nav ul li{list-style: none; float:right; padding:10px;}
	header #nav ul li a{text-decoration: none; color:black;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div id="nav">
			<%
				if(session.getAttribute("name")==null){%>
			<ul>
				<li><a href="join.jsp">회원가입</a>
				<li><a href="login.jsp">로그인</a>
				<li><a href="main.jsp">홈</a>
			</ul>
			<%	}else{%>
			<ul>
				<li><a href="logout.jsp">로그아웃</a>
				<li><a href="modify.jsp">정보수정</a>
				<li><a href="mypage.jsp"><%=session.getAttribute("name") %>님</a>
			</ul>
			<%	}
			%>
		</div>
	</header>
</body>
</html>