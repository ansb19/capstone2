<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="sendmailtest.jsp" method="post">
			<table>
				<tr><th colspan="2">JSP 메일 보내기</th></tr>
				<tr><td>to</td><td><input type="text" name="to" /></td></tr>
				<tr><td colspan="2" style="text-align:right;"><input type="submit" value="Transmission"/></td></tr>
			</table>
		</form>
	</div>
</body>
</html>