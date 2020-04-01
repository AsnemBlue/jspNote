package com.tj.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String driver   = "oracle.jdbc.driver.OracleDriver";
	private String url	    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String user 	= "scott";
	private String password = "tiger";
	private Connection 		  conn;
	private PreparedStatement pstmt;
	private ResultSet 		  rs;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String sql = "SELECT * FROM MEMBER WHERE ID =? AND PW=?";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String name   = rs.getString("name"  );
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				HttpSession session = request.getSession();
				session.setAttribute("id"	 , id	 );
				session.setAttribute("pw"	 , pw	 );
				session.setAttribute("name"	 , name	 );
				session.setAttribute("phone1", phone1);
				session.setAttribute("phone2", phone2);
				session.setAttribute("phone3", phone3);
				session.setAttribute("gender", gender);
				session.setAttribute("validMember", "ok");
				response.sendRedirect("lect2_member/loginResult.jsp");
			}else {
				response.sendRedirect("lect2_member/login.jsp??result=loginfail");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!=null) rs	 .close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn .close();
			} catch (Exception e2) {}
		}
	}

}
