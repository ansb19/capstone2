<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD ADD</title>
</head>
<body>
<h1>BOARD ADD</h1>
<form action="<%=request.getContextPath()%>/Board/boardAddAction.jsp" method="post">
    <div>회사명 : </div>
    <div><input name="name" id="name" type="text"/></div>
    <div>제목 : </div>
    <div><input name="title" id="title" type="text"/></div>
    <div>임금형태 : </div>
    <div><input name="stype" id="stype" type="text"/></div>
    <div>급여 : </div>
    <div><input name="sal" id="sal" type="text"/></div>
    <div>근무지역 : </div>
    <div><input name="region" id="region" type="text"/></div>
    <div>근무형태 : </div>
    <div><input name="wtype" id="wtype" type="text"/></div>
    <div>최소학력 : </div>
    <div><input name="min" id="min" type="text"/></div>
    <div>최대학력 : </div>
    <div><input name="max" id="max" type="text"/></div>
    <div>경력 : </div>
    <div><input name="career" id="career" type="text"/></div>
    <div>마감일자 : </div>
    <div><input name="end" id="end" type="text"/></div>
    <div>우편주소 : </div>
    <div><input name="pad" id="pad" type="text"/></div>
    <div>도로명주소 : </div>
    <div><input name="rad" id="rad" type="text"/></div>
    <div>상세주소 : </div>
    <div><input name="dad" id="dad" type="text"/></div>
    <div>고용형태 : </div>
    <div><input name="ecode" id="ecode" type="text"/></div>
    <div>직종코드 : </div>
    <div><input name="jtype" id="jtype" type="text"/></div>
    <div>우대조건 : </div>
    <div><input name="prefer" id="prefer" type="text"/></div>
    <div>
        <input type="submit" value="글입력"/>
        <input type="reset" value="초기화"/>
    </div>
</form>
</body>
</html>