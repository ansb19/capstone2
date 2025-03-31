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
    //String uid = (String) session.getAttribute("sid");
    //session.setAttribute("sid", uid);

    String name = null;
    String ename = null;
    String rno = null;
    String age = null;
    String sex = null;
    String ad = null;
    String phone = null;
    String email = null;
    String sname = null;
    String major = null;
    String eperiod = null;
    String credit = null;
    String graudate = null;
    String aperiod = null;
    String content = null;
    String actc = null;
    String actp = null;
    String cdate = null;
    String cname = null;
    String cplace = null;
    String cperiod = null;
    String company = null;
    String department = null;
    String position = null;
    String duty = null;
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

                    if (fieldName.equals("name")) {
                        name = fieldValue;
                    } else if (fieldName.equals("ename")) {
                        ename = fieldValue;
                    } else if (fieldName.equals("rno")) {
                        rno = fieldValue;
                    } else if (fieldName.equals("age")) {
                        age = fieldValue;
                    } else if (fieldName.equals("sex")) {
                        sex = fieldValue;
                    } else if (fieldName.equals("ad")) {
                        ad = fieldValue;
                    } else if (fieldName.equals("phone")) {
                        phone = fieldValue;
                    } else if (fieldName.equals("email")) {
                        email = fieldValue;
                    } else if (fieldName.equals("sname")) {
                        sname = fieldValue;
                    } else if (fieldName.equals("major")) {
                        major = fieldValue;
                    } else if (fieldName.equals("eperiod")) {
                        eperiod = fieldValue;
                    } else if (fieldName.equals("credit")) {
                        credit = fieldValue;
                    } else if (fieldName.equals("graudate")) {
                        graudate = fieldValue;
                    } else if (fieldName.equals("aperiod")) {
                        aperiod = fieldValue;
                    } else if (fieldName.equals("content")) {
                        content = fieldValue;
                    } else if (fieldName.equals("actc")) {
                        actc = fieldValue;
                    } else if (fieldName.equals("actp")) {
                        actp = fieldValue;
                    } else if (fieldName.equals("cdate")) {
                        cdate = fieldValue;
                    } else if (fieldName.equals("cname")) {
                        cname = fieldValue;
                    } else if (fieldName.equals("cplace")) {
                        cplace = fieldValue;
                    } else if (fieldName.equals("cperiod")) {
                        cperiod = fieldValue;
                    } else if (fieldName.equals("company")) {
                        company = fieldValue;
                    } else if (fieldName.equals("department")) {
                        department = fieldValue;
                    } else if (fieldName.equals("position")) {
                        position = fieldValue;
                    } else if (fieldName.equals("duty")) {
                        duty = fieldValue;
                    }
                    
                }
            }

            ResumeObject resumeObject = new ResumeObject();
            //resumeObject.setUser_id(uid);
            resumeObject.setName(name);
            resumeObject.setEname(ename);
            resumeObject.setRno(rno);
            resumeObject.setAge(age);
            resumeObject.setSex(sex);
            resumeObject.setAd(ad);
            resumeObject.setPhone(phone);
            resumeObject.setEmail(email);
            resumeObject.setSname(sname);
            resumeObject.setMajor(major);
            resumeObject.setEperiod(eperiod);
            resumeObject.setCredit(credit);
            resumeObject.setGraudate(graudate);
            resumeObject.setAperiod(aperiod);
            resumeObject.setContent(content);
            resumeObject.setActc(actc);
            resumeObject.setActp(actp);
            resumeObject.setCdate(cdate);
            resumeObject.setCname(cname);
            resumeObject.setCplace(cplace);
            resumeObject.setCperiod(cperiod);
            resumeObject.setCompany(company);
            resumeObject.setDepartment(department);
            resumeObject.setPosition(position);
            resumeObject.setDuty(duty);

            // 파일 첨부를 하지 않은 경우에만 DB에 저장
            if (!fileName.equals("파일 없음") && !filePath.equals("파일 없음")) {
                
                resumeObject.setFilename(fileName);
                resumeObject.setFileroot(filePath);
                fileservername = fileName + dommy;
                resumeObject.setFileservername(fileservername);
            }

            ResumeDAO resumeDAO = new ResumeDAO();
            int rowCount = resumeDAO.insertBoard(resumeObject);

            response.sendRedirect(request.getContextPath()+"/mainhomepage.jsp");
        }
    } else {
        // 파일 첨부를 하지 않은 경우 DB에 저장
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

        ResumeObject resumeObject = new ResumeObject();
        //resumeObject.setUser_id(uid);
        resumeObject.setName(name);
        resumeObject.setEname(ename);
        resumeObject.setRno(rno);
        resumeObject.setAge(age);
        resumeObject.setSex(sex);
        resumeObject.setAd(ad);
        resumeObject.setPhone(phone);
        resumeObject.setEmail(email);
        resumeObject.setSname(sname);
        resumeObject.setMajor(major);
        resumeObject.setEperiod(eperiod);
        resumeObject.setCredit(credit);
        resumeObject.setGraudate(graudate);
        resumeObject.setAperiod(aperiod);
        resumeObject.setContent(content);
        resumeObject.setActc(actc);
        resumeObject.setActp(actp);
        resumeObject.setCdate(cdate);
        resumeObject.setCname(cname);
        resumeObject.setCplace(cplace);
        resumeObject.setCperiod(cperiod);
        resumeObject.setCompany(company);
        resumeObject.setDepartment(department);
        resumeObject.setPosition(position);
        resumeObject.setDuty(duty);

        ResumeDAO resumeDAO = new ResumeDAO();
        int rowCount = resumeDAO.insertBoard(resumeObject);

        response.sendRedirect(request.getContextPath()+"/mainhomepage.jsp");
    }
%>


<%
/*
request.setCharacterEncoding("UTF-8");
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
int rowCount = resumeDAO.insertBoard(resumeObject);

response.sendRedirect(request.getContextPath()+"/Resume/boardList.jsp");
*/
%>