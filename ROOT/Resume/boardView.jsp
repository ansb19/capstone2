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
    response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
} else {
    int no = Integer.parseInt(request.getParameter("no"));
    ResumeDAO resumeDAO = new ResumeDAO();
    ResumeObject resumeObject = resumeDAO.selectBoardByKey(no);
%>
    <div> 사진 :</div>
    <div><img src="/files/<%=resumeObject.getFileservername()%>" width=500 height=300 /></div>
    <%=resumeObject.getFileservername()%>
    <div> 번호 :</div>
    <div><%=resumeObject.getNo()%></div>
    <div> 성명 :</div>
    <div><%=resumeObject.getName()%></div>
    <div> 영문성명 :</div>
    <div><%=resumeObject.getEname()%></div>
    <div> 주민번호 :</div>
    <div><%=resumeObject.getRno()%></div>
    <div> 나이 :</div>
    <div><%=resumeObject.getAge()%></div>
    <div> 성별 :</div>
    <div><%=resumeObject.getSex()%></div>
    <div> 주소 :</div>
    <div><%=resumeObject.getAd()%></div>
    <div> 연락처 :</div>
    <div><%=resumeObject.getPhone()%></div>
    <div> 이메일 :</div>
    <div><%=resumeObject.getEmail()%></div>
    <div> 학교명 :</div>
    <div><%=resumeObject.getSname()%></div>
    <div> 전공 :</div>
    <div><%=resumeObject.getMajor()%></div>
    <div> 재학기간 :</div>
    <div><%=resumeObject.getEperiod()%></div>
    <div> 학점 :</div>
    <div><%=resumeObject.getCredit()%></div>
    <div> 졸업여부 :</div>
    <div><%=resumeObject.getGraudate()%></div>
    <div> 기간 :</div>
    <div><%=resumeObject.getAperiod()%></div>
    <div> 활동 내용 :</div>
    <div><%=resumeObject.getContent()%></div>
    <div> 활동 구분 :</div>
    <div><%=resumeObject.getActc()%></div>
    <div> 기관 및 장소 :</div>
    <div><%=resumeObject.getActp()%></div>
    <div> 취득년월일 :</div>
    <div><%=resumeObject.getCdate()%></div>
    <div> 자격증 :</div>
    <div><%=resumeObject.getCname()%></div>
    <div> 시행처 :</div>
    <div><%=resumeObject.getCplace()%></div>
    <div> 근무기간 :</div>
    <div><%=resumeObject.getCperiod()%></div>
    <div> 근무회사 :</div>
    <div><%=resumeObject.getCompany()%></div>
    <div> 부서 :</div>
    <div><%=resumeObject.getDepartment()%></div>
    <div> 직위 :</div>
    <div><%=resumeObject.getPosition()%></div>
    <div> 담당직무 :</div>
    <div><%=resumeObject.getDuty()%></div>
    <div> 작성일 :</div>
    <div><%=resumeObject.getDate()%></div>
    <div>
        <a href="<%=request.getContextPath()%>/Resume/boardModifyForm.jsp?no=<%=resumeObject.getNo()%>">수정</a>
        <a href="<%=request.getContextPath()%>/Resume/boardRemoveAction.jsp?no=<%=resumeObject.getNo()%>">삭제</a>
    </div>
<%
}
%>
</body>
</html>