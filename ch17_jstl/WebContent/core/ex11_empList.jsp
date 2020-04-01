<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<table>
		<form action="/ch17_jstl/Ex11_empList" method="post">
		<p class="paging">이름<input type="text" name="ename" value="${param.ename }">
			직책<input type="text" name="job" value="${param.job }">
		<input type="submit" value="검색">
		</p>
		</form>
		<tr><th>사번</th><th>이름</th><th>직책</th><th>상사</th>
			<th>입사일</th><th>급여</th><th>상여</th><th>부서번호</th></tr>
		<c:if test="${emps.size() eq 0 }">
			<tr><td colspan="8">사원이 없습니다</td></tr>
		</c:if>
		<c:if test="${emps.size() != 0 }">
			<c:forEach var="emp" items="${emps }">
				<tr><td>${emp.empno 	}</td>
					<td>${emp.ename		}</td>
					<td>${emp.job		}</td>
					<td>${emp.mgr		}</td>
					<td>${emp.hiredate	}</td>
					<td>${emp.sal		}</td>
					<td>${emp.comm		}</td>
					<td>${emp.deptno	}</td>
			</c:forEach>
		</c:if>
	</table>
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/Ex11_empList?pageNum=${startPage-1 }"> 이전</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i eq currentPage}">
				[ ${i } ]
			</c:if>
			<c:if test="${i != currentPage}">
				[ <a href='${conPath }/Ex11_empList?pageNum=${i }'>${i }</a> ]
			</c:if>
			
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
			[ <a href="${conPath }/Ex11_empList?pageNum=${endPage+1 }"> 다음</a>]
		</c:if>
		</div>
</body>
</html>