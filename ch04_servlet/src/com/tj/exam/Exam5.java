package com.tj.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Exam5")
public class Exam5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String[] color = {"red","orange","yellow","green","blue","navy","purple"};
		int num = Integer.parseInt(request.getParameter("getcolor"));
		
		out.println("<html>");
		out.println("<head><style>");
		out.println("body{background-color:"+color[num]+";}");
		if(num!=0) {
			out.println("h2{color: "+color[num-1]+";}");
		}else {
			out.println("h2{color: "+color[num+6]+";}");
		}
		out.println("</style></head>");
		out.println("<body>");
		out.println("<h2>배경색은"+color[num]+"입니다</h2>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String[] color = {"red","orange","yellow","green","blue","navy","purple"};
		int num = Integer.parseInt(request.getParameter("postcolor"));
		
		response.setContentType("text/html; charset=UTF-8");
		out.println("<html>");
		out.println("<head><style>");
		out.println("body{background-color:"+color[num]+";}");
		if(num!=0) {
			out.println("h2{color: "+color[num-1]+";}");
		}else {
			out.println("h2{color: "+color[num+6]+";}");
		}
		out.println("</style></head>");
		out.println("<body>");
		out.println("<h2>배경색은"+color[num]+"입니다</h2>");
		out.println("</body>");
		out.println("</html>");
	
	}

}
