<%@page import="com.tj.member.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");
String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="com.tj.member.MemberDto"/>
<jsp:setProperty name="dto" property="*"/>
<%
	String tempbirth = request.getParameter("tempbirth");
	dto.setBirth(Timestamp.valueOf(tempbirth+" 00:00:00"));
	/* dto.setRdate(new Date(System.currentTimeMillis()); */
	MemberDao mDao = MemberDao.getInstance();
	int result = mDao.confirmId(dto.getId());
	if(result == MemberDao.MEMBER_NONEXISTENT){
		result = mDao.insertMember(dto);
		if(result == MemberDao.SUCCESS){
			session.setAttribute("id", dto.getId());%>
			<script>
				alert('회원가입 감사합니다. 로그인 화면으로 이동');
				location.href='login.jsp';
			</script>
<%		} else {%>
			<script>
				alert('회원가입이 실패되었습니다.');
				history.href='join.jsp';
			</script>
<%		}
	}else{%>
		<script>
			alert('중복된 ID입니다.');
			history.go(-1);
		</script>
<%	}
%>
</body>
</html>