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
	String id= request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	boolean completeid = false;
	boolean completepw = false;
	boolean completenm = false;
	
	userDTO dto = new userDTO();
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setEmail(email);
	
	if(id == null || id == "") { %> <script> alert("ID를 입력해주세요."); </script> <% completeid = false; } else completeid = true;
	if(pw == null || pw == "") { %> <script> alert("PW를 입력해주세요."); </script> <% completepw = false; } else completepw = true;
	if(name == null || name == "") { %> <script> alert("이름을 입력해주세요."); </script> <% completenm = false; } else completenm = true;
	
	if(completeid == true && completepw == true && completenm == true) {
		userDAO dao = new userDAO();
		dao.insertUser(dto);
		%> <script> alert("회원가입 완료!");location.href = "main.jsp"; </script> <%
	} else {
		%> <script> alert("회원가입 실패..");location.href = "join.jsp"; </script> <%
	}
	%>
	</body>
</html>	
