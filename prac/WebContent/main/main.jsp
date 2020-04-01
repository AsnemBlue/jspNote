<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
    $(document).ready(function(){
      $('.slider').bxSlider();
    });
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="slideWrap">
		<div class="slider">
			<div><img src="http://placehold.it/1000x500"></div>
			<div><img src="http://placehold.it/1000x500"></div>
		</div></div>
	<div id="content"></div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>