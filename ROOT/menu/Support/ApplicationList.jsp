<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
String keyword = "";
if(request.getParameter("keyword") != null) {
    keyword = (String) request.getParameter("keyword");
}

SupportDAO supportDAO = new SupportDAO();
int totalRowCount = supportDAO.selecttypeSupportCount(utype, uid);
int pagePerRow = 5; 
int beginRow = (currentPage-1)*pagePerRow;
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
    <link href="/css/board/Appboard.css?after" rel="stylesheet" type="text/css">

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
                                <li><a href="/menu/EditProfile/EditProfile.jsp"><%=uname%></a></li>
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
<!--s main-->
<div id="wrap">
    <section class="notice">
        <div class="page-title">
              <div class="container">
                  <h3>지원서 작성</h3>
                  <div>전체 게시글 수 : <%=totalRowCount%></div>
              </div>
          </div>
          <!-- board seach area -->
          <div id="board-search">
              <div class="container">
                  <div class="search-window">
                      <form action="">
                          <div class="search-wrap">
                              <label for="search" class="blind">공지사항 내용 검색</label>
                              <input id="search" type="search" name="keyword" placeholder="검색어를 입력해주세요." value="">
                              <button onclick="location.href='<%=request.getContextPath()%>/menu/Support/ApplicationList.jsp?currentPage=<%=currentPage%>&keyword=<%=keyword%>'" class="btn btn-dark">검색</button>
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
                          <th scope="col" class="th-num">지원서 번호</th>
                          <th scope="col" class="th-title">제목</th>
                          <% if(utype.equals("person")){ %>
                          <th scope="col" class="th-person">받은 사람</th>
                          <%} else{%>
                            <th scope="col" class="th-person">보낸 사람</th>
                            <%}%>
                          <th scope="col" class="th-date">보낸 날짜</th>
                          <th scope="col" class="th-date">기업 열람 유무</th>
                      </tr>
                      </thead>
                        <tbody>
                            <%
                            List<SupportObject> list = supportDAO.selectSupportListPerPageSearch(beginRow, pagePerRow, keyword);
                            int start = (currentPage - 1) * pagePerRow + 1;
                            for(SupportObject b : list) {
                                
                             %>
                             <tr>
                                <% if(uid.equals(b.getSendid())&& utype.equals("person")){ %>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=start++%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getTitle()%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getReceiveid()%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getDate()%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getOpencheck()%></a></td>
                                <% } %>

                                <% if(uid.equals(b.getReceiveid())&& utype.equals("business")){ %>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=start++%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getTitle()%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getSendid()%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getDate()%></a></td>
                                <td><a href="<%=request.getContextPath()%>/menu/Support/ApplicationDetailList.jsp?SupportNo=<%=b.getNo()%>" ><%=b.getOpencheck()%></a></td>
                                <% } %>
                            </tr>
                            <%        
                            }   
                            %>
                        </tbody>
                  </table>
                  <%
                  int lastPage = totalRowCount/pagePerRow;
                  if(totalRowCount%pagePerRow != 0) {
                      lastPage++;
                  }
                  %>
                  <div style="width: 100%; margin: 0 auto; text-align: center;">
                    <%
                            if(currentPage>1) {
                    %>
                                <button class="reviewbutton1">
                                    <a class="buttona" href="<%=request.getContextPath()%>/menu/Support/ApplicationList.jsp?currentPage=<%=currentPage-1%>&keyword=<%=keyword%>"><</a>
                                </button>
                                <%=currentPage%> 
                    <%
                            
                            }
                            if(currentPage < lastPage) {
                    %>
                                <button class="reviewbutton1">
                                    <a class="buttona" href="<%=request.getContextPath()%>/menu/Support/ApplicationList.jsp?currentPage=<%=currentPage+1%>&keyword=<%=keyword%>">></a>
                                </button>
                    <%
                            }
                    %>
                    </div>
                  <div style="margin: 0 auto; text-align: center;">
                  <% if(utype.equals("person")) {%>
                    <button class="reviewbutton"><a style="color: white;" href="<%=request.getContextPath()%>/menu/Support/ApplicationWrite.jsp">작성</a></button>
                    <% } %>
                    <div>
                        
                    </div>
                  </div>

              </div>
          </div>
      </section>
    </div>
<!--e main-->
<%}%>
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
</html>