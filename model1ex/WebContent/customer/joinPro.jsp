<%@page import="java.sql.Date"%>
<%@page import="com.tj.model1ex.dao.CustomerDao"%>
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
<jsp:useBean id="dto" class="com.tj.model1ex.dto.CustomerDto"/>
<jsp:setProperty name="dto" property="*"/>
<%
	String tempbirth = request.getParameter("tempbirth");
	dto.setCbirth(Date.valueOf(tempbirth));
	CustomerDao cDao = CustomerDao.getInstance();
	int result = cDao.confirmId(dto.getCid());
	if (result==CustomerDao.CUSTOMER_NONEXISTENT){
		result = cDao.insertCustomer(dto);
		if(result==CustomerDao.SUCCESS){
			session.setAttribute("cid", dto.getCid());%>
			<script>
				alert('회원가입 감사합니다. 로그인 이후에 서비스를 이용하세요');
				location.href='login.jsp';
			</script>
<%		} else {%>
			<script>
				alert('회원가입이 실패되었습니다.너무 긴 데이터는 가입 불가합니다. 다시 가입해 주세요');
				history.go(-1);
			</script>
<%		}
					
	}else{%>
		<script>
		alert('중복된 ID입니다.');
		history.go(-1);
	</script>
<%	}%>
</body>
</html>