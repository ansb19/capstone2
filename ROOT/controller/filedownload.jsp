<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page contentType="application/octet-stream" %>
<%@ page language="java" pageEncoding="UTF-8" %>

<%
    // 파일 경로 및 파일명
    String filePath = (String) request.getParameter("fileroot");
    String fileName = (String) request.getParameter("filename");
    String servername = (String) request.getParameter("fileservername");

    %>
    <script>
        alert("<%=filePath%>");
    </script>
    <%
    // 파일 객체 생성
    File file = new File(filePath + servername);
    
    // 파일 존재 여부 확인
    if (!file.exists()) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
    }
    
    // MIME 타입 설정
    ServletContext context = pageContext.getServletContext();
    String mimeType = context.getMimeType(file.getAbsolutePath());
    if (mimeType == null) {
        mimeType = "application/octet-stream";
    }
    
    // 다운로드를 위한 헤더 설정
    response.setContentType(mimeType);
    response.setContentLength((int) file.length());
    
    // 파일명 인코딩
    String encodedFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
    String headerKey = "Content-Disposition";
    String headerValue = "attachment; filename=" + encodedFileName;
    response.setHeader(headerKey, headerValue);
    
    // 파일을 읽어와 클라이언트에게 전송
    try (FileInputStream fis = new FileInputStream(file)) {
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = fis.read(buffer)) != -1) {
            response.getOutputStream().write(buffer, 0, bytesRead);
        }

        response.sendRedirect("/menu/Support/ApplicationDetailList.jsp");
    } catch (IOException e) {
        e.printStackTrace();
    }
%>
