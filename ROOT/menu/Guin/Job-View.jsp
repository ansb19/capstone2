<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="xml.*" %>
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

        String jobno = (String) request.getParameter("jobno");
        String no = (String) request.getParameter("no");
        String date = (String) request.getParameter("date");
        if(jobno == null || no == null) {
            response.sendRedirect(request.getContextPath()+"/menu/Guin/Job-Opening.jsp");
        }
        else{
            JobInfo jobxml = new JobInfo();
            JobInfoDtlObject jobdtl = jobxml.getJobInfoCorp(jobno);

        
        
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공지사항</title>
        <link href="/css/menu1.css?after" rel="stylesheet" type="text/css">
        <link href="/css/footer.css?after" rel="stylesheet" type="text/css">
        <link href="/css/board/Job-View.css?after" rel="stylesheet" type="text/css">
    
            <!--구글웹폰트 Link-->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
            <!--구글웹폰트 Link-->
    <style>
        #wrap{
            height:1400px;
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
<!--s main-->
<div id ="wrap">
    <div class="main_wrap">
        <h1>구인 게시판</h1>
    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <div class="title">
                <%=jobdtl.getWantedTitle()%>
            </div>
            <div class="info">
                <dl>
                    <dt>번호</dt>
                    <dd><%=no%></dd>
                </dl>
                <dl>
                    <dt>글쓴이</dt>
                    <dd><%=jobdtl.getCorpNm()%></dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd><%=date%></dd>
                </dl>
                <dl>
                    <dt>마감일</dt>
                    <dd><%=jobdtl.getReceiptCloseDt()%></dd>
                </dl>
            </div>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">회사명</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getCorpNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">대표자명</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getReperNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">근로자수</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getTotPsncnt()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">자본금</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getCapitalAmt()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">연매출액</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getYrSalesAmt()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">업종</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getIndTpCdNm()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">주요사업내용</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getBusiCont()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">회사주소</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getCorpAddr()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">회사홈페이지</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getHomePg()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">회사규모</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getBusiSize()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">모집집종</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getJobsNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">구인제목</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getWantedTitle()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">관련직종</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getRelJobsNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">직무내용</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getJobCont()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">접수마감일</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getReceiptCloseDt()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">고용형태</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getRelJobsNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">모집인원</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getCollectPsncnt()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">임금조건</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getSalTpNm()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">경력조건</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEnterTpNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">학력</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEduNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">외국어</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getForLang()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">전공</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getMajor()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">자격면허</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getCertificate()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">병역특례채용희망</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getMltsvcExcHope()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">컴퓨터활용능력</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getCompAbl()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">우대조건</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getPfCond()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">기타우대조건</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEtcPfCond()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">전형방법</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getSelMthd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">접수방법</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getRcptMthd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">제출서류준비물</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getSubmitDoc()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">기타안내</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEtcHopeCont()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무예정지</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getWorkRegion()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">인근전철역</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getNearLine()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무시간/형태</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getWorkdayWorkhrCont()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">연금4대 보험</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"> <%=jobdtl.getFourIns()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">퇴직금</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getRetirepay()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">기타복리후생</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEtcWelfare()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">장애인편의시설</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getDisableCvntl()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">회사소개 첨부파일</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getAattachFileUrl()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">제출서류 양식첨부</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getCattachFileUrl()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">키워드</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getSrchKeywordNm()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">상세모집내용 URL</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getDtlRecrContUrl()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">직종</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getJobsCd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">최소학력</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getMinEdubgIcd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">최대학력</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getMaxEdubgIcd()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무지역</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getRegionCd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">고용형태</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEmpTpCd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무형태</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEnterTpCd()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">임금형태</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getSalTpCd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무지지하철지역</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getStaAreaRegionCd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무지지하철호선</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getLineCd()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무지지하철역</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getStaNmCd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무지지하철역출구번호</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getExitNoCd()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">근무지지하철출구거리</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getWalkDistCd()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">채용부서</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getEmpChargerDpt()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">전화번호</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getContactTelno()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">팩스번호</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=jobdtl.getChargerFaxNo()%></p></dd>
                        </dl>
                        <div class="b_button">
                            <a class="reviewbutton" href="/menu//Guin/Job-Opening.jsp" class="on">목록</a>
                        </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<%
}
%>
<%}%>
<!--e main-->
<div class="modal">
    <div class="modal_body">
        <form action="/controller/EditProfile.jsp" method="post" class="border rounded-3 p-4">
            <div class="Edit_Middle">
                <div class="Edit_Middle2">
                    <div class="Edit_1">
                        <span style="font-size: 2.4em;color:#212121;">개인정보변경</span>
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
<!-- s footer-->
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