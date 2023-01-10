<%@page import="sub_proj.boardDAO"%>
<%@page import="sub_proj.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<h1>updateForm</h1>
	<%
	boardDAO dao = new boardDAO();
	boardDTO dto = dao.readContent(Integer.parseInt(session.getAttribute("id").toString()));
	String pwck = dto.getTxt_pw();
	
	%>
	<form action="updatePro.jsp" method="post">
		<table border="1">
			<tr><th>글제목</th><td><input type="text" name="title" value="<%=dto.getTxt_title()%>"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw" value="<%=dto.getTxt_pw()%>" readonly></td></tr>
			<tr><th>작성자</th><td><input type="text" name="name" value="<%=dto.getTxt_user()%>" readonly></td></tr>
			<tr><th>글내용</th><td><textarea name="content" cols="20" rows="20"><%=dto.getTxt_content()%></textarea></td></tr>
		</table>
		<input type="hidden" value="<%=dto.getTxt_id()%>" name="id">
		<input type="hidden" value="<%=pwck%>" name="pwck">
		<input type="submit" value="수정하기">
	</form>
	
	<button onclick="location.href='board_main.jsp'">글목록</button>

</body>
</html>