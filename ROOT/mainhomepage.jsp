
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


    
<%     
        String uid = (String) session.getAttribute("sid");
        session.setAttribute("sid",uid);
        String uname = (String) session.getAttribute("sname");
        session.setAttribute("sname",uname);
        String ucert = (String) session.getAttribute("scert");
        session.setAttribute("scert",ucert);
        String utype = (String) session.getAttribute("stype");
        session.setAttribute("stype",utype);
        if(uid == null || uname == null || ucert == null || utype == null ){ //세션 만료시 로그인 화면 이동
        response.sendRedirect(request.getContextPath()+"/menu/login/mainlogin.jsp");
        }
        else{
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/css/menu1.css?after" rel="stylesheet" type="text/css">
    <link href="/css/footer.css?after" rel="stylesheet" type="text/css">

        <!--구글웹폰트 Link-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
        <!--구글웹폰트 Link-->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="/js/typed.js"></script>
    <style>
        body{
            background: gray;
        }
        #wrap{
            background-color: gray;
            height:120%;
        }

    </style>
</head>
<body>
<!--s header -->
    <header>
        <div id="h_wrap">
            <div class="menu" >
                <div class="login">
                        <div class="slogin">
                                <% if (uid == null){ // 로그인 안되어 있으므로 로그인과 회원가입이 보임
                            %>
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
                                <li><a href="/menu/login/mainlogin.jsp">로그인</a></li>
                                <li><a href="/menu/register/input.jsp">회원가입</a></li>
                            <%  }
                                else{ // 로그인 되어 있으므로 로그아웃 화면이 보임
                            %>
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
                                <li><a class="btn-open-popup"><%=uname%></a></li>
                                <li><a href="/controller/logout.jsp">로그아웃</a></li>
                            <%}
                            %>
                            </div>
                        <a href="/mainhomepage.jsp"><img style="width:110px; height:100px;" src="/image/logo.png"></a>
                </div>
                        <nav class="clearfix">
                        <ul class="clearfix">
                        <% if(utype.equals("business")){ %>
                            <li><a href="/menu/Guin/Job-Opening.jsp">구인</a></li> <!--""<-여기 부분에 URL 작성하면 됨-->
                            <li><a href="/menu/Review/Review.jsp">기업 리뷰</a></li>
                            <li><a href="/menu/Schedule/ScheduleSearch.jsp">행사 일정</a></li>
                            <li><a href="/menu/Support/ApplicationList.jsp">지원서 목록</a></li>
                            <li><a href="/menu/Resume/ResumeView.jsp">이력서 목록</a></li>
                            
                        <% } else if(utype.equals("person")){ %>
                            <li><a href="/menu/Guin/Job-Opening.jsp">구인</a></li> <!--""<-여기 부분에 URL 작성하면 됨-->
                            <li><a href="/menu/Review/Review.jsp">기업 리뷰</a></li>
                            <li><a href="/menu/Schedule/ScheduleSearch.jsp">행사 일정</a></li>
                            <li><a href="/menu/Support/ApplicationList.jsp">내 지원서 </a></li>
                            <li><a href="/menu/Resume/Resume.jsp">이력서 작성</a></li>
                        <% }  %>
                        </ul>
                        <label for="menuicon" class="menubtn">
                            <span style="background-color:gray"></span>
                            <span style="background-color:gray"></span>
                            <span style="background-color:gray"></span>
                        </label>
                        <a id="pull" href="#"></a>
                        </nav>
            </div>
                    <input type="checkbox" id="menuicon">
                    <div class="container">
                        <div class="sidebar">
                            <span class="area_desc">sidebar영역</span>
                        </div>
                    </div> 
                    <div class="gradient-border">
                    </div>
    </div>
    </header>
<!--e header -->

