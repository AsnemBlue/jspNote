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
	<form action="${conPath }/modify.do" method="post">
	<input type="hidden" name="bid" value="${param.bid }">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
		<table>
			<caption>글수정</caption>
			<tr>
				<th>작성자</th><th><input type="text" name="bname" value="${modify_view.bname }" required="required"></th>
			</tr>
			<tr>
				<th>제목</th><th><input type="text" name="btitle" value="${modify_view.btitle }" required="required"></th>
			</tr>
			<tr>
				<th>본문</th><th><textarea name="bcontent" rows="5" cols="20">${modify_view.bcontent}</textarea></th>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정완료" class="btn">
					<input type="reset" value="취소" class="btn">
					<input type="button" value="뒤로" class="btn" onclick="history.back()">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>