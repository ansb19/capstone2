<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="dbconn.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String type = request.getParameter("type"); // 개인 기업
    


   try {
            UserDAO dao = new UserDAO();
            UserObject obj = dao.selectUserByID(id);

            String logincheck = dao.login(id,pw,type);
            
            String email = obj.getUser_email();
            String certcheck = obj.getUser_cert();
            String name = obj.getUser_name();

            
            if(logincheck.equals("로그인성공")){

                session.setAttribute("sid",id);
                session.setAttribute("sname",name);
                session.setAttribute("scert",certcheck);
                session.setAttribute("stype",type);
                response.sendRedirect("/mainhomepage.jsp"); // 로그인 성공 시 이동할 페이지

            }
            else if(logincheck.equals("비밀번호 불일치")){
%>
            <script>
                alert("비밀번호를 다시 확인해주세요.");
                location.href="/menu/login/mainlogin.jsp"
            </script>
<%
            }
            else if(logincheck.equals("아이디 없음")){
%>
            <script>
                alert("아이디가 없거나 로그인 유형을 확인해주세요");
                location.href="/menu/login/mainlogin.jsp"
            </script>
<%
            }
            else if(logincheck.equals("이메일미인증")){
                session.setAttribute("sid",id);
                session.setAttribute("sname",name);
                session.setAttribute("semail",email);
                session.setAttribute("scert",certcheck);
                session.setAttribute("stype",type);
                response.sendRedirect("/menu/cert/emailcert.jsp");

            }
            else{
                %>
            <script>
                alert("오류가 발생했습니다 관리자에게 문의하세요");
                location.href="/menu/login/mainlogin.jsp"
            </script>
<%
            }
            
        } catch (NamingException | SQLException | ClassNotFoundException ex) {
            //Logger.getLogger(this.class.getName()).log(Level.SEVERE, null, ex);
            %><script>
                alert("아이디가 틀렸습니다..");
                location.href="/menu/login/mainlogin.jsp"
            </script><%
        } 

           
%>
                    