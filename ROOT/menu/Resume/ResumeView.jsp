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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/css/menu1.css?after" rel="stylesheet" type="text/css">
    <link href="/css/footer.css?after" rel="stylesheet" type="text/css">
    <link href="/css/board/Resume.css" rel="stylesheet" type="text/css">

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
        <Style>
            .wrap2{
                height:700px;
            }
        </Style>
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
<%
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
} else {
    int no = Integer.parseInt(request.getParameter("no"));
    ResumeDAO resumeDAO = new ResumeDAO();
    ResumeObject resumeObject = resumeDAO.selectBoardByKey(no);
%>
<!--s body-->
<div id="wrap">
        <div class="wrap2">
            <div class="resumet">
                <h1> 이 력 서 </h1>
                <div>번호 : <%=resumeObject.getNo()%></div>
                <table class="resumet_1" align="center"  border="1" cellspacing="0">
                    <tr align="center"  bgcolor="#fff">
                        <td  style="width:150px; height:200px; vertical-align:middle;" rowspan="6" >
                            
                            <img src="/files/<%=resumeObject.getFileservername()%>" width=150 height=200 />
                            <script>
                                function readURL(input) {
                                if (input.files && input.files[0]) {
                                    var reader = new FileReader();
                                    reader.onload = function(e) {
                                    document.getElementById('preview').src = e.target.result;
                                    };
                                    reader.readAsDataURL(input.files[0]);
                                } else {
                                    document.getElementById('preview').src = "";
                                }
                                }
                            </script>
                        </td>

                    <!--성명 한문-->
                        <td  bgcolor="#e3fcff">성 명</td>
                        <td style="width:27%;" colspan="1"><%=resumeObject.getName()%></td>
                        <td  bgcolor="#e3fcff">영문 성명</td>
                        <td style="width:27%;" colspan="5"><%=resumeObject.getEname()%></td>
                    </tr>
                    <!--주민등록번호-->
                    <tr align="center"   bgcolor="#ffffff">
                        <td rowspan="1" bgcolor="#e3fcff">주민등록번호</td>
                        <td style="width:27%;" colspan="5"><%=resumeObject.getRno()%></td>
                    </tr>

                    <!--이메일-->
                    <tr align="center"  bgcolor="#ffffff">
                        <td bgcolor="#e3fcff">E-mail</td>
                        <td colspan="5"><%=resumeObject.getEmail()%></td>
                    </tr>
                    <!--전화번호, 휴대폰-->
                    <tr align="center"  bgcolor="#ffffff">
                        <td bgcolor="#e3fcff">전화번호</td>
                        <td colspan="1"><%=resumeObject.getPhone()%></td>
                        <td bgcolor="#e3fcff">나이</td>
                        <td colspan="4"><%=resumeObject.getAge()%></td>
                    </tr>

                    <!--우편번호, 비상연락처-->
                    <tr align="center"  bgcolor="#ffffff">
                        <td bgcolor="#e3fcff">성별</td>
                        <td colspan="1"><%=resumeObject.getSex()%></td>	
                        <td bgcolor="#e3fcff">주소</td>
                        <td colspan="5"><%=resumeObject.getAd()%></td>
                    </tr>
                    <!--주소-->
                    <tr align="center"  bgcolor="#ffffff">
                        <td bgcolor="#e3fcff">학교명</td>
                        <td colspan="1"><%=resumeObject.getSname()%></td>
                        <td bgcolor="#e3fcff">재학기간</td>
                        <td colspan="2"><%=resumeObject.getEperiod()%></td>
                    </tr>
                    <tr style="height:37.5px;" align="center"  bgcolor="#ffffff">
                        <td colspan="2"bgcolor="#e3fcff">전공</td>
                        <td colspan="1"><%=resumeObject.getMajor()%></td>	
                        <td bgcolor="#e3fcff">학점</td>
                        <td colspan="2"><%=resumeObject.getCredit()%></td>
                    </tr>
                    <tr style="height:37.5px;" align="center"  bgcolor="#ffffff">
                        <td colspan="2"bgcolor="#e3fcff">졸업여부</td>
                        <td colspan="1"><%=resumeObject.getGraudate()%></td>	
                        <td bgcolor="#e3fcff">기간</td>
                        <td colspan="2"><%=resumeObject.getAperiod()%></td>
                    </tr>
                    <tr style="height:37.5px;" align="center"  bgcolor="#ffffff">
                        <td colspan="2"bgcolor="#e3fcff">활동내용</td>
                        <td colspan="1"><%=resumeObject.getContent()%></td>	
                        <td bgcolor="#e3fcff">활동구분</td>
                        <td colspan="2"><%=resumeObject.getActc()%></td>
                    </tr>
                    <tr style="height:37.5px;" align="center"  bgcolor="#ffffff">
                        <td colspan="2"bgcolor="#e3fcff">기관 및 장소</td>
                        <td colspan="1"><%=resumeObject.getActp()%></td>	
                        <td colspan="1"bgcolor="#e3fcff">자격증</td>
                        <td colspan="1"><%=resumeObject.getCname()%></td>	
                    </tr>
                    <tr style="height:37.5px;" align="center"  bgcolor="#ffffff">
                        <td bgcolor="#e3fcff">취득년월일</td>
                        <td colspan="2"><%=resumeObject.getCdate()%></td>
                        <td bgcolor="#e3fcff">시행처</td>
                        <td colspan="2"><%=resumeObject.getCplace()%></td>
                    </tr>
                    <tr style="height:37.5px;" align="center"  bgcolor="#ffffff">
                        <td colspan="2"bgcolor="#e3fcff">근무기간</td>
                        <td colspan="1"><%=resumeObject.getCperiod()%></td>	
                        <td bgcolor="#e3fcff">근무회사</td>
                        <td colspan="2"><%=resumeObject.getCompany()%></td>
                    </tr>
                    <tr style="height:37.5px;" align="center"  bgcolor="#ffffff">
                        <td colspan="2" bgcolor="#e3fcff">부서</td>
                        <td colspan="1"><%=resumeObject.getDepartment()%></td>	
                        <td bgcolor="#e3fcff">직위</td>
                        <td colspan="1"><%=resumeObject.getPosition()%></td>
                    </tr>
                    <tr style="height:37.5px;">
                        <td colspan="2" bgcolor="#e3fcff">담당직무</td>
                        <td colspan="1"><%=resumeObject.getDuty()%></td>
                        <td bgcolor="#e3fcff">작성일</td>
                        <td colspan="1"><%=resumeObject.getDate()%></td>
                    </tr>
                </table>
            </div>
        </div>
        <br>

</div>

<%}%>
<!--e body-->

    

<%
}
%>
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