package com.tj.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Exam0204")
public class Exam0204 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request,response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hidden = request.getParameter("hidden");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String[] hobbys= request.getParameterValues("hobby");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String[] mailSend= request.getParameterValues("mailSend");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link href='css/join.css' rel='stylesheet'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div id='joinForm_wrap'>");
		out.println("<div id='join_title'>회원가입정보</div>");
		out.println("<hr color=#D4A190 />");
		out.println("hiddenParam : "+hidden);
		out.println("<br>이름 : "+name);
		out.println("<br>아이디 : "+id);
		out.println("<br>비번 : ");
		for(int i=0; i<pw.length(); i++) {
			out.print('*');
		}
		out.println("<br>생년월일 : "+birth);
		out.println("<br>취미 : ");
		if(hobbys!=null) {
			for(int i=0;i<hobbys.length;i++) {
				if(i==0) {
					out.print(hobbys[i]);					
				}else {
					out.print(", "+hobbys[i]);
				}
			}
		}
		out.println("<br>성별 : "+gender);
		out.println("<br>이메일 : "+email);
		out.println("<br>메일수신동의 : ");
		if(mailSend!=null) {
			for(int i=0;i<mailSend.length;i++) {
				if(i==0) {
					out.print(mailSend[i]);					
				}else {
					out.print(", "+mailSend[i]);
				}
			}
		}
		out.println("</body>");
		out.println("</html>");
		
	}

}
