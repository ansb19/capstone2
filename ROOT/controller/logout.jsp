
<%
    // 로그아웃 시 세션을 없애는 jsp 파일
    String uid = (String) session.getAttribute("sid");
    session.invalidate();
    response.sendRedirect("/mainhomepage.jsp");
%>