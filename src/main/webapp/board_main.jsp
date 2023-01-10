<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sub_proj.boardDAO"%>
<%@ page import="sub_proj.boardDTO"%>
<%
	boardDAO dao = new boardDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h1>main</h1>
	<table border="1">
	<tr><th>글번호</th><th>글제목</th><th>작성자</th></tr>
	<% out.print(dao.makeList()); %>
	<% session.setAttribute("txt_id", request.getParameter("txt_id"));%>
	</table>
	<button onclick="location.href='writeForm.jsp'">글쓰기</button>
	<button onclick="location.href='surveyForm.jsp'">설문조사</button>
	
	<br><hr><br>
	
	<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
	 	<fieldset>
			<legend>파일 업로드</legend>
			<p>작성자 : <input type="text" name="userName" value="<%= session.getAttribute("userid").toString()%>" readonly>님</p>
			<p>파일명 : <input type="file" name="file"></p>
			<p><input type="submit" value="upload"></p>	 	
	 	</fieldset>
	 </form>
	<br><hr><br>
	<fieldset>
		<legend>파일 다운로드</legend>
		<table border="1">
			<tr >
				<th>이미지</th>
				<th>이미지 설명</th>
				<th>다운로드 링크</th>
			</tr>
			<tr>
				<td><img src="/Users/watsonjung/Documents/playdata/09.Java_Docu/img/spongebob.png" alt="spongebob" width="140px" height="100px"></td>
				<td align="center" width="200">스폰지밥</td>
				<td align="center" width="200"><a href="fileDownload.jsp?fileName=spongebob.png">다운로드</a></td>
			</tr>	
			<tr>
				<td><img src="/Users/watsonjung/Documents/playdata/09.Java_Docu/img/patrick.png" alt="patrick" width="140px" height="100px"></td>
				<td align="center" width="200">뚱이</td>
				<td align="center" width="200"><a href="fileDownload.jsp?fileName=patrick.png">다운로드</a></td>
			</tr>
		</table>
	</fieldset>
</body>
</html>
