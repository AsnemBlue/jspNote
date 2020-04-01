<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>표현식 태그 이용</h2>
	<p>산술 연산 : 10+1 = <%=10+1 %></p>
	<p>산술 연산 : 10/0.0 = <%=10/0.0 %></p>
	<p>관계 연산 : 1>2 = <%=1>2 %></p>
	<p>관계 연산 : 1==2 = <%=1==2 %></p>
	<p>관계 연산 : 1!=2 = <%=1!=2 %></p>
	<p>조건 연산 : <%=(1>2)?"1은 2보다 큼":"1<=2" %></p>
	<p>논리 연산 : (1>2)||(1&lt;2) = <%=(1>2)||(1<2) %></p>
	<p>로그인 여부 : <%=session.getAttribute("customer")==null?"logout":"login"%></p>
	<p>로그인 여부 : <%=session.getAttribute("customer")!=null?"login":"logout"%></p>
	<p>pageNum파라미터 여부 : <%=request.getParameter("pageNum")==null?"pageNum 안옴":"pageNum옴" %></p>
	<p>su파라미터 값 : <%=request.getParameter("su") %></p>
	
	<h2>EL 표기법 이용(표현식 안에 쓸 수 있는 연산자는 다 사용 가능)</h2>
	<p>산술 연산 : 10+1 = ${10+1} </p>
	<p>산술 연산 : 10/0.0 = ${10/0.0} </p>
	<p>관계 연산 : 1>2 = ${1>2 }</p>
	<p>관계 연산 : 1==2 = ${1 eq 2 } (상단 표현도 가능 하지만 이 형식을 더 많이 쓴다.)</p>
	<p>관계 연산 : 1!=2 = ${1 != 2 } (not eq는 안됨)</p>
	<p>조건 연산 : ${(1>2)?"1>2":"1<=2" } </p>
	<p>논리 연산 : (1>2)||(1&lt;2) = ${(1>2)||(1<2)} </p>
	<p>로그인 여부 : ${empty customer ? "logout":"login"}(session 생략 가능. header에서 많이 쓰임)</p>
	<p>로그인 여부 : ${not empty customer ? "login":"logout"}(session 생략 가능. header에서 많이 쓰임)</p>
	<p>pageNum파라미터 여부 : ${empty param.pageNum?"pageNum 안옴":"pageNum옴" }(param은 생략 불가능)</p>
	<p>su파라미터 값 : ${param.su.toUpperCase()}</p>
</body>
</html>