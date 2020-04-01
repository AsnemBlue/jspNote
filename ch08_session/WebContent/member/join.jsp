<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/join.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp" %>
	<div id="joinForm_wrap">
		<div id="join_title">회원가입</div>
		<hr/>
		<form action="<%=conPath %>/member/joinPro.jsp" method="post">
			<input type="hidden" name="hidden" value="xx">
			<table>
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" name="name" id="name" required="required" ></td>
				</tr>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" name="id" id="id" required="required" ></td>
				</tr>
				<tr>
					<td><label for="pw">비밀번호</label></td>
					<td><input type="password" name="pw" id="pw" required="required"></td>
				</tr>
				<tr>
					<td><label for="pwChk">비밀번호확인</label></td>
					<td><input type="password" name="pwChk" id="pwChk" required="required"></td>
				</tr>
				<tr>
					<td><label for="birth">생일</label></td>
					<td><input type="date" name="birth" id="birth" required="required"></td>
				</tr>
				<tr>
					<td><label>취미</label></td>
					<td><input type="checkbox" name="hobby" value="독서">독서
						<input type="checkbox" name="hobby" value="요리">요리
						<input type="checkbox" name="hobby" value="운동">운동
						<input type="checkbox" name="hobby" value="취침">취침</td>
				</tr>
				<tr>
					<td><label>성별</label></td>
					<td><input type="radio" name="gender" value="남자">남자
						<input type="radio" name="gender" value="여자">여자</td>
				</tr>
				<tr>
					<td><label for="email">이메일</label></td>
					<td><input type="email" name="email" id="email" required="required"></td>
				</tr>
				<tr>
					<td><label>메일수신</label></td>
					<td><select name="mailSend" multiple="multiple" id="mailSend">
						<option class="opt">광고</option>
						<option class="opt">배송</option>
						<option class="opt">공지</option>
					</select></td>
				</tr>
				<tr> </tr>
			</table>
			<p>
				<input type="submit" class="joinBtn_style" value="가입하기">
				<input type="reset" class="joinBtn_style" value="다시하기">
				<input type="button" class="joinBtn_style" value="로그인" onclick="location.href='login.jsp'">
			</p>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>