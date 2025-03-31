<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>지원서 삭제</title>
</head>
<body>
<%
    String uid = (String) session.getAttribute("sid");
    session.setAttribute("sid", uid);

    UserDAO userdao = new UserDAO();
    UserObject user = userdao.selectUserByID(uid);

    String no = (String) request.getParameter("SupportNo");
    String passwd = (String) request.getParameter("passwd");

if(no == null || passwd == null) {
        response.sendRedirect(request.getContextPath()+"/menu/Support/ApplicationList.jsp");

    }
    else if(user.getUser_passwd() == null){
        response.sendRedirect(request.getContextPath()+"/menu/login/mainlogin.jsp");
    }
    else if(!passwd.equals(user.getUser_passwd())){
        %>
        <script>
            alert("비밀번호가 일치하지 않습니다.");
            history.back();
        </script>
        <%
    }
    else {
    int SupportNo = Integer.parseInt(request.getParameter("SupportNo"));
    
    SupportObject support = new SupportObject();
    support.setNo(SupportNo);
    
    
    SupportDAO dao = new SupportDAO();
    
    if(dao.deleteSupport(support)==1){
        %>
        <script>
            alert("삭제 완료!");
            location.href="/menu/Support/ApplicationList.jsp";
        </script>
        <%

    } else {
        %>
        <script>
            alert("삭제 실패! 관리자에게 문의하세요.")
            history.back();
        </script>
        <%
        
    }
}
%>
</body>
</html>
