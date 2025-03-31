<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD REMOVE FORM</title>
</head>
<body>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/boardList.jsp");
} else {
%>
    <form action="<%=request.getContextPath()%>/boardRemoveAction.jsp" method="post">
        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        <div>비밀번호확인 :</div>
        <div><input name="boardPw" type="password"></div>
        <div>
            <input type="submit" value="삭제"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>
<%    
}
%>
</body>
</html>
