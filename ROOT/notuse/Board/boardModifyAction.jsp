<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD MODIFY ACTION</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/Board/boardList.jsp");
} else {
    int no = Integer.parseInt(request.getParameter("no"));
    String bname = request.getParameter("name");
    String btitle = request.getParameter("title");
    String bstype = request.getParameter("stype");
    String bsal = request.getParameter("sal");
    String bregion = request.getParameter("region");
    String bwtype = request.getParameter("wtype");
    String bmin = request.getParameter("min");
    String bmax = request.getParameter("max");
    String bcareer = request.getParameter("career");
    String bend = request.getParameter("end");
    String bpad = request.getParameter("pad");
    String brad = request.getParameter("rad");
    String bdad = request.getParameter("dad");
    String becode = request.getParameter("ecode");
    String bjtype = request.getParameter("jtype");
    String bprefer = request.getParameter("prefer");

    BoardObject boardObject = new BoardObject();
    boardObject.setNo(no);
    boardObject.setName(bname);
    boardObject.setTitle(btitle);
    boardObject.setSaltype(bstype);
    boardObject.setSal(bsal);
    boardObject.setRegion(bregion);
    boardObject.setWorktype(bwtype);
    boardObject.setMinability(bmin);
    boardObject.setMaxability(bmax);
    boardObject.setCareer(bcareer);
    boardObject.setEnddate(bend);
    boardObject.setPostad(bpad);
    boardObject.setRoadad(brad);
    boardObject.setDetailad(bdad);
    boardObject.setEmploycode(becode);
    boardObject.setJobtypecode(bjtype);
    boardObject.setPrefer(bprefer);
    
    BoardDAO boardDAO = new BoardDAO();
    boardDAO.updateBoard(boardObject);
    
    response.sendRedirect(request.getContextPath()+"/Board/boardList.jsp");
}
%>
</body>
</html>
