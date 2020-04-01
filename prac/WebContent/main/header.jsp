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
	int num=-1;
	if(request.getParameter("num")!=null && request.getParameter("num").equals("1")){
		num=1;
	}	
%>
	<header>
		<div id="searchlogin">
			<div id="searchWrap">
				<div id="search">
					<form><input type="text" placeholder="음식명 또는 재료명 ">
					<input type="submit" value=""></form>
				</div>
				<button type="button" onclick="location.href='<%=conPath %>/main/main.jsp?num=<%=num==-1?1:-1 %>'">
					<img src="<%=conPath %>/img/chef2.png" alt="로그인 버튼" >
				</button>
			</div>
		</div>
		<nav>
			<ul id="lineMenu">
				<li>Home</li>
				<li>홀로쿡</li>
				<li>쉐프랭킹</li>
				<li>고객센터</li>
			</ul>
		</nav>
<% 		if( num==1){%>
		<div id="floatmenuWrap" >
			<div id="floatmenu" >
				<ul>
					<li>내정보</li>
					<li>내 게시글</li>
					<li>로그아웃</li>
				</ul>
			</div>
		</div>

<% 		}%>
		<hr/>
	</header>
	<div id="iconnav"></div>
</body>
</html>