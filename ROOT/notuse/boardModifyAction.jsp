<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY ACTION</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) {
    response.sendRedirect(request.getContextPath()+"/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardModifyAction param boardNo :"+boardNo);
    String boardPw = request.getParameter("boardPw");
    System.out.println("boardModifyAction param boardPw :"+boardPw);
    String boardTitle = request.getParameter("boardTitle");
    System.out.println("boardModifyAction param boardTitle :"+boardTitle);
    String boardContent = request.getParameter("boardContent");
    System.out.println("boardModifyAction param boardContent :"+boardContent);
 
    Board board = new Board();
    board.setBoardNo(boardNo);
    board.setBoardPw(boardPw);
    board.setBoardTitle(boardTitle);
    board.setBoardContent(boardContent);
    
    BoardDao boardDao = new BoardDao();
    boardDao.updateBoard(board);
    
    response.sendRedirect(request.getContextPath()+"/garbage/boardList.jsp");
}
%>
</body>
</html>
