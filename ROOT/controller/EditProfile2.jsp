<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="dbconn.*" %>


<% request.setCharacterEncoding("utf-8");
    String uemail = (String) session.getAttribute("semail");

%>
    

<%
    //SignUp signup = new SignUp();
    
    String id = (String) session.getAttribute("sid");
    String pw = (String) request.getParameter("pw");
    String email = (String) request.getParameter("e_email");
    String phone = (String) request.getParameter("phone");
    String address = (String) request.getParameter("address");
    
   try {    
            if(uemail.equals(email)){
            UserDAO dao = new UserDAO();
        
            dao.update(id,pw,email,phone,address);
            
%>
            <script>
                alert("성공적으로 변경되었습니다!");
                location.href="/";
            </script>
<%
             //response.sendRedirect("/menu/EditProfile.jsp"); 
            }
            
            else{
                %>
                <script>
                alert("이메일 인증 완료 후 수정하세요!");
                history.back();
            </script>
            <%
            }
            
        } catch (NamingException | SQLException | ClassNotFoundException ex) {
            //Logger.getLogger(this.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            out.println(ex.getMessage());
        } 

    
           
%>
                    