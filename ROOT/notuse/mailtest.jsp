<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>

<%
    // 이메일 발신자 및 인증 정보 설정
    String host = "smtp.example.com";
    String username = "your-email@example.com";
    String password = "your-password";

    // 이메일 수신자 및 내용 설정
    String toAddress = "recipient@example.com";
    String subject = "이메일 제목";
    String content = "이메일 내용";

    // SMTP 서버 설정
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.auth", "true");

    // 세션 생성 및 인증
    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        // 이메일 메시지 작성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
        message.setSubject(subject);
        message.setText(content);

        // 이메일 전송
        Transport.send(message);

        out.println("이메일이 성공적으로 전송되었습니다.");
    } catch (MessagingException e) {
        out.println("이메일 전송 중 오류가 발생했습니다: " + e.getMessage());
    }
%>