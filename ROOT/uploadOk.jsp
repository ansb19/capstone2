<%@page import="java.util.Enumeration"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<%

    String path = "/var/lib/tomcat9/webapps/ROOT/files";

    //String path = application.getRealPath("fileFolder"); 

   //getRealPath를 사용하면 경로값이 null로 잡힌다. 이유를 아시는분 쪽지 부탁드립니다.

    int size = 1024 * 1024 * 10;

    String file = "";


    try{

        MultipartRequest multi = new MultipartRequest(request,path,size,"EUC-KR",new DefaultFileRenamePolicy());


        Enumeration files = multi.getFileNames();

        String str = (String)files.nextElement();

        

        file = multi.getFilesystemName(str);

    }catch(Exception e)

    {

        e.printStackTrace();

    }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

</head>

<body>

    file upload success!

</body>

</html>