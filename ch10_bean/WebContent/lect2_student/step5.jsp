<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="st" class="com.tj.student.Student" scope="request"/>
<jsp:setProperty name="st" property="studentNum" param="studentNum"/>
<jsp:setProperty name="st" property="name" param="name"/>
<jsp:setProperty name="st" property="grade" param="grade"/>
<jsp:setProperty name="st" property="className" param="className"/>
<jsp:setProperty name="st" property="score" param="score"/>
<jsp:forward page="stResult.jsp"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

</body>
</html>