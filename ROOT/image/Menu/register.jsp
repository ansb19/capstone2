<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/normal_style.css?after" rel="stylesheet" type="text/css">
    <link href="/css/register.css?after" rel="stylesheet" type="text/css">
    <link href="/css/menu.css?after" rel="stylesheet" type="text/css">
    <title>Document</title>
    <Style>
        button{
            width: 45%;
            height: 60px;
            background: rgb(74, 199, 74);
            border: 1px solid rgb(15, 137, 15);
            color: white;
        }
        button:hover{
            background-color: orange;
        }
        input[type="checkbox"]{
            width:50%;
            text-align: right;
            float: left;
            height: 25px;
            display: inline;
        }
        textarea{
            overflow-y:scroll;
            resize:none;
            background-color: rgb(45, 45, 45);
            text-align: left;
            color: white;
        }
    </Style>
</head>
<body>
    <div class="register_wrap">
        <div class="top_sec">
            IS
        </div>
        <form action="/Menu/registerCheck.jsp" id="name" name="name" method="post">
        <div class="mid_sec">
            <div class="user_sec">
                <input style="width: 80%;" type="text" name="id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" required><Br>
            </div>
            <div class="user_sec">
                <input type="email" name="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'" required><br>
                <div class="error_box">필수 정보입니다.</div>
            </div>
            <div class="user_sec">
                <input type="password" name="pw" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required><br>
                <div class="error_box">필수 정보입니다.</div>
            </div>
            <div class="user_sec">
                <input type="tel" name="tel" placeholder="휴대폰 번호" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone number '"     required><br>
                <div class="error_box">필수 정보입니다.</div>
            </div>
        </div>
        <div class="bot_sec">
            <div class="hr-reg">or</div>
            <Center>
            <table>
                <tr>
                    <td>
                        <textarea readonly id="story" name="story" rows="10" cols="60">
                        It was a dark and stormy night...
                        </textarea>
                    </td>
                </tr>
                <tr style="border:solid 1px black">
                    <td style="text-align: left;">
                        이용약관<input type="checkbox" required>
                    </td>
                </tr>
            </table>
            </Center>
            <br><br>
        <button>회원가입</button>
        <Br><Br><Br>
        </div>
        </form>
        </div>

    </div>

</body>
</html>