<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <div class="test">
    <select name="stbType" id="stbType">
        <option value="_0">Design</option>
        <option value="_1">User</option>
        <option value="_2">Admin</option>
        <option value="_3">Dragon</option>
    </select>
 
    <div class="oneView" id="oneView">
        <span>입력방법1 : </span><input type="text" readonly /> 링크
    </div>
    <div class="twoView" id="twoView" style="display:none;">
        <span>입력방법2 : </span><input type="text" />
    </div>
    <div class="threeView" id="threeView" style="display:none;">
        <span>입력방법3 : </span><input type="text" value="" disabled />
    </div>
</div>
 
<script src="~/Scripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#stbType').on('change', function () {
            if ($(this).val() == '_0') {
                $('#oneView').css('display', 'block');
                $('#twoView').css('display', 'none');
                $('#threeView').css('display', 'none');
            } else if ($(this).val() == '_1') {
                $('#oneView').css('display', 'none');
                $('#twoView').css('display', 'block');
                $('#threeView').css('display', 'none');
            } else {
                $('#oneView').css('display', 'none');
                $('#twoView').css('display', 'none');
                $('#threeView').css('display', 'block');
            }
        });
    });
</script>

</body>
</html>