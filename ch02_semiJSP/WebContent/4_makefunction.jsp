<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%-- 지시자 (<%@~%>:페이지의 속성--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%----스크립트릿: 자바코드-- --%>
	<% 
		long result = power(2,3);
	%>
	<p>2의 3승은<%=result  %><%--표현식 : 자바코드에서 실행한 결과를 포함한 식 --%></p>
	<p>9의 19승은<%=power(9,19) %><%--표현식 : 자바코드에서 실행한 결과를 포함한 식 --%></p>
	<%! private long power(int a, int b){//a의 b승
		long temp = 1;
		for(int i=1; i<=b;i++){
			temp*=a;
		}
		return temp;
	}
	
	%> <%-- 선언부 : 함수 및 변수를 선언 --%>
</body>
</html>