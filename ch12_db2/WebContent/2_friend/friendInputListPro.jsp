<%@page import="com.tj.dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="com.tj.dto.FriendDto"/>
	<jsp:setProperty name="dto" property="*" />
<%
	FriendDao friendDao = FriendDao.getInstance();
	int result = friendDao.addFriend(dto);
	if(result>0){%>
		<script>alert("친구추가 성공");</script>
	<%}else{%>
		<script>alert("친구추가 실패");</script>
	<%}
%>
	<jsp:include page="friendInputList.jsp"/>
</body>
</html>