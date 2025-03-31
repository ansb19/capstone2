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
    response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
} else {
    int no = Integer.parseInt(request.getParameter("no"));
    ResumeDAO resumeDAO = new ResumeDAO();
    ResumeObject resumeObject = resumeDAO.selectBoardByKey(no);
%>    
    <form action="<%=request.getContextPath()%>/Resume/boardModifyAction.jsp" method="post">

    <div>사진 : </div>
    <div><input name="file" value="<%=resumeObject.getFileservername()%>" id="file" type="file"/></div>
    <div>번호 :</div>
    <div><input name="no" value="<%=resumeObject.getNo()%>" type="text" readonly="readonly"/></div>
    <div>성명 : </div>
    <div><input name="name" value="<%=resumeObject.getName()%>" id="name" type="text"/></div>
    <div>영문성명 : </div>
    <div><input name="ename" value="<%=resumeObject.getEname()%>" id="ename" type="text"/></div>
    <div>주민번호 : </div>
    <div><input name="rno" value="<%=resumeObject.getRno()%>" id="rno" type="text"/></div>
    <div>나이 : </div>
    <div><input name="age" value="<%=resumeObject.getAge()%>" id="age" type="text"/></div>
    <div>성별 : </div>
    <div><input name="sex" value="<%=resumeObject.getSex()%>" id="sex" type="text"/></div>
    <div>주소 : </div>
    <div><input name="ad" value="<%=resumeObject.getAd()%>" id="ad" type="text"/></div>
    <div>연락처 : </div>
    <div><input name="phone" value="<%=resumeObject.getPhone()%>" id="phone" type="text"/></div>
    <div>이메일 : </div>
    <div><input name="email" value="<%=resumeObject.getEmail()%>" id="email" type="text"/></div>
    <div>학교명 : </div>
    <div><input name="sname" value="<%=resumeObject.getSname()%>" id="sname" type="text"/></div>
    <div>전공 : </div>
    <div><input name="major" value="<%=resumeObject.getMajor()%>" id="major" type="text"/></div>
    <div>재학기간 : </div>
    <div><input name="eperiod" value="<%=resumeObject.getEperiod()%>" id="eperiod" type="text"/></div>
    <div>학점 : </div>
    <div><input name="credit" value="<%=resumeObject.getCredit()%>" id="credit" type="text"/></div>
    <div>졸업여부 : </div>
    <div><input name="graudate" value="<%=resumeObject.getGraudate()%>" id="graudate" type="text"/></div>
    <div>기간 : </div>
    <div><input name="aperiod" value="<%=resumeObject.getAperiod()%>" id="aperiod" type="text"/></div>
    <div>활동내용 : </div>
    <div><input name="content" value="<%=resumeObject.getContent()%>" id="content" type="text"/></div>
    <div>활동구분 : </div>
    <div><input name="actc" value="<%=resumeObject.getActc()%>" id="actc" type="text"/></div>
    <div>기관 및 장소 : </div>
    <div><input name="actp" value="<%=resumeObject.getActp()%>" id="actp" type="text"/></div>
    <div>취득년월일 : </div>
    <div><input name="cdate" value="<%=resumeObject.getCdate()%>" id="cdate" type="text"/></div>
    <div>자격증 : </div>
    <div><input name="cname" value="<%=resumeObject.getCname()%>" id="cname" type="text"/></div>
    <div>시행처 : </div>
    <div><input name="cplace" value="<%=resumeObject.getCplace()%>" id="cplace" type="text"/></div>
    <div>근무기간 : </div>
    <div><input name="cperiod" value="<%=resumeObject.getCperiod()%>" id="cperiod" type="text"/></div>
    <div>근무회사 : </div>
    <div><input name="company" value="<%=resumeObject.getCompany()%>" id="company" type="text"/></div>
    <div>부서 : </div>
    <div><input name="department" value="<%=resumeObject.getDepartment()%>" id="department" type="text"/></div>
    <div>직위 : </div>
    <div><input name="position" value="<%=resumeObject.getPosition()%>" id="position" type="text"/></div>
    <div>담당직무 : </div>
    <div><input name="duty" value="<%=resumeObject.getDuty()%>" id="duty" type="text"/></div>
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