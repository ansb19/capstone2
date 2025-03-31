<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD REMOVE ACTION</title>
</head>
<body>
<%
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/Board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("no"));
    BoardObject boardObject = new BoardObject();
    boardObject.setNo(boardNo);
    
    BoardDAO boardDAO = new BoardDAO();
    
    if(boardDAO.deleteBoard(boardObject)==1){
        response.sendRedirect(request.getContextPath()+"/Board/boardList.jsp");
    } else {
        response.sendRedirect(request.getContextPath()+"/Board/boardRemoveForm.jsp?no="+boardNo);
    }
}
%>
</body>
</html>
