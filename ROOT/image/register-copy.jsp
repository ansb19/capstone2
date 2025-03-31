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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

    <title>Document</title>




    <Style>
        button{
            width: 20%;
            height: 60px;
            background: rgb(74, 199, 74);
            border: 1px solid rgb(15, 137, 15);
            color: black;
        }
        button:hover{
            background-color: orange;
        }
    </Style>
    <style>
        .msg_box {
            position: relative;
        }

        .msg_box.out {
            padding: 1px;
            margin-top: 1px;
        }

        *:not(input), ::before, ::after {
            border-width: 0;
            border-style: solid;
            border-color: #e5e7eb;
        }

        *, ::before, ::after {
            --tw-translate-x: 0;
            --tw-translate-y: 0;
            --tw-rotate: 0;
            --tw-skew-x: 0;
            --tw-skew-y: 0;
            --tw-scale-x: 1;
            --tw-scale-y: 1;
            --tw-pan-x: ;
            --tw-pan-y: ;
            --tw-pinch-zoom: ;
            --tw-scroll-snap-strictness: proximity;
            --tw-ordinal: ;
            --tw-slashed-zero: ;
            --tw-numeric-figure: ;
            --tw-numeric-spacing: ;
            --tw-numeric-fraction: ;
            --tw-ring-inset: ;
            --tw-ring-offset-width: 0px;
            --tw-ring-offset-color: #fff;
            --tw-ring-color: rgb(59 130 246 / 0.5);
            --tw-ring-offset-shadow: 0 0 #0000;
            --tw-ring-shadow: 0 0 #0000;
            --tw-shadow: 0 0 #0000;
            --tw-shadow-colored: 0 0 #0000;
            --tw-blur: ;
            --tw-brightness: ;
            --tw-contrast: ;
            --tw-grayscale: ;
            --tw-hue-rotate: ;
            --tw-invert: ;
            --tw-saturate: ;
            --tw-sepia: ;
            --tw-drop-shadow: ;
            --tw-backdrop-blur: ;
            --tw-backdrop-brightness: ;
            --tw-backdrop-contrast: ;
            --tw-backdrop-grayscale: ;
            --tw-backdrop-hue-rotate: ;
            --tw-backdrop-invert: ;
            --tw-backdrop-opacity: ;
            --tw-backdrop-saturate: ;
            --tw-backdrop-sepia: ;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        div {
            display: block;
        }

        .input-group .msg_box:first-child .form-control, 
        .msg_box.out:first-child:before {
            border-radius: 3px 3px 0 0;
        }

        .msg_box.out:before {
            content: '';
            display: block;
            width: 100%;
            height: 100%;
            border: 0px solid #F84A71;
            position: relative; /*나중에 수정해 줄게....*/
            left: 0;
            top: 0;
        }

        .input-group.input-group-login 
        .form-control:first-child {
            border-radius: 3px 3px 0 0;
        }

        .input-group.input-group-login .form-control {
            border-radius: 0;
            margin-bottom: -1px;
        }

        .input-group .form-control:first-child, 
        .input-group-addon:first-child, 
        .input-group-btn:first-child > .btn, 
        .input-group-btn:first-child > .btn-group > .btn, 
        .input-group-btn:first-child > .dropdown-toggle, 
        .input-group-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle), .input-group-btn:last-child > .btn-group:not(:last-child) > .btn {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .msg_box .form-control {
            float: none;
        }

        .input-group-addon, .input-group-btn, 
        .input-group .form-control {
            display: table-cell;
        }

        .input-group .form-control {
            position: relative;
            z-index: 2;
            float: left;
            width: 100%;
            margin-bottom: 0;
        }

        .form-control {
            -webkit-box-shadow: none;
            -webkit-appearance: none;
            box-shadow: none;
            border-radius: 3px;
            padding: 6px 18px;
            height: 50px;
            border-color: #D3D3D3;
            color: #3B4859;
        }

        input::placeholder {
            color: rgb(255, 255, 255);
        }

        .form-control {
            font-size: 14px;
            line-height: 1.42857143;
            background-color: #727272;
            background-image: none;
            border: 1px solid #ccc;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
        }

        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }

        input {
            line-height: normal;
        }

        button, input, optgroup, select, textarea {
            color: inherit;
            font: inherit;
            margin: 0;
        }

       .msg_box.out .alert_block {
            display: block;
        } 

        .msg_box .alert_block {
            display: none;
            color: #F84A71;
            font-size: 12px;
            padding: 0 0 5px 17px;
            position: relative;
            border: 2px solid #F84A71;
        }
    </style>
