<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="xml.*"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
        

    JobInfo jobinfoxml = new JobInfo();
    Region regionxml = new Region();
    JobType jobtypexml = new JobType();

    ArrayList<JobTypeObject> onedepths = jobtypexml.getOneJobType();
    ArrayList<JobTypeObject> twodepths = jobtypexml.getTwoJobType();
    ArrayList<JobTypeObject> threedepths = jobtypexml.getThreeJobType();

    ArrayList<RegionObject> superregions = regionxml.getRegions(true);
    ArrayList<RegionObject> regions = regionxml.getRegions(false); // true는 상위 false는 하위
    
    int currentPage = 1;
    if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }
    int totalRowCount = jobinfoxml.getJobInfoNum();
    int pagePerRow = 10;

    int beginRow = (currentPage-1)*pagePerRow;
    
    String[] str = {
        "region",  "occupation",  "salTp",  "minPay",  "maxPay",
     "education",  "career",  "minCareerM",  "maxCareerMm",  "pref",
     "subway",  "empTp",  "termContractMmcnt",  "holidayTp",  "coTp",
     "busino",  "dtlSmlgntYn",  "workStudyJoinYn",  "smlgntCoClcd",
     "workerCnt",  "welfare",  "certLic",  "regDate",  "keyword",
     "untilEmpWantedYn",  "minWantedAuthDt",  "maxWantedAuthDt",  "empTpGb",
     "sortOrderBy",  "major",  "foreignLanguage",  "comPreferential",
     "pfPreferential",  "workHrCd"
    };

    String supers ="";
    if(request.getParameter("supers") != null) {
            supers = (String) request.getParameter("supers");
        }   
    String[] search = new String[34]; //위의 str 스트링 순서라 생각하면됨.
    for(int i=0;i<34;i++){
        search[i]="";
    }
    for(int i =0; i<str.length; i++){
        if(request.getParameter(str[i]) != null) {
            search[i] = (String) request.getParameter(str[i]);
        }   
    }       
    

    String url2 = request.getContextPath() 
        + String.format("/menu/Guin/Job-Opening.jsp?region=%s&occupation=%s&salTp=%s&minPay=%s&maxPay=%s"
        , search[0], search[1], search[2], search[3], search[4])
        + String.format("&education=%s&career=%s&minCareerM=%s&maxCareerMm=%s&pref=%s"
        , search[5], search[6], search[7], search[8], search[9])
        + String.format("&subway=%s&empTp=%s&termContractMmcnt=%s&holidayTp=%s&coTp=%s"
        , search[10], search[11], search[12], search[13], search[14])
        + String.format("&busino=%s&dtlSmlgntYn=%s&workStudyJoinYn=%s&smlgntCoClcd=%s&workerCnt=%s"
        , search[15], search[16], search[17], search[18], search[19])
        + String.format("&welfare=%s&certLic=%s&regDate=%s&keyword=%s&untilEmpWantedYn=%s"
        , search[20], search[21], search[22], search[23], search[24])
        + String.format("&minWantedAuthDt=%s&maxWantedAuthDt=%s&empTpGb=%s&sortOrderBy=%s&major=%s"
        , search[25], search[26], search[27], search[28], search[29])
        + String.format("&foreignLanguage=%s&comPreferential=%s&pfPreferential=%s&workHrCd=%s"
        , search[30], search[31], search[32], search[33]);
        




