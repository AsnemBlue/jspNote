package com.tj.ex;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// http://localhost:8181/ch03_semiServlet/Ex0
@WebServlet("/Ex0")
public class Ex0 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("doget호출.");
		response.getWriter().append("Gello");
	}
}
