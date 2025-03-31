<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD MODIFY ACTION</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/menu/Review/review.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("No"));
    String boardCompany = request.getParameter("Company");
    String boardTitle = request.getParameter("Title");
    String boardContent = request.getParameter("Content");
    String boardRatings = request.getParameter("Ratings");
 
    ReviewObject reviewObject = new ReviewObject();
    reviewObject.setNo(boardNo);
    reviewObject.setCompany(boardCompany);
    reviewObject.setTitle(boardTitle);
    reviewObject.setContent(boardContent);
    reviewObject.setRatings(boardRatings);
    
    ReviewDAO reviewDAO = new ReviewDAO();
    reviewDAO.updateBoard(reviewObject);
    
    response.sendRedirect(request.getContextPath()+"/boardView.jsp?boardNo="+boardNo);
}
%>
</body>
</html>
