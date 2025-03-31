
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="xml.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>


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

    if(ucert != null && ucert.equals("no")){
            response.sendRedirect("/menu/cert/emailcert.jsp");
        }
    

    String region = (String) request.getParameter("region");
    String startdate = (String) request.getParameter("startdate");
    String enddate = (String) request.getParameter("enddate");
    String keyword = (String) request.getParameter("keyword");
    
    if(region == null){
        region = "";
    }
    if(startdate != null && enddate != null 
            && !startdate.equals("") && !enddate.equals("")){
        LocalDate date = LocalDate.parse(startdate);
        startdate = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        LocalDate date2 = LocalDate.parse(enddate);
        enddate = date2.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    }   
    if(keyword == null){
        keyword = "";
    }

    //out.println(region);
    //out.println(startdate);
    //out.println(enddate);
    //out.println(keyword);
    
    EmpEvent empeventxml = new EmpEvent();
    empeventxml.display=20;
    ArrayList<EmpEventObject> empevents = empeventxml.getEmpEvent(startdate, enddate, keyword, region);

    /* 그냥 for문에서 정상작동 그러나 캘린더 내에서 서울지역 출력안됨, 출력갯수 23개 초과 못함(지역마다 또다름)
    for(EmpEventObject empevent : empevents) { 
          
            out.println(empevent.getEventNm());
            out.println(empevent.getStartDt());
     }
     */
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
    <link href="/css/Schedule.css?after" rel="stylesheet" type="text/css">
        <!-- 캘린더-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fullcalendar CDN -->
        <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
        <!-- fullcalendar 언어 CDN -->
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
        <!-- 캘린더-->
        <!--구글웹폰트 Link-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <!--구글웹폰트 Link-->
     
     

        <style>
        #wrap{
            height:1100px;
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

<!--s body-->
<div id="wrap">
    <div class="ccalendar" id='calendar-container'>
        <div id='calendar'></div>
    </div>
</div>
  <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '800px', // calendar 높이 설정
        width: '1500px',
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        initialDate: new Date(), // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: false, // 수정 가능?
        selectable: false, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('행사 추가:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        // 이벤트 
        
        events: [
          <% for(EmpEventObject empevent : empevents) { %>
          {
            title: "<%=empevent.getEventNm()%>",
            start: "<%=empevent.getStartDt()%>",
            url: ("dd.jsp?region=" + encodeURIComponent("<%=empevent.getAreaCd()%>") +
                 "&eventNo=" + encodeURIComponent("<%=empevent.getEventNo()%>"))
          },
          <% } %>
          {
            title: "*오늘*",
            start: new Date()
          },
           
        ]
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
</script>
<!--e body-->
<%}%>
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
</html>