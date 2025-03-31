<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
<style>
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
       .rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd}
.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } 
</style>
</head>
<body>
	 
	 <form action="fileEx01_upload.jsp" method="post" enctype="multipart/form-data">
	 	<fieldset>
			<legend>파일 업로드</legend>
			<p>작성자 : <input type="text" name="userName"></p>
			<p>파일명 : <input type="file" name="file"></p>
			<p><input type="submit" value="upload"></p>	 	
	 	</fieldset>
	 </form>

	<br><hr><br>
	<fieldset>
		<legend>파일 다운로드</legend>
		<table border="1">
			<tr >
				<th>이미지</th>
				<th>이미지 설명</th>
				<th>다운로드 링크</th>
			</tr>
			<tr>
				<td><img src="../img/404.PNG" alt="404이미지" width="140px" height="100px"></td>
				<td align="center" width="200">404에러 이미지</td>
				<td align="center" width="200"><a href="fileEx01_download.jsp?fileName=404.PNG">다운로드</a></td>
			</tr>	
			<tr>
				<td><img src="../img/500.PNG" alt="500이미지" width="140px" height="100px"></td>
				<td align="center" width="200">500에러 이미지</td>
				<td align="center" width="200"><a href="fileEx01_download.jsp?fileName=500.PNG">다운로드</a></td>
			</tr>	
		</table>
	</fieldset>
	<fieldset class="rate">
		<input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
		<input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
		<input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
		<input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
		<input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
		<input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
		<input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
		<input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
		<input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
		<input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>

	</fieldset>
</body>
</html>