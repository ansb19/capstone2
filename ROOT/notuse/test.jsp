<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="DBconn.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.NamingException" %>

<%
    try {
        String str[] = new String[3];
        WriteDAO dao = new WriteDAO();
        ArrayList<WriteObject> writes = dao.getListWrite();
        for (WriteObject write : writes) {
            str[0] = write.getUser();
            str[1] = write.getTitle();
            str[2] = write.getContent();

            out.println(str[0]);
            out.println(str[1]);
            out.println(str[2]);
        }
    } catch (NamingException | SQLException | ClassNotFoundException ex) {
        ex.printStackTrace();
    }
%>
