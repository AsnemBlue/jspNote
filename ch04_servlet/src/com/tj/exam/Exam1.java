package com.tj.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Exam1")
public class Exam1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); //브라우저 출력이 한글
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 hh시 mm분");
		String datestr = sdf.format(date);
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link href=\'css/exam1.css\' rel=\'stylesheet\'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>현재는 "+datestr+"입니다</h2>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //파라미터값이 한글
		doGet(request, response);
	}

}
