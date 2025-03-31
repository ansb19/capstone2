<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dbconn.*" %>


<%
//db 들어가는 부분
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String userId = request.getParameter("userId");
    String contents = request.getParameter("contents");

    PreparedStatement pstmt = null;

    try {
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO cap2.board1 (title, contents, user_id, create_date) ";
        sql += "VALUES (?, ?, ?, now()) ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, contents);
        pstmt.setString(3, userId);
        pstmt.executeUpdate();

    }
    catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    response.sendRedirect("boardlist.jsp");

%>

