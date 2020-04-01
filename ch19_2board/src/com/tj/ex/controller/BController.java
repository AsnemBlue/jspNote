package com.tj.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.service.BContentService;
import com.tj.ex.service.BDeleteService;
import com.tj.ex.service.BListService;
import com.tj.ex.service.BModifyService;
import com.tj.ex.service.BModifyViewService;
import com.tj.ex.service.BReplyService;
import com.tj.ex.service.BReplyViewService;
import com.tj.ex.service.BWriteService;
import com.tj.ex.service.Service;
@WebServlet("*.do")
public class BController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		Service service = null;
		String viewPage = null;
		
		//글 목록 불러오기
		if(command.equals("/list.do")) { 
			service = new BListService();
			service.execute(request, response);
			viewPage="board/list.jsp";
		}
		
		//글 쓸 뷰 띄우기
		if(command.equals("/write_view.do")) {
			viewPage="board/write_view.jsp";
		}
		
		//글저장
		if(command.equals("/write.do")) {
			service = new BWriteService();
			service.execute(request, response);
			viewPage="list.do";
		}
		
		//상세보기
		if(command.equals("/content_view.do")) {
			service = new BContentService();
			service.execute(request, response);
			viewPage="board/content_view.jsp";
		}
		
		//수정뷰 띄우기
		if(command.equals("/modify_view.do"  )) {
			service = new BModifyViewService();
			service.execute(request, response);
			viewPage="board/modify_view.jsp";
		}
		
		//수정하기
		if(command.equals("/modify.do")) {
			service = new BModifyService();
			service.execute(request, response);
			viewPage="list.do";
		}
		
		//삭제하기
		if(command.equals("/delete.do")) {
			service = new BDeleteService();
			service.execute(request, response);
			viewPage="list.do";
		}
		
		//답변할 뷰 띄우기
		if(command.equals("/reply_view.do")) {
			service = new BReplyViewService();
			service.execute(request, response);
			viewPage="board/reply_view.jsp";
		}
		
		//답변하기
		if(command.equals("/reply.do")) {
			service = new BReplyService();
			service.execute(request, response);
			viewPage="list.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}//actionDo
}
