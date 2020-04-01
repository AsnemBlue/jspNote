<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/write.do" method="post">
		<table>
			<caption>원글 쓰기</caption>
			<tr>
				<th>작성자</th><th><input type="text" name="bname" required="required"></th>
			</tr>
			<tr>
				<th>제목</th><th><input type="text" name="btitle" required="required"></th>
			</tr>
			<tr>
				<th>본문</th><th><textarea name="bcontent" rows="5" cols="20"></textarea></th>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="취소" class="btn">
					<input type="button" value="뒤로" class="btn" onclick="history.back()">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>