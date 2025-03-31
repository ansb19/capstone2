<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="dbconn.*" %>


<% request.setCharacterEncoding("utf-8"); %>


<%
    //개인 정보 수정을 위해 비밀번호 확인 및 개인정보db 정보 출력

    String id = (String) session.getAttribute("sid");
    String pw = (String) request.getParameter("pw");
    

            UserDAO dao = new UserDAO();
            UserObject obj = dao.selectUserByID(id);


            if(pw.equals(obj.getUser_passwd())){ 
                
                request.setAttribute("User_name",obj.getUser_name());
                request.setAttribute("User_birth",obj.getUser_birth());
                request.setAttribute("User_sex",obj.getUser_sex());
                request.setAttribute("User_type",obj.getUser_type());
                request.setAttribute("User_email",obj.getUser_email());
                request.setAttribute("User_phone",obj.getUser_phone());
                request.setAttribute("User_address",obj.getUser_address());
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/menu/EditProfile/EditProfileupdate.jsp");
                dispatcher.forward(request, response); // 비밀번호 확인 성공 시 이동할 페이지
            }
            else {
%>
            <script>
                alert("비밀번호를 다시 확인해주세요.");
                location.href= "/menu/EditProfile/EditProfile.jsp"
            </script>
<%
            
            
            
        } 
           
%>
                    