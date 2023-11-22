<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.jspcrudproject.BoardDAO"%>
<%@ page import="com.crud.jspcrudproject.FileUpload" %>
<%@ page import="com.crud.jspcrudproject.BoardVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.crud.jspcrudproject.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
	request.setCharacterEncoding("utf-8");
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO vo = upload.uploadImg(request);

	int i=boardDAO.updateBoard(vo);
	response.sendRedirect("p.jsostsp");
%>