</head>
<body>

    <div class="register_wrap">
        <div class="top_sec">
            ITE
        </div>
        <div class="mid_sec">
            <div class="msg_box _msg_box" id="msg_box_id">
                <input type="text" class="form-control" placeholder="아이디" id="txt_id">
                <div class="alert_block _id_msg"></div>
            </div>
            <div class="msg_box _msg_box" id="msg_box_email">
                <input type="email" class="form-control" placeholder="이메일" id="txt_email">
                <div class="alert_block _email_msg"></div>
            </div>
            <div class="msg_box _msg_box" id="msg_box_pass">
                <input type="password" class="form-control" placeholder="비밀번호" id="txt_pass">
                <div class="alert_block _pass_msg"></div>
            </div>
            <div class="msg_box _msg_box" id="msg_box_phone">
                <input type="tel" class="form-control" placeholder="전화번호" id="txt_phone"> <!-- 새로운 회원 데이터, 페북 구글 로그인시 전화번호 가져오기도 해야함(기존 회원은 예외) -->
                <div class="alert_block _phone_msg"></div>
                <div class="error_box" id="error_box_phone"></div> 
            </div>
            <Br><div class="hr-reg">or</div>
        </div>
        <div class="bot_sec">
            카카오톡 간편로그인
            <input type="checkbox">이용약관
            <form action="/Menu/registerCheck.jsp" name="form" id="form" method="post">
                <button>회원가입</button>
            </form>
        </div>
        <Br><Br><Br>
    </div>
</body>
<script>

        //$("#txt_phone").on('keydown').check_callnum();

        $("#txt_id").on('focusout', function(){
            check_input_empty('id'); //이름 공백체크
        });

        $("#txt_email").on('focusout', function(){
            check_input_empty('email'); //이메일 공백체크
        });

        $("#txt_pass").on('focusout', function(){
            check_input_empty('pass'); //비밀번호 공백체크
        });

        $("#txt_phone").on('focusout', function(){
            check_input_empty('phone'); //핸드폰 공백체크
        });





        //각 항목 공백체크 함수
        function check_input_empty(type){
            var input = $("#txt_"+type).val();
            var msg = $("._"+type+"_msg");
            var msg_box = $("#msg_box_"+type);

            if(input === ''){
                switch(type){
                    case 'id':
                        msg.text('아이디을 입력해 주세요.');
                        break;
                    case 'email':
                        msg.text('이메일을 입력해 주세요.');
                        break;
                    case 'pass':
                        msg.text('비밀번호를 입력해 주세요.');
                        break;
                    case 'phone':
                        msg.text('전화번호를 입력해주세요.');
                        break;
                }
                msg_box.addClass('out');
            } else {
                if(type === 'pass' && input.length < 8) {
                    msg.text('비밀번호는 8자리 이상이여야 합니다.');
                    msg_box.addClass('out');
                }else{
                    msg.text('');
                    msg_box.removeClass('out');
                }

                email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;    
                if(type === 'email' && !email_regex.test(input)){
                    msg.text('이메일 양식이 맞지 않습니다.');
                    msg_box.addClass('out');
                }
                else{
                    msg.text('');
                    msg_box.removeClass('out');
                }
            }
        };
</script>

</html>




























