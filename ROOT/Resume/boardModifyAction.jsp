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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD MODIFY ACTION</title>
</head>
<body>

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
    ResumeDAO dao = new ResumeDAO();
    UserDAO dao2 = new UserDAO();
    ResumeObject Resume = dao.selectSupportByKey(no);
    UserObject user = dao2.selectUserByID(uid);

    //기존 db 저장 소스
    //String dbpasswd = user.getUser_passwd();
    //String passwd = "";
    String id = resume.getUser_id();
    String name = resume.getName();
    String ename = resume.getEname();
    String rno = resume.getRno();
    String age = resume.getAge();
    String sex = resume.getSex();
    String ad = resume.getAd();
    String phone = resume.getPhone();
    String email = resume.getEmail();
    String sname = resume.getSname();
    String major = resume.getMajor();
    String eperiod = resume.getEperiod();
    String credit = resume.getCredit();
    String graudate = resume.getGraudate();
    String aperiod = resume.getAperiod();
    String content = resume.getContent();
    String actc = resume.getActc();
    String actp = resume.getActp();
    String cdate = resume.getCdate();
    String cname = resume.getCname();
    String cplace = resume.getCplace();
    String cperiod = resume.getCperiod();
    String company = resume.getCompany();
    String department = resume.getDepartment();
    String position = resume.getPosition();
    String duty = resume.getDuty();
    String fileName = support.getFilename();
    String filePath = support.getFileroot();
    String fileservername = support.getFileservername();
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

            ResumeObject resumeObject = new ResumeObject();
            resumeObject.setNo(no);
            resumeObject.setName(bname);
            resumeObject.setEname(bename);
            resumeObject.setRno(brno);
            resumeObject.setAge(bage);
            resumeObject.setSex(bsex);
            resumeObject.setAd(bad);
            resumeObject.setPhone(bphone);
            resumeObject.setEmail(bemail);
            resumeObject.setSname(bsname);
            resumeObject.setMajor(bmajor);
            resumeObject.setEperiod(beperiod);
            resumeObject.setCredit(bcredit);
            resumeObject.setGraudate(bgraudate);
            resumeObject.setAperiod(baperiod);
            resumeObject.setContent(bcontent);
            resumeObject.setActc(bactc);
            resumeObject.setActp(bactp);
            resumeObject.setCdate(bcdate);
            resumeObject.setCname(bcname);
            resumeObject.setCplace(bcplace);
            resumeObject.setCperiod(bcperiod);
            resumeObject.setCompany(bcompany);
            resumeObject.setDepartment(bdepartment);
            resumeObject.setPosition(bposition);
            resumeObject.setDuty(bduty);
            resumeObject.setFilename(fileName);
            resumeObject.setFileroot(filePath);
            resumeObject.setFileservername(fileservername);

            // 파일 첨부를 하지 않은 경우에만 DB에 저장
            if (!fileName.equals(resume.getFilename()) && !filePath.equals(resume.getFileroot())) {
                
                
                resumeObject.setFilename(fileName);
                resumeObject.setFileroot(filePath);
                fileservername = fileName + dommy;
                resumeObject.setFileservername(fileservername);
            }

            ResumeDAO resumeDAO = new ResumeDAO();
            int rowCount = resumeDAO.updateSupport(resumeObject);
