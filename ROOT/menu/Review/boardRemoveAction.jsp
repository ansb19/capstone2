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
    response.sendRedirect(request.getContextPath()+"/menu/Review/Review.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("no"));
    ReviewObject reviewObject = new ReviewObject();
    reviewObject.setNo(boardNo);
    
    ReviewDAO reviewDAO = new ReviewDAO();
    
    if(reviewDAO.deleteBoard(reviewObject)==1){
        response.sendRedirect(request.getContextPath()+"/menu/Review/Review.jsp");
    } else {
        response.sendRedirect(request.getContextPath()+"/menu/boardRemoveForm.jsp?no="+boardNo);
    }
}
%>
</body>
</html>
