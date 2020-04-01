<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.dao.BoardDao"%>
<%@page import="com.tj.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<table>
		<caption>게시판</caption>
		<tr><td><a href="writeForm.jsp">글쓰기</a></td></tr>
	</table>
	<table>
		<tr><th>글번호</th><th>작성자</th><th>제목</th><th>메일</th><th>ip</th><th>작성일</th><th>조회수</th></tr>
<%	/*paging 처리를 위한 startRow, endRow계산 list.jsp->list.jsp?pageNum=1*/
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) pageNum = "1";
	int currentPage = Integer.parseInt(pageNum);	//현재 페이지 수
	final int PAGESIZE=10, BLOCKSIZE=10;
	//startRow = (페이지번호 - 1) * 페이지당 갯수+ 1
	int startRow = (currentPage-1) * PAGESIZE + 1;
	//endROw = 시작번호 + 페이지당갯수 - 1
	int endRow = startRow + PAGESIZE - 1;

	BoardDao bDao = BoardDao.getInstance();
	int totCnt = bDao.getBoardTotalCnt(); //전체글갯수
	if(totCnt==0){
		out.print("<tr><td colspan='7'>등록된 글이 없습니다</td></tr>");
	}else{
		ArrayList<BoardDto> dtos = bDao.listBoard(startRow, endRow);
		for(BoardDto dto : dtos){
			//글번호, 작성자
			out.println("<tr><td>"+dto.getNum()+"</td><td>"+dto.getWriter()+"</td>");
			//제목
			out.println("<td class='left'>");
			//답변글일경우=들여쓰기+re.gif출력
			if(dto.getRe_level()>0){
				int width = dto.getRe_level()*15;
				out.print("<img src='../img/level.gif' width='"+width+"' height='10'>");
				out.print("<img src='../img/re.gif'>");	
			}
			if(dto.getHit()>10){
				out.println("<img src='../img/hot.gif'>");
			}
			out.println("<a href='content.jsp?num="+dto.getNum()+"&pageNum="+pageNum+"'>"+dto.getSubject()+"</a></td>");
			//메일
			out.println("<td>"+(dto.getEmail()!=null?dto.getEmail():"-")+"</td>");
			//ip,작성일, 조회수
			out.println("<td>"+dto.getIp()+"</td><td>"+dto.getrDate()+"</td><td>"+dto.getHit()+"</td></tr>");
			
		}
	}
%>
	</table>
	<div class="paging">
<%
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		//startPage = ((현재페이지 -1)/블록당페이지수)*블록당페이지수 +1
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE + 1;
		//endPage = 시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + BLOCKSIZE -1 ;
		if(endPage>pageCnt){
			endPage = pageCnt;
		}
		if(startPage>BLOCKSIZE){
			out.print("[<a href='list.jsp?pageNum="+(startPage-1)+"'>이전</a>]");
			
		}
		for(int i = startPage ; i<=endPage ; i++){
			if(i==currentPage){
				out.print(" [<b>"+i+"</b>] ");
			}else{
				out.print(" [<a href='list.jsp?pageNum="+i+"'>"+i+"</a>] ");
				
			}
		}
		if(endPage<pageCnt){
			out.print(" [<a href='list.jsp?pageNum="+(endPage+1)+"'>다음</a>] ");
		}
%>
	</div>
</body>
</html>