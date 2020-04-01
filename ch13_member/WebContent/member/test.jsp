<%@page import="com.tj.member.MemberDto"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.tj.member.MemberDao"%>
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
	<h1>테스트 페이지</h1>
	<%
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.confirmId("aaa");
		if(result == MemberDao.MEMBER_EXISTENT){
			out.print("<h3>중복</h3>");
		}else{
			out.print("<h3>중복아님</h3>");
		}
		out.print("<hr><h2>2.insertMember</h2>");
		MemberDto dto = new MemberDto("bbb","111","park",null,Timestamp.valueOf("2020-02-13 12:21:00"),null ,"서울" );
		/* result = mDao.insertMember(dto);
		if(result==MemberDao.SUCCESS){
			out.print("가입 : "+dto.toString());
		}else{
			out.print("가입 실패!");
		} */
		
		out.print("<hr><h2>3.loginChk</h2>");
		result = mDao.loginCheck("bbb", "111");
		if(result==MemberDao.LOGIN_SUCCESS){
			out.print("<h3>success</h3>");
		}else if(result == MemberDao.LOGIN_FAIL_ID){
			out.print("<h3>fail id</h3>");
		}else if(result == MemberDao.LOGIN_FAIL_PW){
			out.print("<h3>fail pw</h3>");
		}
		
		out.print("<hr><h2>4.get dto</h2>");
		dto = mDao.getMember("bbb");
			out.print("<h3>"+dto+"</h3>");
		
		out.print("<hr><h2>5.modify</h2>");
		dto = new MemberDto("bbb","111","kim",null,Timestamp.valueOf("1920-02-13 12:21:00"),null ,"대구" );
		result = mDao.updateMember(dto);
		if(result==MemberDao.SUCCESS){
			out.print("수정 : "+dto.toString());
		}else{
			out.print("수정 실패!");
		}
	%>
</body>
</html>