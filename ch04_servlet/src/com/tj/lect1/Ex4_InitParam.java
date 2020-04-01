package com.tj.lect1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet(urlPatterns= {"/Ex4_InitParam"}, 
initParams= {@WebInitParam(name="id",value="root"), 
	@WebInitParam(name="pw",value="mysql"), 
	@WebInitParam(name="jdbcdriver", value="com.mysql.jdbc.Driver")})*/
public class Ex4_InitParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
					String id=getInitParameter("id");
					String pw = getInitParameter("pw");
					String jdbcdriver = getInitParameter("jdbcdriver");
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					response.getWriter().append(id);
					out.println("<h2>ID : "+id+"</h2>");
					out.println("<h2>PW : "+pw+"</h2>");
					out.println("<h2>jdbcdriver : "+jdbcdriver+"</h2>");
					out.close();
					System.out.println("id:"+id);
					System.out.println("pw:"+pw);
					System.out.println("jdbcdriver:"+jdbcdriver);
					
					String contextId = getServletContext().getInitParameter("contextId");
					String contextPw = getServletContext().getInitParameter("contextPw");
					System.out.println("contextId:"+contextId);
					System.out.println("contextPw:"+contextPw);
				}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
