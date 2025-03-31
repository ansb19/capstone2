<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="dbconn.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
    String uid = (String) session.getAttribute("sid");
    


   try {
            UserDAO dao = new UserDAO();
            
            dao.delete(uid);
            
            %>
            <script>
                    alert("탈퇴 완료");
                    location.href= "/controller/logout.jsp"
                    
            </script>
            <%
        } catch (NamingException | SQLException | ClassNotFoundException ex) {
            //Logger.getLogger(this.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            out.println(ex.getMessage());
            %>
            <script>
                        alert("탈퇴 실패!!");
            </script>
            <%
        } 

    
           
%>
             