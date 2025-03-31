<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Random" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page import="java.sql.*" %>
<%@ page import="dbconn.*" %>

<%if(request.getParameter("no") == null) {
    %>
    <script>
        alert("번호가 없습니다.");
    </script>
    <%
    response.sendRedirect(request.getContextPath()+"/menu/Support/ApplicationModify.jsp");
} else {

    String uid = (String) session.getAttribute("sid");
    session.setAttribute("sid", uid);

    int no = Integer.parseInt(request.getParameter("no"));
    SupportDAO dao = new SupportDAO();
    UserDAO dao2 = new UserDAO();
    SupportObject support = dao.selectSupportByKey(no);
    UserObject user = dao2.selectUserByID(uid);

    //기존 db 저장 소스
    String dbpasswd = user.getUser_passwd();

    String sendid = support.getSendid();
    String receiveid = support.getSendid();
    String title = support.getTitle();
    String content = support.getContent();
    String passwd = "";
    String fileName = support.getFilename();
    String filePath = support.getFileroot();
    String fileservername = support.getFileservername();
    String opencheck = support.getOpencheck();
    // 파일을 저장할 경로
    String uploadDirectory = "/var/lib/tomcat9/webapps/ROOT/files";

    Randoms ran = new Randoms();
    String dommy = ran.randommake();

    // 요청이 multipart/form-data 형식인지 확인
    boolean isMultipart = false;

    String contentType = request.getContentType();
    if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
        isMultipart = true;

        // 파일 업로드를 처리하는 데 필요한 객체 생성
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 요청으로부터 파일 아이템 목록 가져오기
        List<FileItem> items = upload.parseRequest(request);
        Iterator<FileItem> iter = items.iterator();

        // 파일 첨부가 있는 경우에만 처리
        if (iter.hasNext()) {
            while (iter.hasNext()) {
                FileItem item = iter.next();

                // 파일 아이템인 경우에만 처리
                if (!item.isFormField()) {
                    // 파일 저장 경로 생성
                    fileName = item.getName();

                    if (fileName != null && !fileName.isEmpty() && fileName != "") {
                        filePath = uploadDirectory + File.separator + fileName + dommy;

                        // 파일 저장
                        File uploadedFile = new File(filePath);
                        FileUtils.copyInputStreamToFile(item.getInputStream(), uploadedFile);
                    }
                } else {
                    // 일반 필드인 경우에 처리
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8");

                    if (fieldName.equals("title")) {
                        title = fieldValue;
                    }  else if (fieldName.equals("content")) {
                        content = fieldValue;
                    }
                    else if (fieldName.equals("passwd")) {
                        passwd = fieldValue;
                    }
                    
                }
            }

            SupportObject supportObject = new SupportObject();
            supportObject.setNo(no);
            supportObject.setTitle(title);
            supportObject.setContent(content);
            
            supportObject.setFilename(fileName);
            supportObject.setFileroot(filePath);
            supportObject.setFileservername(fileservername);
            supportObject.setOpencheck(opencheck);

            // 파일 첨부를 하지 않은 경우에만 DB에 저장
            if (!fileName.equals(support.getFilename()) && !filePath.equals(support.getFileroot())) {
                
                
                supportObject.setFilename(fileName);
                supportObject.setFileroot(filePath);
                fileservername = fileName + dommy;
                supportObject.setFileservername(fileservername);
            }

            SupportDAO supportDAO = new SupportDAO();
            int rowCount = supportDAO.updateSupport(supportObject);

            if(passwd.equals(dbpasswd)){
                %>
                <script>
                    alert("수정 완료");
                </script>
                <%
            response.sendRedirect("/menu/Support/ApplicationList.jsp");
            }
            else{
                %>
                <script>
                    alert("비밀번호가 일치하지 않습니다");
                    history.back();
                </script>
                <%
            }
        }
    } else {
        // 파일 첨부를 하지 않은 경우 DB에 저장
        title = request.getParameter("title");
        content = request.getParameter("content");
        passwd = request.getParameter("passwd");
        
        SupportObject supportObject = new SupportObject();
        supportObject.setNo(no);
            supportObject.setTitle(title);
            supportObject.setContent(content);
            
            fileName = support.getFilename();
            supportObject.setFilename(fileName);
            supportObject.setFileroot(filePath);
            supportObject.setFileservername(fileservername);
            supportObject.setOpencheck(opencheck);

        SupportDAO supportDAO = new SupportDAO();
        int rowCount = supportDAO.updateSupport(supportObject);

        if(passwd.equals(dbpasswd)){
                %>
                <script>
                    alert("수정 완료");
                </script>
                <%
            response.sendRedirect("/menu/Support/ApplicationList.jsp");
            }
            else{
                %>
                <script>
                    alert("비밀번호가 일치하지 않습니다");
                    history.back();
                </script>
                <%
            }
    }
}
%>
