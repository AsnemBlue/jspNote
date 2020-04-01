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
	<jsp:include page="header.jsp"/>
<%
	String name = null;
	String id 	= null;	//쿠키가 있을 경우 쿠키값 저장용
	Cookie[] cs = request.getCookies();
	if(cs!=null){
		for(int i=0; i<cs.length ; i++){
			if(cs[i].getName().equals("id")){
				id = cs[i].getValue();
			}else if(cs[i].getName().equals("name")){
				name = cs[i].getValue();
			}
		}
	}
	if(id==null){ //로그인 전 화면%>
		<h1>손님(guest)님 반갑습니다. 로그인하세요</h1>
		<p>
			<button onclick="location.href='login.jsp'">로그인</button>
			<button onclick="location.href='cookieslist.jsp'">쿠키들 확인</button>
		</p>		
<%	}else{//로그인 이후 화면%>
		<h1><%=name %>(<%=id %>)님 반갑습니다</h1>
		<p>
			<button onclick="location.href='logout.jsp'">로그아웃</button>
			<button onclick="location.href='cookieslist.jsp'">쿠키들 확인</button>
		</p>
<%	}%>
	
</body>
</html>