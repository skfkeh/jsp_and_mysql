<%@page import="sub_proj.userDAO"%>
<%@page import="sub_proj.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	session.setAttribute("userid", request.getParameter("id"));
	session.setAttribute("userpw", request.getParameter("pw"));
	
	userDTO dto = new userDTO();
	dto.setId(id);
	dto.setPw(pw);
	
	userDAO dao = new userDAO();
	boolean login_chk = dao.readUser(id, pw);
	if(login_chk == true) {
		%> <script>location.href = "board_main.jsp";</script> <%
	} else {
		%>
		<script>
		alert("로그인 실패!");location.href = "main.jsp";
		</script>
		<%
	}
%>
	</body>
</html>