package com.tj.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public JoinOk() {}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String driver   = "oracle.jdbc.driver.OracleDriver";
		String url	    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user 	= "scott";
		String password = "tiger";
		Connection 		  conn	= null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?)"; //id name pw phone gender
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, pw);
			pstmt.setString(4, phone1);
			pstmt.setString(5, phone2);
			pstmt.setString(6, phone3);
			pstmt.setString(7, gender);
			int result = pstmt.executeUpdate();
			if(result>0){
				System.out.println("회원가입성공");
				HttpSession session = request.getSession();
				session.setAttribute("id", id); //로그인폼에 id표시
				response.sendRedirect("lect2_member/joinResult.jsp?result=sucess");
			}else{
				System.out.println("회원가입실패");
				response.sendRedirect("lect2_member/joinResult.jsp?result=fail");
			}
		}catch(Exception e){
			//회원가입실패
			System.out.println("회원가입실패 메세지 : "+e.getMessage());
			response.sendRedirect("lect2_member/joinResult.jsp?result=fail");
		}finally{
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn .close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
}
