<%@ page import="sub_proj.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteForm</title>
</head>
<body>
<h1>deleteForm</h1>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(session.getAttribute("id").toString());
	boardDAO dao = new boardDAO();
	boolean chk = false;
%>
<script>
	/* if(!confirm("정말 삭제 하시겠습니까?"))
	{
		chk = false;
		history.back();
	} else { */
		alert("삭제 완료!");
		<% dao.deleteContent(id); %>
		location.href="board_main.jsp";
	/* } */
</script>

</body>
</html>