%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>구인</title>
        <link href="/css/menu1.css?after" rel="stylesheet" type="text/css">
        <link href="/css/footer.css?after" rel="stylesheet" type="text/css">
        <link href="/css/board/board.css" rel="stylesheet" type="text/css">
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
            height:2200px;
        }
    </style>
    <Script>
        function checkOnlyOne(element) {
          
          const checkboxes 
              = document.getElementsByName("career");
          
          checkboxes.forEach((cb) => {
            cb.checked = false;
          })
          
          element.checked = true;
        }
        function checkOnlyTwo(element) {
          
          const checkboxes 
              = document.getElementsByName("pref");
          
          checkboxes.forEach((cb) => {
            cb.checked = false;
          })
          
          element.checked = true;
        }
        function checkOnlyThree(element) {
          
          const checkboxes 
              = document.getElementsByName("empTpGb");
          
          checkboxes.forEach((cb) => {
            cb.checked = false;
          })
          
          element.checked = true;
        }
        </Script>
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
<!-- s main-->
<div id="wrap">
<div class="board_wrap">
    <div class="board_title">
        <strong>구인 게시판</strong>
        <p>해당 게시판을 이용하여 구인 글을 작성할수있습니다.</p>
        <div>전체게시글 수 : <%=totalRowCount%></div>
    </div>
    <form action="<%=url2%>&currentPage=<%=currentPage%>">
        <div class="square">
            상세검색
        </div>
        <table class="simsearch">
            <tr>
                    <th>지역</th>       
                    <td>
                    
            <select class="input_text" name="supers" id="local1"> <!--상위 지역-->
                    <option value="">관계없음</option>
                    <% for (RegionObject superregion : superregions) { 
                        
                        %>
                <option value="<%= superregion.getSuperRegionCd()%>"><%= superregion.getSuperRegionNm() %></option>
                 <% 
                 
                        }
                  %>
            </select>


            <select class="input_text" name="region" id="local2"> <!--하위 지역-->
                <option value="">관계없음</option>
                <%
                    for(RegionObject region : regions){
                
            %>
                <option value="<%=region.getRegionCd()%>"><%=region.getRegionNm()%>></option><%
            }
                %>
            </select>

            <script>
    function contains(string, substring) {
        return string.indexOf(substring) !== -1;
    }

    document.addEventListener("DOMContentLoaded", function() {
        var local1Select = document.getElementById("local1");
        var local2Select = document.getElementById("local2");

        local1Select.addEventListener("change", function() {
        var selectedValue = local1Select.options[local1Select.selectedIndex].value;
        // 선택된 값(selectedValue)을 원하는 곳에 사용
        console.log("Selected value: " + selectedValue);
        // 또는 Ajax 요청 등을 통해 선택된 값을 서버로 전송

        // region 셀렉트 박스 업데이트
        updateLocal2Options(selectedValue);
        });

        function updateLocal2Options(selectedValue) {
        local2Select.innerHTML = '<option value="">관계없음</option>';
        <% for (RegionObject region : regions) { %>
        var regionCode = '<%= region.getRegionCd() %>';
        var regionName = '<%= region.getRegionNm() %>';
        var supercode = '<%= region.getSuperCd() %>';
            if (contains(supercode, selectedValue)) { 
            local2Select.innerHTML += '<option value="' + regionCode + '">' + regionName + '</option>';
            } 
        <% } %>
        }
    });
    </script>

                    </td>
                    <th>직종 </th>
                    <td>
                    <select class="input_text" name="oneDepth" id="oneDepth"> <!-- 1단계 직종 코드 -->
  <option value="">관계없음</option>
  <% for (JobTypeObject onedepth : onedepths) { %>
    <option value="<%= onedepth.getOnejobsCd() %>"><%= onedepth.getOnejobsNm() %></option>
  <% } %>
</select>

<select class="input_text" name="twoDepth" id="twoDepth"> <!-- 2단계 직종 코드 -->
  <option value="">관계없음</option>
</select>

<select class="input_text" name="threeDepth" id="threeDepth"> <!-- 3단계 직종 코드 -->
  <option value="">관계없음</option>
