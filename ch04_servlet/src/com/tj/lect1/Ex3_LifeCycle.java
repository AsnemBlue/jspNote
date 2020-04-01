package com.tj.lect1;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex3_LifeCycle
 */
@WebServlet("/Ex3_LifeCycle")
public class Ex3_LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@PostConstruct
	private void postConstruct() {
		System.out.println("Ex3_LifeCycle 객체 생성되자 마자 바로 실행");
	}
  
	public void init() throws ServletException {
		//객체가 만들어질때 최초에 한번 수행
		System.out.println("Ex3_LifeCycle 서블릿 객체가 생성될 때 수행");
	}
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//client의 요청이 들어올 때
//		response.getWriter().append("<h1>service() 수행</h1>");
//	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//client의 요청이 get방식으로 들어올 때 수행
		response.getWriter().append("<h1>doGet() 수행</h1>");
		System.out.println("doGet() 실행");
	}
	public void destroy() {
		//객체가 메모리에서 해제
		System.out.println("Ex3_LifeCycle 서블릿 종료");
	}
	@PreDestroy
	private void preDestroy() {
		System.out.println("Ex3_LifeCycle형 객체 소멸 직전");
	}
}
