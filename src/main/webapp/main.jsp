<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sub_proj.boardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문해 주셔서 감사합니다</title>
</head>
<body>
	<h1>로그인</h1>
	<form action=login.jsp method=post>
		ID : <input type=text name=id><br>
		PW : <input type=password name=pw><br>
		<input type="submit" value="로그인">
	</form>
	<button onclick="location.href='join.jsp'">회원가입</button>
</body>
</html>