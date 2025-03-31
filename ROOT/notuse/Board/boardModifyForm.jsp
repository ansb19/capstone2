<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD MODIFY FORM</title>
</head>
<body>
<h1>BOARD MODIFY</h1>
<%
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/Board/boardList.jsp");
} else {
    int no = Integer.parseInt(request.getParameter("no"));
    BoardDAO boardDAO = new BoardDAO();
    BoardObject boardObject = boardDAO.selectBoardByKey(no);
%>    
    <form action="<%=request.getContextPath()%>/Board/boardModifyAction.jsp" method="post">

    <div>번호 :</div>
    <div><input name="no" value="<%=boardObject.getNo()%>" type="text" readonly="readonly"/></div>
    <div>회사명 : </div>
    <div><input name="name" value="<%=boardObject.getName()%>" id="name" type="text"/></div>
    <div>제목 : </div>
    <div><input name="title" value="<%=boardObject.getTitle()%>" id="title" type="text"/></div>
    <div>임금형태 : </div>
    <div><input name="stype" value="<%=boardObject.getSaltype()%>" id="stype" type="text"/></div>
    <div>급여 : </div>
    <div><input name="sal" value="<%=boardObject.getSal()%>" id="sal" type="text"/></div>
    <div>근무지역 : </div>
    <div><input name="region" value="<%=boardObject.getRegion()%>" id="region" type="text"/></div>
    <div>근무형태 : </div>
    <div><input name="wtype" value="<%=boardObject.getWorktype()%>" id="wtype" type="text"/></div>
    <div>최소학력 : </div>
    <div><input name="min" value="<%=boardObject.getMinability()%>" id="min" type="text"/></div>
    <div>최대학력 : </div>
    <div><input name="max" value="<%=boardObject.getMaxability()%>" id="max" type="text"/></div>
    <div>경력 : </div>
    <div><input name="career" value="<%=boardObject.getCareer()%>" id="career" type="text"/></div>
    <div>마감일자 : </div>
    <div><input name="end" value="<%=boardObject.getEnddate()%>" id="end" type="text"/></div>
    <div>우편주소 : </div>
    <div><input name="pad" value="<%=boardObject.getPostad()%>" id="pad" type="text"/></div>
    <div>도로명주소 : </div>
    <div><input name="rad" value="<%=boardObject.getRoadad()%>" id="rad" type="text"/></div>
    <div>상세주소 : </div>
    <div><input name="dad" value="<%=boardObject.getDetailad()%>" id="dad" type="text"/></div>
    <div>고용형태 : </div>
    <div><input name="ecode" value="<%=boardObject.getEmploycode()%>" id="ecode" type="text"/></div>
    <div>직종코드 : </div>
    <div><input name="jtype" value="<%=boardObject.getJobtypecode()%>" id="jtype" type="text"/></div>
    <div>우대조건 : </div>
    <div><input name="prefer" value="<%=boardObject.getPrefer()%>" id="prefer" type="text"/></div>
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