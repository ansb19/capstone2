<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD REMOVE ACTION</title>
</head>
<body>
<%
if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) {
    response.sendRedirect(request.getContextPath()+"/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardNo :"+boardNo);
    String boardPw = request.getParameter("boardPw");
    System.out.println("boardPw :"+boardPw);
    Board board = new Board();
    board.setBoardNo(boardNo);
    board.setBoardPw(boardPw);
    
    BoardDao boardDao = new BoardDao();
    
    if(boardDao.deleteBoard(board)==1){
        response.sendRedirect(request.getContextPath()+"/boardList.jsp");
    } else {
        response.sendRedirect(request.getContextPath()+"/boardRemoveForm.jsp?boardNo="+boardNo);
    }
}
%>
</body>
</html>
