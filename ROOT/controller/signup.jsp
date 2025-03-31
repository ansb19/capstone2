<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="dbconn.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
    //SignUp signup = new SignUp();
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String birth = request.getParameter("birth");

    String sex = request.getParameter("sex");
    String type = request.getParameter("type");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");


    if (id == null || pw == null || name == null || birth == null || sex == null || type == null || email == null || phone == null || address == null
        || id.isEmpty() || pw.isEmpty() || name.isEmpty() || birth.isEmpty() || sex.isEmpty() || type.isEmpty() || email.isEmpty() || phone.isEmpty() || address.isEmpty()) {
        %>
        <script>
            alert("입력 정보를 확인해주세요..!!");
            history.back();
        </script>
        <%
    } else {
        UserDAO dao = new UserDAO();
        ArrayList<UserObject> users = dao.select();

        boolean idExists = false;
        for (UserObject user : users) {
            if (id.equals(user.getUser_id())) {
                idExists = true;
                break;
            }
        }

        if (idExists) {
            %>
            <script>
                alert("이미 존재하는 아이디입니다.!!");
                history.back();
            </script>
            <%
        } else {
            int success = dao.insert(id, pw, name, birth, sex, type, email, phone, address);
            if (success > 0) {
                %>
                <script>
                    alert("가입 완료!!");
                    location.href= "/menu/login/mainlogin.jsp";
                </script>
                <%
            } else {
                %>
                <script>
                    alert("가입 실패... 다시 시도해주세요.");
                    history.back();
                </script>
                <%
            }
        }
    }
%>
