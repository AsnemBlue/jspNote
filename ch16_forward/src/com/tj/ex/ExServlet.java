package com.tj.ex;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ExServlet")
public class ExServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ExServlet() {}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//메소드 호출
		Member member = new Member(id, pw, "홍길동");
		/*
		 * request.setAttribute("member", member); //sendre 해서 객체 보내기가 불가능 하므로 request를
		 * 이용해서 객체전송 해야 함 //go View RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("1_dispatcher/ex02View.jsp");
		 * dispatcher.forward(request, response);
		 */
		response.sendRedirect("2_redirect/ex02View.jsp?id="+id+"&pw="+pw+"&name="+URLEncoder.encode("hong", "utf-8") );
	}
}
