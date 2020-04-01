<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.tj.model1ex.dao.FileboardDao"%>
<%@page import="com.tj.model1ex.dto.CustomerDto"%>
<%@page import="com.tj.model1ex.dto.FileboardDto"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%
	String path = request.getRealPath("fileboard");
	int maxSize = 1024*1024*5;
	String ffilename = "";
	MultipartRequest mRequest = null;
	try{
		//파일서버에 올리고 파일이름 받기
		mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy() );
		Enumeration<String> paramNames = mRequest.getFileNames();	//파라미터 이름들
		String param = paramNames.nextElement();
		ffilename = mRequest.getFilesystemName(param);
	}catch(IOException e){
		System.out.print(e.getMessage());
	}
	InputStream is = null;
	OutputStream os = null;
	try{
		File serverFile = new File(path+"/"+ffilename);
		if(serverFile.exists()){
			is = new FileInputStream(serverFile);
			os = new FileOutputStream("D:/mega_IT/source/6_jsp/model1ex/WebContent/fileboard/"+ffilename);
			byte[] bs = new byte[(int)serverFile.length()];
			int readByteCnt;
			while((readByteCnt=is.read(bs))!=-1){
				os.write(bs, 0, readByteCnt);
			}
		}
	}catch(IOException e){
		System.out.println(e.getMessage());
	}finally{
		if(is!=null) is.close();
		if(os!=null) os.close();
	}
	//파라미터를 dto로
	String pageNum = mRequest.getParameter("pageNum");
	int fnum = Integer.parseInt(mRequest.getParameter("fnum"));
	CustomerDto customer =(CustomerDto)session.getAttribute("customer");
	String fsubject = mRequest.getParameter("fsubject");
	String fcontent = mRequest.getParameter("fcontent");
	String fpw = mRequest.getParameter("fpw");
	String dbfilename = mRequest.getParameter("dbfilename");
	if(ffilename==null) ffilename = dbfilename;
	String fip = request.getRemoteAddr();
	FileboardDto dto = new FileboardDto(fnum, null, fsubject, fcontent, ffilename, fpw, 
			0, 0, 0, 0, fip, null, null, null);
	
	FileboardDao fDao = FileboardDao.getInstance();
	int result = fDao.updateFileBoard(dto);
	if(result==FileboardDao.SUCCESS){
		out.print("<h2>수정성공</h2>");
	}else{
		out.print(dto.toString());
	}
%>
<script>
	setTimeout(function(){
		location.href = 'fboardList.jsp?pageNum=<%=pageNum%>';
	},2000);
</script> 
</body>
</html>