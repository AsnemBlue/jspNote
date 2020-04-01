<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{text-align: center;}
</style>
<script>
	function chk() {
		var patternNum = /[0-9]/;
		if(!patternNum.test(frm.num.value) || !patternNum.test(frm.num2.value)){
			alert("숫자를 입력하세요");
			return false;
		}else if(frm.num.value > frm.num2.value){
			alert("작은수를 먼저 입력하세요");
			return false;
		}
		return true;
	};
</script>
</head>
<body>
	<form action="7_su2gugudanout.jsp" method="get" onsubmit="return chk()" name="frm">
	<p>단수 : <input type="text" name="num" required="required" size="1"> 단~
	<input type="text" name="num2" required="required" size="1">단까지</p>
	<p><input type="submit" value="구구단 출력">
	</form>
</body>
</html>