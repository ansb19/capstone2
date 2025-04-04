<%@page import="javax.activation.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String from = request.getParameter("from");
String to = request.getParameter("to");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
// 입력값 받음

Properties p = new Properties(); // 정보를 담을 객체

p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP

p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
p.put("mail.smtp.ssl.enable", "true"); // SSL 사용
p.put("mail.smtp.ssl.trust", "smtp.naver.com"); // 신뢰할 수 있는 호스트 설정
// SMTP 서버에 접속하기 위한 정보들

try{
    Authenticator auth = new Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("kbg06221","rkdwnsgml018973!");
    }
};
  
    Session ses = Session.getInstance(p, auth);
    
    ses.setDebug(true);
    
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject(subject); // 제목
    
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // 보내는 사람
    
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
    
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
    
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println(e.getMessage());
    //out.println("<script>alert('Send Mail Failed..');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}

out.println("<script>alert('Send Mail Success!!');location.href='mailForm.html';</script>");
// 성공 시
%>