<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sub_proj.boardDAO" %>
<%@ page import="sub_proj.boardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 읽기</title>
</head>
<body>
	<h1>글 읽기</h1>
	<%
	boardDAO dao = new boardDAO();
	boardDTO dto = dao.readContent(Integer.parseInt(request.getParameter("id")));
	session.setAttribute("id", Integer.parseInt(request.getParameter("id")));
	%>
	<table border=1>
		<tr><th>글제목</th><td><%=dto.getTxt_title() %></td></tr>
		<tr><th>작성자</th><td><%=dto.getTxt_user() %> </td></tr>
		<tr><th>글내용</th><td><%=dto.getTxt_content() %></td></tr>
	</table>
	<button onclick="location.href='updateForm.jsp'">글수정</button>
	<button onclick="location.href='deletePro.jsp'">글삭제</button>
	<button onclick="location.href='main.jsp'">글목록</button>
</body>
</html>