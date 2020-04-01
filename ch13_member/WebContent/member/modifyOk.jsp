<%@page import="com.tj.member.MemberDao"%>
<%@page import="com.tj.member.MemberDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	request.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="dto" class="com.tj.member.MemberDto"/>
	<jsp:setProperty name="dto" property="*"/>
<%
	String tempbirth = request.getParameter("tempbirth");
	dto.setBirth(Timestamp.valueOf(tempbirth+" 00:00:00"));
	String oldPw = request.getParameter("oldPw");
	MemberDto member = (MemberDto)session.getAttribute("member");
	String sessionPw = null;
	if(member!=null){
		sessionPw = member.getPw();
	}
	if(dto.getPw()==null){
		dto.setPw(sessionPw);
	}
	if(oldPw.equals(sessionPw)){
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.updateMember(dto);
		if(result != MemberDao.SUCCESS){%>
			<script>
				alert('회원정보 수정 실패.');
				location.href = 'modify.jsp';
			</script>
<%		}
		if(result == MemberDao.SUCCESS){
			session.setAttribute("member", dto);
		%>

		<script>
			alert('회원정보 수정이 완료되었습니다.');
			location.href = 'main.jsp';
		</script>
<%		} 	
	} else {%>
		<script>
			alert('현비밀번호가 바르지 않습니다. 확인하세요');
			history.go(-1);
		</script>
<%	}
%>
</body>
</html>