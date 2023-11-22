<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.crud.jspcrudproject.BoardDAO, com.crud.jspcrudproject.BoardVO"%>
<%@ page import="com.crud.jspcrudproject.FileUpload" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<link rel="stylesheet" href="board.css">
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String seq=request.getParameter("seq");
	System.out.println(" seq parameter value: " + seq);
	BoardVO u=boardDAO.getBoard(Integer.parseInt(seq));
	request.setAttribute("u",u);
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=u.getSeq()%>"/>
<table>
	<tr><td>Category:</td><td><input type="text" name="category" value="<%= u.getCategory()%>"/></td></tr>
	<tr>
		<td>Img:</td><td><input type="file" name="img" value="${u.getImg()}"/>
		<c:if test="${u.getImg() ne ''}"><br><img src="${pageContext.request.contextPath }/upload/${u.getImg()}" class="img" width="500px"> </c:if><td/>
	<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
	<tr><td>Writer:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
	<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
	<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>