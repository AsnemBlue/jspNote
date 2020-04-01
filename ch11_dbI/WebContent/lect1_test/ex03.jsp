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
int deptno = Integer.parseInt(request.getParameter("deptno"));
String sql = "SELECT * FROM EMP WHERE DEPTNO="+deptno;
try{
	Class.forName(driver); //1단계
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();
	rs   = stmt.executeQuery(sql);
	out.println("<table>");
	out.println("<tr><th>사번</th><th>이릅</th><th>부서번호</th></tr>");
	if(rs.next()){
		do{
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			out.println("<tr><td>"+empno+"</td>");
			out.println("<td>"+ename+"</td>");
			out.println("<td>"+deptno+"</td></tr>");
		}while(rs.next());
	}else{
		out.print("<tr><td colspan='3'>해당 부서번호 사원은 없습니다</td></tr>");
	}
	out.print("</table>");
}catch(Exception e){
	System.out.print(e.getMessage());
}finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}

%>
</body>
</html>