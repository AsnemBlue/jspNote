<%@page import="com.tj.dao.BoardDao"%>
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
<%request.setCharacterEncoding("utf-8");
String pageNum = request.getParameter("pageNum");%>
	<jsp:useBean id="dto" class="com.tj.dto.BoardDto"/>
	<jsp:setProperty  name="dto" property="*"/>
<%
	dto.setIp(request.getRemoteAddr());
	BoardDao bDao = BoardDao.getInstance();
	int result;
	if(dto.getNum()==0){
		result = bDao.insertBoard(dto);
	}else{
		result = bDao.reply(dto);
	}
	if(result == BoardDao.SUCCESS){%>
		<script>
			alert('글쓰기 완료');
			location.href='list.jsp?pageNum=<%=pageNum%>';
		</script>
<%	}else{%>
		<script>
			alert('글쓰기 실패');
			history.back();
		</script>
<%	}%>
</body>
</html>