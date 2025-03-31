<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD ADD</title>
</head>
<body>
<h1>BOARD ADD</h1>
<form action="<%=request.getContextPath()%>/Resume/boardAddAction.jsp" method="post" enctype="multipart/form-data">
    <div>사진 : </div>
    <div><input name="file" id="file" type="file"/></div>
    <div>성명 : </div>
    <div><input name="name" id="name" type="text"/></div>
    <div>영문성명 : </div>
    <div><input name="ename" id="ename" type="text"/></div>
    <div>주민번호 : </div>
    <div><input name="rno" id="rno" type="text"/></div>
    <div>나이 : </div>
    <div><input name="age" id="age" type="text"/></div>
    <div>성별 : </div>
    <div><input name="sex" id="sex" type="text"/></div>
    <div>주소 : </div>
    <div><input name="ad" id="ad" type="text"/></div>
    <div>연락처 : </div>
    <div><input name="phone" id="phone" type="text"/></div>
    <div>이메일 : </div>
    <div><input name="email" id="email" type="text"/></div>
    <div>학교명 : </div>
    <div><input name="sname" id="sname" type="text"/></div>
    <div>전공 : </div>
    <div><input name="major" id="major" type="text"/></div> 
    <div>재학기간 : </div>
    <div><input name="eperiod" id="eperiod" type="text"/></div>
    <div>학점 : </div>
    <div><input name="credit" id="credit" type="text"/></div>
    <div>졸업여부 : </div>
    <div><input name="graudate" id="graudate" type="text"/></div>
    <div>기간 : </div>
    <div><input name="aperiod" id="aperiod" type="text"/></div>
    <div>활동내용 : </div>
    <div><input name="content" id="content" type="text"/></div>
    <div>활동구분 : </div>
    <div><input name="actc" id="actc" type="text"/></div>
    <div>기관 및 장소 : </div>
    <div><input name="actp" id="actp" type="text"/></div>
    <div>자격증 : </div>
    <div><input name="cname" id="cname" type="text"/></div>
    <div>취득년월일 : </div>
    <div><input name="cdate" id="cdate" type="text"/></div>
    <div>시행처 : </div>
    <div><input name="cplace" id="cplace" type="text"/></div>
    <div>근무기간 : </div>
    <div><input name="cperiod" id="cperiod" type="text"/></div>
    <div>근무회사 : </div>
    <div><input name="company" id="company" type="text"/></div>
    <div>부서 : </div>
    <div><input name="department" id="department" type="text"/></div>
    <div>직위 : </div>
    <div><input name="position" id="position" type="text"/></div>
    <div>담당직무 : </div>
    <div><input name="duty" id="duty" type="text"/></div>
    <div>
        <input type="submit" value="글입력"/>
        <input type="reset" value="초기화"/>
    </div>
</form>
</body>
</html>