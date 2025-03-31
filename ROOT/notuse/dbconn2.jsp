<%-- dbconn--%>

<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    String url = "jdbc:mysql://34.64.249.77:3306/cap2?serverTimezone=UTC";
    String user = "cap2";
    String passwd = "cap2";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, passwd);
%>