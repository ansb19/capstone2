<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>
<%
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/Board/boardList.jsp");
} else {
    int no = Integer.parseInt(request.getParameter("no"));
    BoardDAO boardDAO = new BoardDAO();
    BoardObject boardObject = boardDAO.selectBoardByKey(no);
%>
    <div>구인인증번호 :</div>
    <div><%=boardObject.getNo()%></div>
    <div>기업명 :</div>
    <div><%=boardObject.getName()%></div>
    <div>채용제목 :</div>
    <div><%=boardObject.getTitle()%></div>
    <div>임금형태 :</div>
    <div><%=boardObject.getSaltype()%></div>
    <div>급여 :</div>
    <div><%=boardObject.getSal()%></div>
    <div>근무지역 :</div>
    <div><%=boardObject.getRegion()%></div>
    <div>근무형태 :</div>
    <div><%=boardObject.getWorktype()%></div>
    <div>최소학력 :</div>
    <div><%=boardObject.getMinability()%></div>
    <div>최대학력 :</div>
    <div><%=boardObject.getMaxability()%></div>
    <div>경력 :</div>
    <div><%=boardObject.getCareer()%></div>
    <div>등록일자 :</div>
    <div><%=boardObject.getDate()%></div>
    <div>마감일자 :</div>
    <div><%=boardObject.getEnddate()%></div>
    <div>근무지 우편주소 :</div>
    <div><%=boardObject.getPostad()%></div>
    <div>근무지 도로명주소 :</div>
    <div><%=boardObject.getRoadad()%></div>
    <div>근무지 상세주소 :</div>
    <div><%=boardObject.getDetailad()%></div>
    <div>고용형태코드 :</div>
    <div><%=boardObject.getEmploycode()%></div>
    <div>직종코드 :</div>
    <div><%=boardObject.getJobtypecode()%></div>
    <div>최종수정일 :</div>
    <div><%=boardObject.getLastupdatedate()%></div>
    <div>우대조건 :</div>
    <div><%=boardObject.getPrefer()%></div>
    <div>
        <a href="<%=request.getContextPath()%>/Board/boardModifyForm.jsp?no=<%=boardObject.getNo()%>">수정</a>
        <a href="<%=request.getContextPath()%>/Board/boardRemoveAction.jsp?no=<%=boardObject.getNo()%>">삭제</a>
    </div>
<%
}
%>
</body>
</html>