</select>
<script>
  function compareCodes(code1, code2) {
    // 코드 비교 로직을 구현하세요
    // 예시: return code1 === code2;
    return code1 === code2;
  }

  document.addEventListener("DOMContentLoaded", function() {
    var oneDepthSelect = document.getElementById("oneDepth");
    var twoDepthSelect = document.getElementById("twoDepth");
    var threeDepthSelect = document.getElementById("threeDepth");

    oneDepthSelect.addEventListener("change", function() {
      var selectedValue = oneDepthSelect.options[oneDepthSelect.selectedIndex].value;
      // 선택된 값(selectedValue)을 원하는 곳에 사용
      console.log("Selected value: " + selectedValue);
      // 또는 Ajax 요청 등을 통해 선택된 값을 서버로 전송

      // twoDepthSelect 및 threeDepthSelect 셀렉트 박스 업데이트
      updateTwoDepthOptions(selectedValue);
      updateThreeDepthOptions("");
    });

    twoDepthSelect.addEventListener("change", function() {
      var selectedValue = twoDepthSelect.options[twoDepthSelect.selectedIndex].value;
      // 선택된 값(selectedValue)을 원하는 곳에 사용
      console.log("Selected value: " + selectedValue);
      // 또는 Ajax 요청 등을 통해 선택된 값을 서버로 전송

      // threeDepthSelect 셀렉트 박스 업데이트
      updateThreeDepthOptions(selectedValue);
    });

    function updateTwoDepthOptions(selectedValue) {
      twoDepthSelect.innerHTML = '<option value="">관계없음</option>';
      <% for (JobTypeObject twodepth : twodepths) { %>
        var twodepthCode = '<%= twodepth.getTwojobsCd() %>';
        var twodepthName = '<%= twodepth.getTwojobsNm() %>';
        var superCode = '<%= twodepth.getTwosuperCd() %>';
        if (compareCodes(superCode, selectedValue)) {
          twoDepthSelect.innerHTML += '<option value="' + twodepthCode + '">' + twodepthName + '</option>';
        }
      <% } %>
      // threeDepthSelect 초기화
      updateThreeDepthOptions("");
    }

    function updateThreeDepthOptions(selectedValue) {
      threeDepthSelect.innerHTML = '<option value="">관계없음</option>';
      <% for (JobTypeObject threedepth : threedepths) { %>
        var threedepthCode = '<%= threedepth.getThreejobsCd() %>';
        var threedepthName = '<%= threedepth.getThreejobsNm() %>';
        var superCode = '<%= threedepth.getThreejobsNm() %>';
        if (compareCodes(superCode, selectedValue)) {
          threeDepthSelect.innerHTML += '<option value="' + threedepthCode + '">' + threedepthName + '</option>';
        }
      <% } %>
    }
  });
