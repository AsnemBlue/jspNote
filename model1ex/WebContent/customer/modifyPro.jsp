<%@page import="com.tj.model1ex.dto.CustomerDto"%>
<%@page import="java.sql.Date"%>
<%@page import="com.tj.model1ex.dao.CustomerDao"%>
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
<%	request.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="dto" class="com.tj.model1ex.dto.CustomerDto"/>
	<jsp:setProperty name="dto" property="*"/>
<%
	String tempbirth = request.getParameter("tempbirth");
	dto.setCbirth(Date.valueOf(tempbirth));
	String oldPw = request.getParameter("oldPw");
	CustomerDto customer = (CustomerDto)session.getAttribute("customer");
	String sessionPw = null;
	if(customer!=null){
		sessionPw = customer.getCpw();
	}
	if(dto.getCpw()==null){
		dto.setCpw(sessionPw);
	}
	if(oldPw.equals(sessionPw)){
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.updateCustomer(dto);
		if(result != CustomerDao.SUCCESS){%>
			<script>
				alert('회원정보 수정 실패.');
				location.href = 'modify.jsp';
			</script>
<%		}
		if(result == CustomerDao.SUCCESS){
			session.setAttribute("customer", dto);
		%>

		<script>
			alert('회원정보 수정이 완료되었습니다.');
			location.href = '../main/main.jsp';
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