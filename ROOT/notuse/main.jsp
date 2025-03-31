<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/normal_style.css?after" rel="stylesheet" type="text/css">
    <link href="css/header.css?after" rel="stylesheet" type="text/css">
    <link href="css/footer.css?after" rel="stylesheet" type="text/css">
    <link href="/css/popup.css?after" rel="stylesheet" type="text/css">
    <link href="/css/menu.css?after" rel="stylesheet" type="text/css">
    <link href="/css/sidebar.css?after" rel="stylesheet" type="text/css">
    <title>IT</title>
    <!--구글웹폰트 Link-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <!--구글웹폰트 Link-->
    <!--이미지폰트 Link-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/6491454879.js" crossorigin="anonymous"></script>
    <!--이미지폰트 Link-->



    <!--메인 화면 타이핑 효과-->
    <!--Google pont-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&display=swap" rel="stylesheet">
    <!--js-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/typed.js"></script>

    <style>
        table{
            top: 60px;
        }
        .container > .sidebar > .side_top > table{
            width: 100%;
            background-color: rgb(65,65,65);
        }
        .text_box{
            width:20%;
            height: 40px;
            text-align: right;
        }
        .table_box{
            width:55%;
            height: 40px;
            text-align: left;
            padding-left: 3%;
            padding-right: 3%;
        }
        input:focus{
            background-color: aquamarine;
        }
        .container > .sidebar > .side_top > table > tr td{
            height: 100%;
            box-sizing: border-box;
        }
        .container > .sidebar > .side_top > table > tr  td  a{
            color: aquamarine;
        }
        button{
            width: 80%;
            height: 100%;
            border: 2px solid black;
        }
        button:hover{
            background-color: aquamarine;
        }
        .table_input{
            width:100%;
            height:100%;
            border: 2px solid black;
        }
        .table_bot{
            width: 50%;
        }
    </style>







</head>
<body>
  <!-- header -->
  <input type="checkbox" id="menuicon">
  <header>
    <div class='menu'>
      <label for="menuicon" class="menubtn">
        <span></span>
        <span></span>
        <span></span>
      </label>  
    </div>
  </header>
  <!-- header -->
  <div class="gradient-border"></div>


  <!--sidebar-->
  <div class="container">
    <div class="sidebar">
        <div class="top_fix"></div>
        <div class="side_top">
            <table>
                <tr>
                    <td colspan="3">
                        로그인
                    </td>
                </tr>
                <tr>
                    <td class="text_box">
                        ID:
                    </td>
                    <td class="table_box">
                        <input type="text" class="table_input">
                    </td>
                    <td rowspan="2" style="height: 76px; text-align: left;">
                        <button>로그인</button>
                    </td>
                </tr>
                <tr>
                    <td class="text_box">
                        PW:
                    </td>
                    <td class="table_box">
                        <input type="password" class="table_input">
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="table_bot" style="border-right: 1px solid black;">
                        <a href="/Menu/register.jsp">회원가입</a>
                    </td>
                    <td class="table_bot">
                        <a href="#">아이디/비번찾기</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="side_mid">
            <hr>
                <a href="/Menu/RoadMap">로드맵</a><br>
                <a href="/Menu/Certificate">자격증</a><br>
                <a href="/Menu/Certificate">소개</a><br>
        </div>
        <div class="side_bot">
            <hr>
            바텀
        </div>
        <span class="area_desc">sidebar영역</span>
    </div>
  </div>
  <!--sidebar-->


  <!--main home image-->

  <section class="main_home" id="home">
    <div class="main_home_s_i">
        <div class="row align-items-center">
            <div class="main_home_string">
                <div class="home_string">
                    <div class="home-text">
                      <h1>IT가 궁금해?</h1>
                      <h2># <span class="typed">|</span></h2>
                    </div>
                </div>
            </div>

            <div class="main_home_img">
                <div class="home_image">
                    <img src="image/main_img1.png">
                </div>
            </div>
        </div>
    </div>
  </section>



  <!-- side  -->
    <a id="top_btn" href="#" class="content_top">
      <span class="blind">TOP</span>
    </a>
  <!-- Side -->

  <div class="gradient-border"></div>
  <!-- Footer -->
  <footer class="Foot_main">
      <div class="user_link">
          <div class="user_box_1">
              <div class="name">
                  <p>Seong Ho Jun</p>
              </div>
              <div class="call">
                  <p>010-8262-8239</p>
              </div>
              <div class="box_1">
                  <a href="https://github.com/ragomm">
                      <img src="image/Git.png">
                  </a>
                  <a href="https://www.instagram.com/sh_ragom_j/">
                      <img src="image/Insta.png">
                  </a>
                  <a href="https://www.facebook.com/profile.php?id=100009367556652">
                      <img src="image/Face.png">
                  </a>
              </div>
          </div>
          <div class="user_box_2">
              <div class="name">
                  <p>Yoon Jeong Hyeon</p>
              </div>
              <div class="call">
                  <p>010-7757-6466</p>
              </div>
              <div class="box_2">
                  <a href="https://github.com/YJHyeon">
                      <img src="image/Git.png">
                  </a>
                  <a href="https://www.instagram.com/iam_jhyeon/">
                      <img src="image/Insta.png">
                  </a>
                  <a href="https://www.facebook.com/profile.php?id=100006617160538">
                      <img src="image/Face.png">
                  </a>
              </div>
          </div>
      </div>
  </footer>
  <!-- Footer -->
</body>


<!--이거 잠시 대기  나중에 옮길 예정-->
<script>
  $(".typed").typed({
      strings: ["JAVA", "Python", "프로그래머", "코딩 공부", "로드맵"],
      typeSpeed: 100,
      loop: true,
  });
</script>
</html>