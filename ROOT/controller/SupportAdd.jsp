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

<%
    String uid = (String) session.getAttribute("sid");
    session.setAttribute("sid", uid);

    String title = null;
    String receiveid = null;
    String content = null;
    String fileName = "파일 없음";
    String filePath = "파일 없음";
    String fileservername = "";
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

                    if (fileName != null && !fileName.isEmpty()) {
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
                    } else if (fieldName.equals("receiveid")) {
                        receiveid = fieldValue;
                    } else if (fieldName.equals("content")) {
                        content = fieldValue;
                    }
                }
            }

            SupportObject supportObject = new SupportObject();
            supportObject.setSendid(uid);
            supportObject.setReceiveid(receiveid);
            supportObject.setTitle(title);
            supportObject.setContent(content);

            // 파일 첨부를 하지 않은 경우에만 DB에 저장
            if (!fileName.equals("파일 없음") && !filePath.equals("파일 없음")) {
                
                supportObject.setFilename(fileName);
                supportObject.setFileroot(filePath);
                fileservername = fileName + dommy;
                supportObject.setFileservername(fileservername);
            }

            SupportDAO supportDAO = new SupportDAO();
            int rowCount = supportDAO.insertSupport(supportObject);

            response.sendRedirect("/menu/Support/ApplicationList.jsp");
        }
    } else {
        // 파일 첨부를 하지 않은 경우 DB에 저장
        title = request.getParameter("title");
        receiveid = request.getParameter("receiveid");
        content = request.getParameter("content");

        SupportObject supportObject = new SupportObject();
        supportObject.setSendid(uid);
        supportObject.setReceiveid(receiveid);
        supportObject.setTitle(title);
        supportObject.setContent(content);

        SupportDAO supportDAO = new SupportDAO();
        int rowCount = supportDAO.insertSupport(supportObject);

        response.sendRedirect("/menu/Support/ApplicationList.jsp");
    }
%>
