<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY FORM</title>
</head>
<body>
<h1>BOARD MODIFY</h1>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardModify param boardNo:"+boardNo);
    BoardDao boardDao = new BoardDao();
    Board board = boardDao.selectBoardByKey(boardNo);
%>    
    <form action="<%=request.getContextPath()%>/boardModifyAction.jsp" method="post">
        <div>boardNo</div>
        <div><input name="boardNo" value="<%=board.getBoardNo()%>" type="text" readonly="readonly"/></div>
        <div>비밀번호확인: </div>
        <div><input name="boardPw" id="boardPw" type="password"/></div>
        <div>boardTitle : </div>
        <div><input name="boardTitle" value="<%=board.getBoardTitle()%>" id="boardTitle" type="text"/></div>
        <div>boardContent : </div>
        <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"><%=board.getBoardContent()%></textarea></div>
        <div>
            <input type="submit" value="글수정"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>
<%
}    
%>
</body>
</html>