<script type="text/javascript">

    $(document).ready(function () {
        $(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
        
        setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
    });
    
    //이전 슬라이드
    function prevSlide() {
        $(".mySlideDiv").hide(); //모든 div 숨김
        var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
        var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
        
        //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
        $(".mySlideDiv").each(function(index,item){ 
            if($(this).hasClass("active")) {
                currentIndex = index;
            }
            
        });
        
        //새롭게 나타낼 div의 index
        var newIndex = 0;
        
        if(currentIndex <= 0) {
            //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
            newIndex = allSlide.length-1;
        } else {
            //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
            newIndex = currentIndex-1;
        }
    
        //모든 div에서 active 클래스 제거
        $(".mySlideDiv").removeClass("active");
        
        //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
        $(".mySlideDiv").eq(newIndex).addClass("active");
        $(".mySlideDiv").eq(newIndex).show();
    
    }
    
    //다음 슬라이드
    function nextSlide() {
        $(".mySlideDiv").hide();
        var allSlide = $(".mySlideDiv");
        var currentIndex = 0;
        
        $(".mySlideDiv").each(function(index,item){
            if($(this).hasClass("active")) {
                currentIndex = index;
            }
            
        });
        
        var newIndex = 0;
        
        if(currentIndex >= allSlide.length-1) {
            //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
            newIndex = 0;
        } else {
            //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
            newIndex = currentIndex+1;
        }
    
        $(".mySlideDiv").removeClass("active");
        $(".mySlideDiv").eq(newIndex).addClass("active");
        $(".mySlideDiv").eq(newIndex).show();
        
    }
    
    </script>
<!--s body-->
<div id="wrap">
  <section class="main_home" id="home">
    <div class="main_home_s_i">
        <div class="row align-items-center">
            <div class="main_home_string">
                <div class="home_string">
                    <div class="home-text">
                      <h1>National Job</h1>
                      <h2># <span class="typed">구인</span></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </section>
    <div class="main_home_img">
        <div class="home_image">
            <div class="slideshow-container">

                <div class="mySlideDiv fade active">
                   <img style="width:70%; height:1000px;" src="/image/main_img1.png"> 
                </div>
                       
                <div class="mySlideDiv fade">
                    <img style="width:70%; height:1000px;;" src="/image/main_img2.png"> 
                </div>
           
                <a class="prev" onclick="prevSlide()">&#10094;</a>
                <a class="next" onclick="nextSlide()">&#10095;</a>
                       
           </div>
        </div>
    </div>
</div>
<%}%>
<!--e body-->
<div class="modal">
    <div class="modal_body">
        <form action="/controller/EditProfile.jsp" method="post" class="border rounded-3 p-4">
            <div class="Edit_Middle">
                <div class="Edit_Middle2">
                    <div class="Edit_1">
                        <span style="font-size: 2.4em;color:#212121;">개인정보변경</span><br>
                    </div>
                    <div class="Edit_2">
                        <span style="color: black;">고객님의 개인정보 보호를 위해 본인확인을 진행합니다.</span><br>
                        <span style="color: black;"><strong>JSL회원 비밀번호</strong>를 입력해주세요.</span>
                    </div>
                    <div class="Edit_3">
                            <span style="font-size:1.5em;">비밀번호 확인  </span>
                            <input type="password" class="Edit_Box" name="pw" id="pw">
                            <button type="submit" class="Edit_Box2">확인</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--s footer-->
<footer class="Foot_main">
    <div class="g-border">
    </div>
    <div class="user_link">
        <div class="user_box_1">
            <div class="name">
                <p>Kang Jun Hee</p>
            </div>
            <div class="call">
                <p>010-5679-9010</p>
            </div>
            <div class="box_1">
                <a href="https://github.com/ragomm">
                    <img src="/image/Git.png">
                </a>
                <a href="https://www.instagram.com/sh_ragom_j/">
                    <img src="/image/Insta.png">
                </a>
                <a href="https://www.facebook.com/profile.php?id=100009367556652">
                    <img src="/image/Face.png">
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
                    <img src="/image/Git.png">
                </a>
                <a href="https://www.instagram.com/iam_jhyeon/">
                    <img src="/image/Insta.png">
                </a>
                <a href="https://www.facebook.com/profile.php?id=100006617160538">
                    <img src="/image/Face.png">
                </a>
            </div>
        </div>
        <div class="user_box_3">
            <div class="name">
                <p>AHN Yeong Seok</p>
            </div>
            <div class="call">
                <p>010-2563-8995</p>
            </div>
            <div class="box_3">
                <a href="https://github.com/ansb19">
                    <img src="/image/Git.png">
                </a>
                <a href="https://www.instagram.com/youngseok_ahn/">
                    <img src="/image/Insta.png">
                </a>
                <a href="https://www.facebook.com/profile.php?id=100005615343484">
                    <img src="/image/Face.png">
                </a>
            </div>
        </div>
    </div>
</footer>
<!--e footer-->
</body>
<script>
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
      modal.classList.toggle('show');

      if (modal.classList.contains('show')) {
        body.style.overflow = 'hidden';
      }
    });

    modal.addEventListener('click', (event) => {
      if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
          body.style.overflow = 'auto';
        }
      }
    });
  </script>
  <script>
    $(".typed").typed({
        strings: ["구직", "채용", "진로", "일자리", "취업"],
        typeSpeed: 100,
        loop: true,
    });
</script>
</html>