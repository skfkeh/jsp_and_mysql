<%@page import="java.io.PrintWriter"%>
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
	boardDAO dao = new boardDAO();
	int id = dao.indexNum();
	String name = request.getParameter("txt_user");
	String pw = request.getParameter("txt_pw");
	String title = request.getParameter("txt_title");
	String content = request.getParameter("txt_content");
	Boolean chk = false;

	boardDTO dto = new boardDTO();
	dto.setTxt_id(id);
	dto.setTxt_user(name);
	dto.setTxt_pw(pw);
	dto.setTxt_title(title);
	dto.setTxt_content(content);
	
	chk = dao.insertBoard(dto);
	PrintWriter script = response.getWriter();
	
	if(chk == true) {
		script.println("<script>");
		script.println("alert('작성 완료.')");
		script.println("location.href='board_main.jsp';");
		script.println("</script>");
		script.close();	
	} else {
		script.println("<script>");
		script.println("alert('작성 실패. 작성 내용을 확인해 주세요.')");
		script.println("location.href='writeForm.jsp';");
		script.println("</script>");
		script.close();	
	}
%>
</body>
</html>