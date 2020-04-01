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
@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String driver   = "oracle.jdbc.driver.OracleDriver";
	private String url	    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String user 	= "scott";
	private String password = "tiger";
	private Connection 		  conn;
	private PreparedStatement pstmt;
	
	private String dbPw, id, name, oldPw, newPw, phone1, phone2, phone3, gender;
	private HttpSession session;
	
    public ModifyOk() {}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session= request.getSession();
		dbPw   = (String)session.getAttribute("pw");
		id 	   = request.getParameter("id"    );
		name   = request.getParameter("name"  );
		oldPw  = request.getParameter("oldPw" );
		newPw  = request.getParameter("newPw" );
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		String sql = "UPDATE MEMBER SET NAME=?, PW=?, PHONE1=?, PHONE2=?, PHONE3=?, GENDER=? WHERE ID=?";
		if(dbPw.equals(oldPw)) {
			if(newPw.equals("")) {
				newPw = oldPw;
			}
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, newPw);
				pstmt.setString(3, phone1);
				pstmt.setString(4, phone2);
				pstmt.setString(5, phone3);
				pstmt.setString(6, gender);
				pstmt.setString(7, id);
				int result = pstmt.executeUpdate();
				if(result>0) {	//수정성공
					session = request.getSession();
					session.setAttribute("id"	 , id	 );
					session.setAttribute("pw"	 , newPw );
					session.setAttribute("name"	 , name	 );
					session.setAttribute("phone1", phone1);
					session.setAttribute("phone2", phone2);
					session.setAttribute("phone3", phone3);
					session.setAttribute("gender", gender);
					response.sendRedirect("lect2_member/modifyResult.jsp?result=success");
				}else {			//수정실패
					response.sendRedirect("lect2_member/modifyResult.jsp?result=fail");
				}
			} catch (Exception e) {//수정실패
				System.out.println(e.getMessage());
				response.sendRedirect("lect2_member/modifyResult.jsp?result=fail");
			} finally {
				
			}
			
		}else {
			response.sendRedirect("lect2_member/modify.jsp?result=fail");
		}
	}

}
