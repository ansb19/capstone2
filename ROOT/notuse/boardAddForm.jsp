<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD ADD</title>
</head>
<body>
<h1>BOARD ADD</h1>
<form action="<%=request.getContextPath()%>/garbage/boardAddAction.jsp" encType = "multipart/form-data" method="post">
    <div>boardPw : </div>
    <div><input name="boardPw" id="boardPw" type="password"/></div>
    <div>boardTitle : </div>
    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
    <div>boardContent : </div>
    <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"></textarea></div>
    <div>boardName : </div>
    <div><input name="boardUser" id="boardUser" type="text"/></div>
    <div>파일 : </div>
    <div><input name="uploadfiles" id="uploadfiles" type="file" /></div>
    <div>
        <input type="submit" value="글입력"/>
        <input type="reset" value="초기화"/>
    </div>
</form>
</body>
</html>