<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <!-- request 대신 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 파일이름 중복을 피할 수 있도록 -->
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%

// 해당 폴더에 이미지를 저장시킨다
    int fileSize = 1024*1024*3; //3mb로 파일 크기를 제한 
    ServletContext context = getServletContext();
    String uploadPath = context.getRealPath("/files"); 
    MultipartRequest multi = null;

    try{
    multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8",new DefaultFileRenamePolicy());
    String originalFile = multi.getOriginalFileName("uploadfiles");
    String uploadFile = multi.getFilesystemName("uploadfiles");      

    }catch(Exception e){
    out.write("업로드 용량 오류 또는 그 이외..." + e.getMessage());
    }


request.setCharacterEncoding("UTF-8");
String boardPw = request.getParameter("boardPw");
String boardTitle = request.getParameter("boardTitle");
String boardContent = request.getParameter("boardContent");
String boardUser = request.getParameter("boardUser");


Board board = new Board();
board.setBoardPw(boardPw);
board.setBoardTitle(boardTitle);
board.setBoardContent(boardContent);
board.setBoardUser(boardUser);
board.setOfile(originalFile);
board.setUfile(uploadFile);
 
BoardDao boardDao = new BoardDao();
int rowCount = boardDao.insertBoard(board);
 
response.sendRedirect(request.getContextPath()+"/garbage/boardList.jsp");
%>
</body>
</html>