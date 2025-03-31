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
    
        
     String areaCd = (String) request.getParameter("region");
    String eventNo = (String) request.getParameter("eventNo");
    
    
    
    EmpEvent empeventxml = new EmpEvent();
    ArrayList<EmpEventDtlObject> empevents = empeventxml.getEmpEventdetail(areaCd,eventNo);
 

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인라인 모달 팝업창</title>
    <link rel="stylesheet" href="./index.css">
    <style>
        html, body{
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
}
body{
    background-image: url('./bg.jpg'); /* 배경 이미지 */
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}
body.dimmed::before{
    content: '';
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    background-color: rgba(255,255,255, 0.45);
    -webkit-backdrop-filter: blur(5px);
    backdrop-filter: blur(5px);    
}
.popup {
    z-index: 1;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    min-width: 50%;
    max-width: 50%;
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 2px 55px -25px rgb(0 0 0 / 100%);
}
.popup > .title{
    border-radius: 15px 15px 0 0;
    min-height: 40px;
    color: #fff;
    background-color: #b66;
    padding: 10px 15px;
    box-sizing: border-box;
    font-weight: bold;
}
.popup > .content {
    padding: 20px;
    box-sizing: border-box;
}
.popup > .cmd {
    bottom: 0;
    min-height: 40px;
    padding: 15px 15px;
    box-sizing: border-box;
    border-radius: 0 0 15px 15px;
    min-height: 40px;
    text-align: right;
}
.popup > .cmd .button {
    border-radius: 8px;
    padding: 5px 10px;
    border: 1px solid #aaa;
}
.popup > .cmd .button:hover {
    color: #fff;
    background-color: #000;
    border-color: #000;
}
    </style>
</head>
<body class="dimmed">
    <div class="popup">
        <div class="title">상세 정보</div>
        <div class="content">
            <table class="board_wrap">
                <%
                    for(EmpEventDtlObject empevent : empevents) { %>
                            <dl>
                                <dt>
                                    행사명
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getEventNm()%></label>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    행사기간
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getEventTerm()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    행사장소
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getEventPlc()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    참여기업구인정보
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getJoinCoWantedInfo()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    부대사항
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getSubMatter()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    문의전화
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getInqTelNo()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    팩스번호
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getFax()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    담당자
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getCharger()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    이메일
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getEmail()%></label><br>
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    오시는길
                                </dt>
                                <dd>
                                    <label for="lang" style="font-size:1.2em; font-weight: bolder; margin: 5px;"><%=empevent.getVisitPath()%></label><br>
                                </dd>
                            </dl>
                
                     <% } %>
                            </table>
        </div>
        <%}%>
        <div class="cmd">
            <button class="button" type="button" onclick="location.href='ScheduleSearch.jsp'">닫기</button>
        </div>
    </div>
</body>
</html>