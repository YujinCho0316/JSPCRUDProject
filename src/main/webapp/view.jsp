<%--
  Created by IntelliJ IDEA.
  User: 조유진
  Date: 2023-11-20
  Time: 오후 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crud.jspcrudproject.BoardDAO, com.crud.jspcrudproject.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>view page</title>
    <link rel="stylesheet" href="board.css">
</head>
<body>
    <%
        BoardDAO boardDAO = new BoardDAO();
        String seq = request.getParameter("seq");
        BoardVO vo = boardDAO.getBoard(Integer.parseInt(seq));
        request.setAttribute("vo",vo);
    %>

    <h1>자유기록장 세부 정보</h1>
    <table id="edit">
        <tr>
            <td>Post Id</td><td>${vo.getSeq()}</td>
        </tr>
        <tr>
            <td>Category</td><td>${vo.getCategory()}</td>
        </tr>
        <tr>
            <td>Img:</td><td>
            <c:if test="${vo.getImg() ne ''}"><br><img src="${pageContext.request.contextPath}/upload/${vo.getImg()}" class="img"> </c:if><td/>
        </tr>
        <tr>
            <td>Title</td><td>${vo.getTitle()}</td>
        </tr>
        <tr>
            <td>Writer</td><td>${vo.getWriter()}</td>
        </tr>
        <tr>
            <td>Content</td><td>${vo.getContent()}</td>
        </tr>
    </table>
    <button type="button" onclick="location.href='posts.jsp'">목록보기</button>
    <button type="button" onclick="location.href='editform.jsp?seq=${vo.getSeq()}'">수정하기</button>

</body>
</html>
