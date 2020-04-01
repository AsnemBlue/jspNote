<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<% 
String driver   = "oracle.jdbc.driver.OracleDriver";
String url	    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
String user 	= "scott";
String password = "tiger";
Connection conn	= null;
Statement  stmt = null;
ResultSet  rs	= null;
String job = request.getParameter("job");
// stmt객체를 사용할 경우 완벽한 spl문에 완성된 후 stmt객체 생성이 가능
String sql = "SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB='"+job+"'";
try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	out.print("<table><tr><th>사번</th><th>이름</th><th>직업</th><th>부서번호</th></tr>");
	if(rs.next()){
		do{
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			int deptno = rs.getInt("deptno");
			out.println("<tr><td>"+empno+"</td><td>"+ename+"</td><td>"+job+"</td><td>"+deptno+"</td></tr>");
		}while(rs.next());
	}else{
		out.print("<tr><td colspan='4'>해당직책 ("+job+")의 사원은 없습니다.");
	}
}catch(Exception e){
	System.out.print(e.getMessage());
}finally{
	if(rs  !=null) rs  .close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}

%>
</body>
</html>