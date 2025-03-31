<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/css/login.css?after" rel="stylesheet" type="text/css">
    <style>
      body{
       background-color:gray;
      } 
   </style>
</head>

<body>
  <!--header-->
  <header>
    <!--구글 번역 API-->                   
    <li><div id="google_translate_element" class="hd_lang" style="float: right;position: relative;"></div></li>
      <script>
        function googleTranslateElementInit() {
        new google.translate.TranslateElement({
        pageLanguage: 'ko',
        includedLanguages: 'af,sq,am,ar,hy,as,ay,az,bm,eu,be,bn,bho,bs,bg,ca,ceb,zh-CN,zh-TW,co,hr,cs,da,dv,doi,nl,en,eo,et,ee,fil,fi,fr,fy,gl,ka,de,el,gn,gu,ht,ha,haw,he,hi,hmn,hu,is,ig,ilo,id,ga,it,ja,jv,kn,kk,km,rw,gom,ko,kri,ku,ckb,ky,lo,la,lv,ln,lt,lg,lb,mk,mai,mg,ms,ml,mt,mi,mr,mni-Mtei,lus,mn,my,ne,no,ny,or,om,ps,fa,pl,pt,pa,qu,ro,ru,sm,sa,gd,nso,sr,st,sn,sd,si,sk,sl,so,es,su,sw,sv,tl,tg,ta,tt,te,th,ti,ts,tr,tk,ak,uk,ur,ug,uz,vi,cy,xh,yi,yo,zu',
        //layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
        }, 'google_translate_element');
        }
      </script>             
      <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>                                        
    <!--구글 번역 API-->
      <div class="loginhead">
        <a href="../../mainhomepage.jsp"><img style="width:100px; height:100px;" src="/image/logo.png"></a>
      </div>
  </header>
  <!--header-->
  <!--main-->
  <main>
    <div class="row">
      <div class="loginmid">
        <form action="/controller/login.jsp" method="post" class="border rounded-3 p-4">
          <!--id-->
            <table class="loginstyle">
              <tr>
              <td nowrap>
                <img class="loginimg" src="/image/loginid.png">
                <input type="text" class="logintext1" id="id" name="id" placeholder="아이디를 입력하세요">
              </td>
              </tr>
            <!--pw-->
              <tr>
              <td nowrap>
                <img class="loginimg" src="/image/loginpw.png">
                <input type="password" class="logintext1" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
              </td>
              </tr>
            </table>
            <!--개인/기업-->
          <div class="loginstyle1">
            <select id="type" name="type" class="selectbox">
              <option value="person" label="개인"></option>
              <option value="business" label="기업"></option>
            </select>          
          </div>
          <!--네이버-->    
          <div>
            <div id="naverIdLogin" style="display: none;"></div>
            <div id="naverLogin" class="naver">
              <img class="loginstyle2" img alt="" src="/image/btnG.png">
            </div>
          </div>
          <!--카카오-->
          <div>
            <div class="kakao" onclick="kakaoLogin();">
              <img class="loginstyle2" alt="" src="/image/kakao_login_medium_narrow.png">
            </div>
          </div>
          <!--버튼-->
          <div class="d-grid gap-2">
            <button class="loginstyle4" type="submit" >로그인</button>
            <button class="loginstyle1" type="button" onclick=move()>회원가입</button>
            <button class="loginstyle3" type="button" onclick="location.href='../../mainhomepage.jsp'">돌아가기</button>
          </div>
        </form>
      </div>
    </div>
  </main>
  <!--main-->
  <!--footer-->
  <footer>

  </footer>
  <!--footer-->
</body>

  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <script>
    var naverLogin = new naver.LoginWithNaverId({
      clientId: "QV4bEOJAokbdZPqZA6gN", 
      callbackUrl: "http://34.64.249.77/menu/login/naverlogin.jsp", // 콜백할 페이지
      isPopup: false,
      loginButton: {color: "green",type: 3, height: 50}
    });	
    naverLogin.init();
    
          // 버튼을 위설정에서 만들지않고 이미지를 가지고왔을땐 아래 코드 추가
    $(document).on("click", "#naverLogin", function(){
      var btnNaverLogin = document.getElementById("naverIdLogin").firstChild;
      btnNaverLogin.click();
    });
  </script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
    // 카카오로그인
    Kakao.init('4406b93958af114fb39d6880741d9f11');
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    function kakaoLogin() {
      Kakao.Auth.login({
        success: function (response) {
          Kakao.API.request({
            url: '/v2/user/me',
            success: function (response) {
              // 유저 아이디, 이메일 주소, 이름을 Session에 저장
              sessionStorage.setItem("user_info", response.id);
              sessionStorage.setItem("kakao_nickname", response.kakao_account.profile.nickname);
              sessionStorage.setItem("kakao_birthday", response.kakao_account.birthday);
              sessionStorage.setItem("kakao_email", response.kakao_account.email);
              sessionStorage.setItem("kakao_gender", response.kakao_account.gender);
              
              // 네이버 로그인과 카카오 로그인을 구분하기 위해 별도의 세션을 저장
              sessionStorage.setItem("kinds","kakao"); 
              
              console.log(response);
            },
            fail: function (error) {
              console.log(error)
            },
          })
        },
        fail: function (error) {
          console.log(error)
        },
      })
    }
  </script>
  <script>
  function move(){
    location.href ="/menu/register/input.jsp"
  }
  </script>
</html>