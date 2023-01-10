<%@ page import="java.io.PrintWriter"%>
<%@ page import="sub_proj.boardDAO"%>
<%@ page import="sub_proj.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>readForm</h1>
	<%
		boardDAO dao = new boardDAO();
		boardDTO dto = dao.readContent(Integer.parseInt(session.getAttribute("id").toString()));
	%>
	<table border="1">
	<tr><th>글제목</th><td><%=dto.getTxt_title()%></td></tr>
	<tr><th>작성자</th><td><%=dto.getTxt_user()%></td></tr>
	<tr><th>글내용</th><td><%=dto.getTxt_content()%></td></tr>
	</table>
	<button onclick="location.href='main.jsp'">글목록</button>
	<button onclick="location.href='deleteForm.jsp'">글삭제</button>
</body>
</html>