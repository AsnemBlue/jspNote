<%@page import="java.sql.Date"%>
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
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url	  = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid 	  = "scott";
	String upw	  = "tiger";
	String driverMysql = "com.mysql.jdbc.Driver";
	String urlMysql = "com.mysql://127.0.0.1:3306/kimdb";
	String uidMysql = "root";
	String upwMysql = "mysql";
%>
<%	//1단계: 드라이버 로드
	Connection conn = null;
	Statement  stmt = null;
	ResultSet  rs	= null;
	String sql = "SELECT * FROM EMP";
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);	//2단걔 : DB연결 객체
		stmt = conn.createStatement();	//3단계 :SQL전송 객체
		rs	 = stmt.executeQuery(sql); 	//4(SQL전송)+5단계(SQL전송결과 받기)
		while(rs.next()){
			int empno = rs.getInt(1); //1번째 필드
			String ename = rs.getString("ename"); //ename 필드
			String  job	= rs.getString("job");
			int 	mgr	= rs.getInt("mgr");
			Date hiredate = rs.getDate("hiredate");
			//Timestamp hire = rs.getDate("hiredate");
			int sal = rs.getInt("sal");
			int comm = rs.getInt("comm");
			int deptno = rs.getInt("deptno");
			out.print("<p>"+empno+"(사번) "+ename+"(이름) "+job+"(직책) "+mgr+"(상사사번) "+hiredate+"(입사일) "
						+sal+"(급여) "+comm+"(상여) "+deptno+"(부서번호)</p>");
			
		}
	}catch(Exception e){
		System.out.print("에러메세지 : "+e.getMessage());
	}finally{	//7단계 : 연결 해제
		try{
			if(rs!=null)	rs.close();
			if(stmt!=null)	stmt.close();
			if(conn!=null) 	conn.close();
		}catch(Exception e){
			System.out.print("에러메세지: "+e.getMessage());
		}
	}

%>
</body>
</html>