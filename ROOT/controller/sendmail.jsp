<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.Properties" %>
<%@ page import="java.io.StringWriter, java.io.PrintWriter" %>


<%
    request.setCharacterEncoding("UTF-8");
    
    // 이메일 발신자 및 인증 정보 설정
    String from = "kbg06221@naver.com";
    String password = "rkdwnsgml018973!";
    
    // 이메일 수신자 및 내용 설정
    String to = (String)request.getParameter("email");
    String uid = (String)session.getAttribute("sid");
    application.setAttribute("sid",uid);
    application.setAttribute("semail",to);
    String subject = "[DOIT] 이메일 인증";
    String content = "<div align='center' style='border:1px solid black; font-family:verdana'>"
    + "<h3 style='color: blue;'><strong>" + to + "님</strong>의 인증 사이트입니다. 접속 후 인증을 완료하세요.</h3>" + "<br>" 
    + "<p><h1>인증 사이트 : <strong>" + "https://www.jobspotlight.info/controller/emailcert.jsp" + "</strong></h1></p>" + "<br><br>"
    + "<p><h1>인증 사이트 : <strong>" + "http://34.64.249.77/controller/emailcert.jsp" + "</strong></h1></p>" + "<br></div>" ;
    
    // SMTP 서버 설정
    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.naver.com");
    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.ssl.enable", "true");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
    props.put("mail.smtp.ssl.ciphersuites", "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256");
    
    // 세션 생성 및 인증
    Session emailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, password);
        }
    });

    try {
        // 이메일 메시지 작성
        Message message = new MimeMessage(emailSession);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setContent(content, "text/html; charset=UTF-8");

        // 이메일 전송
        Transport.send(message);
        
        %>
        <script>
            alert('성공적으로 전송 되었습니다.');
                history.back();
        </script>
        <%
    } catch(Exception e){
    e.printStackTrace();
    out.println(e.getMessage());
    //out.println("<script>alert('전송 실패입니다.. ');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
    
}
%>

