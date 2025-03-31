<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
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
<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
ResumeDAO resumeDAO = new ResumeDAO();
int totalRowCount = resumeDAO.selectTotalBoardCount();
int pagePerRow = 10; 
int beginRow = (currentPage-1)*pagePerRow;
List<ResumeObject> list = resumeDAO.selectBoardListPerPage(beginRow, pagePerRow);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="/css/menu1.css?after" rel="stylesheet" type="text/css">
<link href="/css/footer.css?after" rel="stylesheet" type="text/css">
<link href="/css/board/Reviewboard.css" rel="stylesheet" type="text/css">

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
<title>리뷰</title>
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
                            <li><a href="/menu/Gujik/JobSearch.jsp">구직</a></li>
                            <li><a href="/menu/Review/Review.jsp">기업 리뷰</a></li>
                            <li><a href="/menu/Schedule/ScheduleSearch.jsp">행사 일정</a></li>
                            <li><a href="/menu/Support/ApplicationList.jsp">지원서 목록</a></li>
                            <li><a href="/menu/Resume/Resume.jsp">이력서 목록</a></li>
                            
                        <% } else if(utype.equals("person")){ %>
                            <li><a href="/menu/Guin/Job-Opening.jsp">구인</a></li> <!--""<-여기 부분에 URL 작성하면 됨-->
                            <li><a href="/menu/Gujik/JobSearch.jsp">구직</a></li>
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
<!--e header-->
<div id="wrap">
<section class="notice">
    <div class="page-title">
          <div class="container">
              <h3>리뷰</h3>
              <div>전체게시글 수 : <%=totalRowCount%>/<%=list.size()%></div>
              <div>현재 페이지 수 : <%=currentPage%></div>
          </div>
      </div>
      <!-- board seach area -->
      <div id="board-search">
          <div class="container">
              <div class="search-window">
                  <form action="">
                      <div class="search-wrap">
                          <label for="search" class="blind">공지사항 내용 검색</label>
                          <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                          <button type="submit" class="btn btn-dark">검색</button>
                      </div>
                  </form>
              </div>
          </div>
      </div>
     
    <!-- board list area -->
      <div id="board-list">
          <div class="container">
              <table class="board-table">
                  <thead>
                  <tr>
                      <th scope="col" class="th-num">번호</th>
                      <th scope="col">이름</th>
                      <th scope="col" class="th-title">나이</th>
                      <th scope="col">성별</th>
                      <th scope="col">전공</th>
                      <th scope="col" class="th-date">작성일</th>
                  </tr>
                  </thead>
                  <tbody>
                    <tbody>
                        <%
                            for(ResumeObject b : list) {
                        %>
                                        <tr>
                                            <td><a href="<%=request.getContextPath()%>/menu/Resume/ResumeView.jsp?no=<%=b.getNo()%>"><%=b.getNo()%></a></td>
                                            <td><a href="<%=request.getContextPath()%>/menu/Resume/ResumeView.jsp?no=<%=b.getNo()%>"><%=b.getName()%></a></td>
                                            <td><a href="<%=request.getContextPath()%>/menu/Resume/ResumeView.jsp?no=<%=b.getNo()%>"><%=b.getAge()%></a></td>
                                            <td><a href="<%=request.getContextPath()%>/menu/Resume/ResumeView.jsp?no=<%=b.getNo()%>"><%=b.getSex()%></a></td>
                                            <td><a href="<%=request.getContextPath()%>/menu/Resume/ResumeView.jsp?no=<%=b.getNo()%>"><%=b.getMajor()%></a></td>
                                            <td><a href="<%=request.getContextPath()%>/menu/Resume/ResumeView.jsp?no=<%=b.getNo()%>"><%=b.getDate()%></a></td>
                                        </tr>
                        <%        
                                    }
                        %>
                        </tbody>
                  </tbody>
              </table>
              <%
              int lastPage = totalRowCount/pagePerRow;
              if(totalRowCount%pagePerRow != 0) {
                  lastPage++;
              }
          %>
              <div style="margin: 0 auto; text-align: center;">
          <%
                  if(currentPage>1) {
          %>
                      <button class="reviewbutton1">
                          <a class="buttona" href="<%=request.getContextPath()%>/menu/Review/Review.jsp?currentPage=<%=currentPage-1%>"><</a>
                      </button>
                      <%=currentPage%>
          <%
                  }
                  if(currentPage < lastPage) {
          %>
                      <button class="reviewbutton1">
                          <a class="buttona" href="<%=request.getContextPath()%>/menu/Review/Review.jsp?currentPage=<%=currentPage+1%>">></a>
                      </button>
          <%
                  }
          %>
              </div>
          </div>
      </div>
  </section>
</div>
<%}%>
<!--e main-->
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