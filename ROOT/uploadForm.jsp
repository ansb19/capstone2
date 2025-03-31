<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드</title>
</head>
<body>
    <h1>파일 업로드 예제</h1>
    <form action="upload.jsp" method="post" enctype="multipart/form-data">
        <input type="file" name="file" multiple>
        <input type="submit" value="업로드">
    </form>
</body>
</html>