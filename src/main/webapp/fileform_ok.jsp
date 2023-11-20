<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><%--
  Created by IntelliJ IDEA.
  User: 조유진
  Date: 2023-11-17
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
fileform_ok.jsp 페이지 입니다.
<%
    String filename = "";
    int sizeLimit = 15*1024*1024;

    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multpartRequest = null;
    multpartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    filename = multpartRequest.getFilesystemName("img1");
%>
파일명: <%=filename%><br>
물리적 저장 경로: <%=realPath%><br>

</body>
</html>
