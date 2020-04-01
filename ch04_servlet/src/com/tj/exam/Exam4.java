package com.tj.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Exam4")
public class Exam4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String[] strnum = request.getParameterValues("num");
		ArrayList<Integer> num = new ArrayList<Integer>();
//		int[] num = new int[strnum.length];
		out.println("<html>");
		out.println("<head><link href='css/exam4.css' rel='stylesheet'></head>");
		out.println("<body>");
		if(strnum!=null) {
			for(int i=0; i< strnum.length ;i++) {
				num.add(Integer.parseInt(strnum[i]));
			}
			out.print("<table>");
			out.print("<tr>");
			for(int i=0; i< num.size() ;i++) {
				out.print("<td>"+num.get(i)+"단</td>");
			}
			out.print("</tr>");
			for(int i=1; i<10 ; i++) {
				out.print("<tr>");
				for(int j=0; j<num.size(); j++) {
					out.print("<td>"+num.get(j)+" * "+i+" = "+i*num.get(j)+"</td>");
				}
				out.print("</tr>");
			}
		}else {
			out.print("<h2>선택한 숫자가 없습니다</h2>");			
		}
			
		
		out.println("</body>");
		out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
