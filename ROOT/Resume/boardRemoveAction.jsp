<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD REMOVE ACTION</title>
</head>
<body>
<%
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("no"));
    ResumeObject resumeObject = new ResumeObject();
    resumeObject.setNo(boardNo);
    
    ResumeDAO resumeDAO = new ResumeDAO();
    
    if(resumeDAO.deleteBoard(resumeObject)==1){
        response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
    } else {
        response.sendRedirect(request.getContextPath()+"/Resume/boardRemoveForm.jsp?no="+boardNo);
    }
}
%>
</body>
</html>
