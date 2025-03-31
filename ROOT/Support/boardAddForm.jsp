<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD ADD</title>
</head>
<body>
<h1>BOARD ADD</h1>
<form action="<%=request.getContextPath()%>/Support/boardAddAction.jsp" method="post" enctype="multipart/form-data">

    <div>boardTitle : </div>
    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
    <div>boardContent : </div>
    <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"></textarea></div>
    <div>첨부파일 : <input type="file" name="attachedFile"/></div>
    <div>
        <input type="submit" value="글입력"/>
        <input type="reset" value="초기화"/>
    </div>
</form>
</body>
</html>