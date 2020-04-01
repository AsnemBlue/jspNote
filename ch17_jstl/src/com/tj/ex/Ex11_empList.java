package com.tj.ex;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex11_empList")
public class Ex11_empList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex11_empList() {}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		ename = ename!=null? ename.toUpperCase().trim():null;
		job = job!=null? job.toUpperCase().trim():null;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 3, BLOCKSIZE=3;
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE -1;
		EmpDao dao = new EmpDao();
		ArrayList<EmpDto> emps = dao.search(ename, job, startRow, endRow);
		
		int empTotCnt = dao.getEmpTotCnt();
		int pageCnt = (int)Math.ceil((double)empTotCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE -1;
		if(endPage>pageCnt) endPage = pageCnt;
		
		request.setAttribute("emps", emps);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("pageCnt", pageCnt);
		RequestDispatcher dispatcher 
		= request.getRequestDispatcher("core/ex11_empList.jsp?ename="+ename+"&job="+job);
		dispatcher.forward(request, response);
	}
}
