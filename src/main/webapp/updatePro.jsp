<%@page import="sub_proj.boardDAO"%>
<%@page import="sub_proj.boardDTO"%>
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
	int num = Integer.parseInt(session.getAttribute("id").toString());
	String title = request.getParameter("title");
	String pass = request.getParameter("txt_pw");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	boardDTO dto = new boardDTO();
	dto.setTxt_id(num);
	dto.setTxt_title(title);
	dto.setTxt_content(content);
	
	boardDAO dao = new boardDAO();
	boolean chk = dao.updateContent(dto);
	if(chk==true) {
		%> <script>alert("수정 완료!");location.href = "board_main.jsp";</script> <%
	} else {
		%> <script>alert("수정 실패..");location.href = "readForm.jsp?id=<%= num%>";</script> <%
	}
%>
</body>
</html>