/*
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
            } */
        }
    } else {
        // 파일 첨부를 하지 않은 경우 DB에 저장
        no = Integer.parseInt(request.getParameter("no"));
        name = request.getParameter("name");
        ename = request.getParameter("ename");
        rno = request.getParameter("rno");
        age = request.getParameter("age");
        sex = request.getParameter("sex");
        ad = request.getParameter("ad");
        phone = request.getParameter("phone");
        email = request.getParameter("email");
        sname = request.getParameter("sname");
        major = request.getParameter("major");
        eperiod = request.getParameter("eperiod");
        credit = request.getParameter("credit");
        graudate = request.getParameter("graudate");
        aperiod = request.getParameter("aperiod");
        content = request.getParameter("content");
        actc = request.getParameter("actc");
        actp = request.getParameter("actp");
        cdate = request.getParameter("cdate");
        cname = request.getParameter("cname");
        cplace = request.getParameter("cplace");
        cperiod = request.getParameter("cperiod");
        company = request.getParameter("company");
        department = request.getParameter("department");
        position = request.getParameter("position");
        duty = request.getParameter("duty");
        //passwd = request.getParameter("passwd");
        
        ResumeObject resumeObject = new ResumeObject();
            resumeObject.setNo(no);
            resumeObject.setName(bname);
            resumeObject.setEname(bename);
            resumeObject.setRno(brno);
            resumeObject.setAge(bage);
            resumeObject.setSex(bsex);
            resumeObject.setAd(bad);
            resumeObject.setPhone(bphone);
            resumeObject.setEmail(bemail);
            resumeObject.setSname(bsname);
            resumeObject.setMajor(bmajor);
            resumeObject.setEperiod(beperiod);
            resumeObject.setCredit(bcredit);
            resumeObject.setGraudate(bgraudate);
            resumeObject.setAperiod(baperiod);
            resumeObject.setContent(bcontent);
            resumeObject.setActc(bactc);
            resumeObject.setActp(bactp);
            resumeObject.setCdate(bcdate);
            resumeObject.setCname(bcname);
            resumeObject.setCplace(bcplace);
            resumeObject.setCperiod(bcperiod);
            resumeObject.setCompany(bcompany);
            resumeObject.setDepartment(bdepartment);
            resumeObject.setPosition(bposition);
            resumeObject.setDuty(bduty);
            resumeObject.setFilename(fileName);
            resumeObject.setFileroot(filePath);
            resumeObject.setFileservername(fileservername);
            
            fileName = resume.getFilename();
            resumeObject.setFilename(fileName);
            resumeObject.setFileroot(filePath);
            resumeObject.setFileservername(fileservername);

        ResumeDAO resumeDAO = new ResumeDAO();
        int rowCount = resumeDAO.updateSupport(resumeObject);
/*
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
            } */
    }
}
%>

<%
/*
request.setCharacterEncoding("UTF-8");
if(request.getParameter("no") == null) {
    response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
} else {
    int no = Integer.parseInt(request.getParameter("no"));
    String bname = request.getParameter("name");
    String bename = request.getParameter("ename");
    String brno = request.getParameter("rno");
    String bage = request.getParameter("age");
    String bsex = request.getParameter("sex");
    String bad = request.getParameter("ad");
    String bphone = request.getParameter("phone");
    String bemail = request.getParameter("email");
    String bsname = request.getParameter("sname");
    String bmajor = request.getParameter("major");
    String beperiod = request.getParameter("eperiod");
    String bcredit = request.getParameter("credit");
    String bgraudate = request.getParameter("graudate");
    String baperiod = request.getParameter("aperiod");
    String bcontent = request.getParameter("content");
    String bactc = request.getParameter("actc");
    String bactp = request.getParameter("actp");
    String bcdate = request.getParameter("cdate");
    String bcname = request.getParameter("cname");
    String bcplace = request.getParameter("cplace");
    String bcperiod = request.getParameter("cperiod");
    String bcompany = request.getParameter("company");
    String bdepartment = request.getParameter("department");
    String bposition = request.getParameter("position");
    String bduty = request.getParameter("duty");

    ResumeObject resumeObject = new ResumeObject();
    resumeObject.setNo(no);
    resumeObject.setName(bname);
    resumeObject.setEname(bename);
    resumeObject.setRno(brno);
    resumeObject.setAge(bage);
    resumeObject.setSex(bsex);
    resumeObject.setAd(bad);
    resumeObject.setPhone(bphone);
    resumeObject.setEmail(bemail);
    resumeObject.setSname(bsname);
    resumeObject.setMajor(bmajor);
    resumeObject.setEperiod(beperiod);
    resumeObject.setCredit(bcredit);
    resumeObject.setGraudate(bgraudate);
    resumeObject.setAperiod(baperiod);
    resumeObject.setContent(bcontent);
    resumeObject.setActc(bactc);
    resumeObject.setActp(bactp);
    resumeObject.setCdate(bcdate);
    resumeObject.setCname(bcname);
    resumeObject.setCplace(bcplace);
    resumeObject.setCperiod(bcperiod);
    resumeObject.setCompany(bcompany);
    resumeObject.setDepartment(bdepartment);
    resumeObject.setPosition(bposition);
    resumeObject.setDuty(bduty);
    
    ResumeDAO resumeDAO = new ResumeDAO();
    resumeDAO.updateBoard(resumeObject);
    
    response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
}
*/
%>
</body>
</html>
