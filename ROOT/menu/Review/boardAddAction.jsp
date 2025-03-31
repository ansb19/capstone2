<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String reviewTitle = request.getParameter("Title");
String reviewCompany = request.getParameter("Company");
String reviewContent = request.getParameter("Content");
String reviewRatings = request.getParameter("rating");

String uid = (String) session.getAttribute("sid");
session.setAttribute("sid",uid);
 
ReviewObject reviewObject = new ReviewObject();
reviewObject.setTitle(reviewTitle);
reviewObject.setCompany(reviewCompany);
reviewObject.setContent(reviewContent);
reviewObject.setRatings(reviewRatings);
reviewObject.setUser_id(uid);
 
ReviewDAO reviewDAO = new ReviewDAO();
int rowCount = reviewDAO.insertBoard(reviewObject);
 
response.sendRedirect(request.getContextPath()+"/menu/Review/Review.jsp");
%>
</body>
</html>