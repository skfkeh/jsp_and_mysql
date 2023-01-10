<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="joinPro.jsp" method="post">
		<h2>회원가입</h2>
		<h4>방문해 주셔서 감사합니다.</h4>
		<table border="1">
			<tr><th>ID</th><td><input type="text" name="id"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw"></td></tr>
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr><th>Email</th><td><input type="text" name="email"></td></tr>
		</table>
		<input type="submit" value="회원가입">
		<input type=reset value="취소" onclick="location.href='main.jsp'">
	</form>
</body>
</html>