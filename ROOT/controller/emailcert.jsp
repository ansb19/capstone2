<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="dbconn.*" %>


<% request.setCharacterEncoding("utf-8"); %>


<%
    String id = (String) application.getAttribute("sid");
    String email = (String) application.getAttribute("semail");
    


   try {
            
            UserDAO dao = new UserDAO();
            
            dao.emailcert(id,email);

            application.removeAttribute("sid");
            application.removeAttribute("semail");
            
            %>
            <script>
                alert("인증이 완료 되었습니다");
                location.href="/menu/login/mainlogin.jsp";
            </script>
            <%
            
            
        } catch (NamingException | SQLException | ClassNotFoundException ex) {
            //Logger.getLogger(this.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            out.println(ex.getMessage());
        } 

    
           
%>
                    