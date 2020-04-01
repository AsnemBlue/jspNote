<%@page import="com.tj.book.BookDao"%>
<%@page import="com.tj.book.BookDto"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
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
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("bookimg");
	int maxSize = 1024*1024*5; //5mb
	String[] image = {"",""};
	MultipartRequest mRequest = null;
	try{
		//파일서버에 올리고 파일이름 받기
		mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy() );
		Enumeration<String> paramNames = mRequest.getFileNames();	//파라미터 이름들
		int idx = 0;
		while(paramNames.hasMoreElements()){
			String param = paramNames.nextElement();
			image[idx] = mRequest.getFilesystemName(param);
			out.println(idx+"번째 처리한 파라미터 이름 : "+param+"/파일이름:"+image[idx]+"<br>");
			idx++;
		}
	}catch(IOException e){
		System.out.print(e.getMessage());
	}
	//서버에 올려진 파일을 소스폴더에 복사
	for(String imgfile : image){
		if(imgfile!=null){
			InputStream is = null;
			OutputStream os = null;
			File serverFile = new File(path+"/"+imgfile);
			if(serverFile.exists()){
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/mega_IT/source/6_jsp/ch14_fileUp/WebContent/bookimg/"+imgfile);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true){
					int readbyteCnt = is.read(bs);
					if(readbyteCnt==-1) break;
					os.write(bs,0,readbyteCnt);
				}
			}
		}
	}
	//제목, 절멸,가격 할인율 등의 파라미터 값 받아 bootdto
	String btitle = mRequest.getParameter("btitle");
	int bprice = Integer.parseInt(mRequest.getParameter("bprice"));
	String bimage1 = image[1]!=null? image[1]: "NOTHING.JPG";
	String bimage2 = image[0]!=null? image[0]: "noImg.png";
	String bcontent = mRequest.getParameter("bcomtent");
	int bdiscount = Integer.parseInt(mRequest.getParameter("bdiscount"));
	String ip = request.getRemoteAddr();	//IP가져오기.멀티 필요없음
	BookDto book = new BookDto(0, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, null);
	
	//db에 insertbluadf
	BookDao bDao = BookDao.getInstance();
	int result = bDao.insertBook(book);
	if(result==BookDao.SUCCESS){
		out.print("<h2>책 등록 성공</h2>");
	}%>
	<h3>책이름 : <%=btitle %> </h3>
	<h3>책이미지1 : <%=path+"/"+bimage1 %></h3>
	<img src="../bookimg/<%=bimage1 %>">	
	<h3>책이미지2 : <%=path+"/"+bimage2 %></h3>
	<img src="../bookimg/<%=bimage2 %>">	
	<h3>책 설명</h3>
	<pre><%=bcontent %></pre>
	<h3>책가격 : <del><%=bprice %></del> <%=bprice*(100-bdiscount)/100 %></h3>
	<h3>할인율 : <%=bdiscount %></h3>
	
	<a href="list.jsp">책 전체 리스트</a><br>
	<a href="listP.jsp">책 리스트(1page)</a>
	

</body>
</html>