</script>


                    </td>
            </tr>
            <tr>
                <th>임금형태</th>
                <td>
                    <select class="input_text" name="salTp">
                        <option value="">관계없음</option>
                        <option value="D">일급</option>
                        <option value="H">시급</option>
                        <option value="M">월급</option>
                        <option value="Y">연봉</option>
                    </select>
                </td>
                <th>학력</th>
                <td>
                    <select class="input_text" name="education">
                        <option value=""> 선택 </option>
                        <option value="00">학력무관</option>
                        <option value="01">초졸이하</option>
                        <option value="02">중졸</option>
                        <option value="03">고졸</option>
                        <option value="04">대졸(2~3년)</option>
                        <option value="05">대졸(4년)</option>
                        <option value="06">석사</option>
                        <option value="07">박사</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>최소급여</th>
                <td><input class="input_text" type="number" name="minPay"></td>
                <th>최대급여</th>
                <td><input class="input_text" type="number" name="maxPay"></td>
            </tr>
            <tr>
                <th>경력</th>
                <td>
            <input type='checkbox' name='career' value='N' onclick='checkOnlyOne(this)'/> 신입
            <input type='checkbox' name='career' value='E' onclick='checkOnlyOne(this)'/> 경력
            <input type='checkbox' name='career' value='Z' onclick='checkOnlyOne(this)'/> 관계없음
                </td>
                <th>우대조건</th>
                <td>
                    <input type='checkbox' name='pref' value='Y' onclick='checkOnlyTwo(this)'/> 장애인 병행채용
                    <input type='checkbox' name='pref' value='D' onclick='checkOnlyTwo(this)'/> 장애인만 채용
                </td>
            </tr>
            <tr>
                <th>경력 최소개월 수</th>
                <td><input class="input_text" type="number" name="minCareerM"></td>
                <th>경력 최대개월 수</th>
                <td><input class="input_text" type="number" name="maxCareerM"></td>
            </tr>
            <tr>
                <th>고용형태</th>
                <td>
                    <select class="input_text" name="empTp">
                        <option value="">선택</option>
                        <option value="4">파견근로</option>
                        <option value="10">기간의 정함이 없는 근로계약</option>
                        <option value="11">기간의 정함이 없는 근로계약(시간(선택)제)</option>
                        <option value="20">기간의 정함이 있는 근로계약</option>
                        <option value="21">기간의 정함이 있는 근로계약(시간(선택)제)</option>
                        <option value="Y">대체인력채용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>근무기간</th>
                <td>
                    <select class="input_text" name="termContractMmcnt">
                        <option value="">선택</option>
                        <option value="1">1~3개월</option>
                        <option value="3">3~6개월</option>
                        <option value="6">6~12개월</option>
                        <option value="12">12개월 이상</option>
                    </select>
                </td>
                <th>근무형태</th>
                <td>
                    <select class="input_text" name="holidayTp">
                        <option value="">선택</option>
                        <option value="1">주 5일 근무</option>
                        <option value="3">주 6일 근무</option>
                        <option value="6">3 토요 격주 휴무</option>
                        <option value="9">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>기업형태</th>
                <td>
                    <select class="input_text" name="coTp">
                        <option value="">선택</option>
                        <option value="01">대기업</option>
                        <option value="03">벤처기업</option>
                        <option value="04">공공기관</option>
                        <option value="05">외국계기업</option>
                        <option value="09">청년친화강소기업</option>
                    </select>
                </td>
                <th>사업자등록번호</th>
                <td><input class="input_text" type="text" name="busino"></td>
            </tr>
            
            <tr>
                <th>사원수</th>
                <td>
                    <input type='checkbox' name='workerCnt' value='W5'/> 5인 미만
                    <input type='checkbox' name='workerCnt' value='W9'/> 5인 ~ 10인
                    <input type='checkbox' name='workerCnt' value='W10'/> 10인 ~ 30인<br>
                    <input type='checkbox' name='workerCnt' value='W30'/> 30인 ~ 50인
                    <input type='checkbox' name='workerCnt' value='W50'/> 50인 ~ 100인
                    <input type='checkbox' name='workerCnt' value='W100'/> 100인 이상
                </td>
                <th>근무편의</th>
                <td>
                    <input type='checkbox' name='welfare' value='01'/> 기숙사
                    <input type='checkbox' name='welfare' value='02'/> 통근버스
                    <input type='checkbox' name='welfare' value='11'/> 중식제공(또는 중식비 지원)
                    <input type='checkbox' name='welfare' value='12'/> 차량유지비<br>
                    <input type='checkbox' name='welfare' value='13'/> 교육비 지원
                    <input type='checkbox' name='welfare' value='06'/> 자녀학자금 지원
                    <input type='checkbox' name='welfare' value='09'/> 주택자금 지원
                </td>
            </tr>
            
            <tr>
                <th>근무 시작일</th>
                <td>
                    <select class="input_text" name="regDate">
                        <option value="">선택</option>
                        <option value="D-0">오늘</option>
                        <option value="D-3">3일</option>
                        <option value="M-1">한달</option>
                        <option value="W-1">1주 이내</option>
                        <option value="W-2">2주 이내</option>
                    </select>
                </td>
                <th>키워드</th>
                <td>
                    <input class="input_text" type="text" name="keyword">
                </td>
            </tr>
            <tr>  
                <th>채용 구분</th>
                <td>
                    <input type='checkbox' name='empTpGb' value='Y' onclick='checkOnlyThree(this)'/> 상용직
                    <input type='checkbox' name='empTpGb' value='D' onclick='checkOnlyThree(this)'/> 일용직
                </td>
                <th>채용시까지 구인여부</th>
                <td>
                    <input type='checkbox' name='untilEmpWantedYn' value='Y'/> YES
                    <input type='checkbox' name='untilEmpWantedYn' value='N'/> NO
                </td>
            </tr>
            
            <tr>
                <th>등록일</th>
                <td>
                    <input type="radio" name="sortOrderBy" value="DESC"> 상향정렬
                    <input type="radio" name="sortOrderBy" value="ASC"> 하향정렬
                </td>
                <th>전공</th>
                <td><input class="input_text" type="text" name="major"></td>
            </tr>
            <tr>
                <th>외국어</th>
                <td><input class="input_text" type="text" name="foreignLanguage"></td>
                <th>기타 우대조건(컴퓨터)</th>
                <td>
                    <input type='checkbox' name='comPreferential' value='1'/> 문서 작성
                    <input type='checkbox' name='comPreferential' value='2'/> 스프레드 시트
                    <input type='checkbox' name='comPreferential' value='4'/> 프레젠테이션
                    <input type='checkbox' name='comPreferential' value='6'/> 회계프로그램
                    <input type='checkbox' name='comPreferential' value='9'/> 기타
                </td>
            </tr>
            <tr>
                <th>기타 우대조건</th>
                <td>
                    <input type='checkbox' name='pfPreferential' value='05'/> 차량소지자
                    <input type='checkbox' name='pfPreferential' value='07'/> 고용촉진장려금대상자
                    <input type='checkbox' name='pfPreferential' value='08'/> 보훈취업지원대상자
                    <input type='checkbox' name='pfPreferential' value='09'/> 장기복무 제대군인<br>
                    <input type='checkbox' name='pfPreferential' value='10'/> 북한이탈주민
                    <input type='checkbox' name='pfPreferential' value='14'/> 운전가능자
                    <input type='checkbox' name='pfPreferential' value='S'/> 장애인
                    <input type='checkbox' name='pfPreferential' value='B'/> (준)고령자(50세이상)
                </td>
                <th>근무시간</th>
                <td>
                    <input type='checkbox' name='workHrCd' value='1'/> 오전(06:00~12:00)
                    <input type='checkbox' name='workHrCd' value='2'/> 오후(12:00~18:00)
                    <input type='checkbox' name='workHrCd' value='3'/> 저녁(18:00~24:00)<br>
                    <input type='checkbox' name='workHrCd' value='4'/> 새벽(00:00~06:00)
                    <input type='checkbox' name='workHrCd' value='5'/> 오전~오후
                    <input type='checkbox' name='workHrCd' value='6'/> 오후~저녁
                    <input type='checkbox' name='workHrCd' value='7'/> 저녁~새벽<br>
                    <input type='checkbox' name='workHrCd' value='8'/> 새벽~오전
                    <input type='checkbox' name='workHrCd' value='9'/> 종일 근무(09:00~18:00)
                    <input type='checkbox' name='workHrCd' value='99'/> 시간협의/무관
                </td>    
            </tr>
            
        </table>
        <div class="simbutton">
            <input class="reviewbutton" type="reset" value="초기화"/>
            <input class="reviewbutton" type="submit" value="검색"/>
        </div>
    </form>
    <div class="board_list_wrap">
        <div class="board_list">
            <div class="top">
                <div class="num">번호</div>
                <div class="title">제목</div>
                <div class="writer">기업</div>
                <div class="date">작성일</div>
                <div class="date">마감일</div>
                
            </div>
            

            <div id="jobinfo-list">
            <%  
             
            if(search[0].equals("")&& !supers.equals("")){
                search[0] = supers;
            }
                ArrayList<JobInfoObject> jobinfos = jobinfoxml.getJobInfo(currentPage, pagePerRow
                , search[0], search[1], search[2], search[3], search[4]
                , search[5], search[6], search[7], search[8], search[9]
                , search[10], search[11], search[12], search[13], search[14]
                , search[15], search[16], search[17], search[18], search[19]
                , search[20], search[21], search[22], search[23], search[24]
                , search[25], search[26], search[27], search[28], search[29]
                , search[30], search[31], search[32], search[33]);             

                int start = (currentPage - 1) * pagePerRow + 1;
                
                for(JobInfoObject jobinfo : jobinfos){
                %>
                
                <div class="num"><%=start++%></div>
                <div class="title"><a href="<%=request.getContextPath()%>/menu/Guin/Job-View.jsp?jobno=<%=jobinfo.getWantedAuthNo()%>&no=<%=start-1%>&date=<%=jobinfo.getRegDt()%>" ><%=jobinfo.getTitle()%></a></div>
                <div class="writer"><a href="<%=request.getContextPath()%>/menu/Guin/Job-View.jsp?jobno=<%=jobinfo.getWantedAuthNo()%>&no=<%=start-1%>&date=<%=jobinfo.getRegDt()%>" ><%=jobinfo.getCompany()%></a></div>
                <div class="date"><%=jobinfo.getRegDt()%></div>
                <div class="date2"><%=jobinfo.getCloseDt()%></div>
                
                        <%
                }
            %>
            </div>

        </div>
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
                                    <a class="buttona" href="<%=url2%>&currentPage=<%=currentPage-1%>"><</a>
                                </button>
                                <%=currentPage%>
                                
                    <% 
                            
                            }
                            if(currentPage < lastPage) {
                    %>
                                <button class="reviewbutton1">
                                    <a class="buttona" href="<%=url2%>&currentPage=<%=currentPage+1%>">></a>
                                </button>
                    <%
                            }
                    %>
                    </div>
        <div class="bt_wrap">
            
            <!--<a href="#">수정</a>-->
        </div>
    </div>
</div>
</div>
<%}%>
<!-- e main-->
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