
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
    <link href="/css/EditProfile.css?after" rel="stylesheet" type="text/css">
    <link href="/css/EditProfile2.css?after" rel="stylesheet" type="text/css">

        <!--구글웹폰트 Link-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
        <!--구글웹폰트 Link-->
</head>
    <style>
        #wrap{
            background-color: lightgray;
        }
    </style>
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

<!--s middle-->
<div id="wrap">
    <div class="Edit1_Middle">
        <div class="Edit1_Middle2">
            <div class="Edit1_1">
                <br><br><br><br><br><br>          
                <img style="width:200px; height:200px; border-radius: 10px;" src="/image/human.png"><br><Br>
                <div class="name" style="color:black; font-size: 80px;" >
                    <%=uname%><br>
                </div>
                <div class="name" style="color:black; font-size: 80px;">
                    <%=uid %><br><br>
                </div>
                <button class="Edit_In" type="button" onClick="location.href='../../mainhomepage.jsp'">메인 홈</button><Br><br><br>
                <form action="/controller/withdraw.jsp" method="post">
                    <button class="Edit_Out" type="submit" onclick="func1();">회원 탈퇴</button>
                </form>
            </div>
        </div>
        <div class="Edit1_Middle3">
            <div class="Edit2_1">
                <form action="/controller/EditProfile2.jsp" method="post">
                    <div>
                        <span class="Edit_T">성별</span><input class="Box_Readonly" type="text" name="sex" readonly placeholder="<%=request.getAttribute("User_sex")%>"><br>
                        <span class="Edit_T">생일</span><input class="Box_Readonly" type="birth" name="birth" readonly placeholder="<%=request.getAttribute("User_birth")%>"><br>
                        <span class="Edit_T">가입 유형</span><input class="Box_Readonly" type="text" name="type" readonly placeholder="<%=request.getAttribute("User_type")%>"><br>
                    </div>
                    <div>
                        <span class="Edit_T">휴대폰번호</span>
                        <input class="Edit_B" type="tel" id="phone" name="phone" value="<%=request.getAttribute("User_phone")%>" placeholder="<%=request.getAttribute("User_phone")%>" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required><br>
                        
                        
                        <span class="Edit_T">이메일</span>
                        <input class="Edit_B" onkeyup="eventKeyup(this.value)" type="email" id="e_email" name="e_email" value="<%=request.getAttribute("User_email")%>" placeholder="<%=request.getAttribute("User_email")%>" required ><br>
                        


                        <span class="Edit_T">주소</span>
                        <input class="Edit_B" type="text" id="txt_address" name="address" value="<%=request.getAttribute("User_address")%>" placeholder="<%=request.getAttribute("User_address")%>" required><br>

                        <span class="Edit_T">비밀번호</span>
                        <input class="Edit_B" type="password" id="pw" name="pw" minlength="6" required><br>
                    </div>
                    <div style="float:right; margin:10px">
                        <button class="Edit_Button" type="submit" onclick="checkfield()">수정</button>
                    </div>
                </form>
                <div style="float:right; margin:10px">
                    <form action="/controller/sendmail.jsp">
                        <input style="width:0px; height:0px; border: 0px;" type="text" id="email" name="email">
                        <button class="Edit_Button" onclick="getinput()" type="submit">이메일 인증</button><br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script language="javascript">
    function func1(){
	var r = confirm('탈퇴 하시겠습니까?');//r은 변수
	console.log(r);//변수 r에 저장된 값을 콘솔에 출력
	if(r == true){
		alert("회원 탈퇴 되었습니다.");
	}
	else{
		alert("탈퇴 취소 되었습니다.");
	}
}
</script>
<script type="text/javaScript">
    function eventKeyup(str)
    {
 
          document.all.e_email.value = str;    // jsp 이용
          document.getElementById("email").value = str;   // jsp 이용
    }
    
    </script>
<script>
    var patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
    var res = patt.test( $("#phone").val());

    if( !patt.test( $("#phone").val()) ){
        alert("전화번호를 정확히 입력하여 주십시오.");
        return false;
    }


</script>
<!--e middle-->
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