<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="dbconn.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.NamingException" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<style>

table {

	width: 900px;

	margin-left: auto;

	margin-right: auto;

}

table .subject {

	width: 400px;

}



div#PageBlock {

	width: 800px;

	margin-left: auto;

	margin-right: auto;

	text-align: center;

}





</style>

</head>

<body>

<%

	// DB객체생성

	BoardDao boardDao = new BoardDao();

	// int count = 전체 글개수 구하기  getBoardCount() 메소드호출

	// DB함수  max()  min()  sum()   count()

	int count = boardDao.getBoardCount();



	// 우리가 원하는 페이지 가져오기

	// 한페이지당 보여줄 글개수 설정

	int pageSize = 3;

	// 페이지 가져오기

	String strPageNum = request.getParameter("pageNum");

	if (strPageNum == null) {

		strPageNum = "1";

	}

	int pageNum = Integer.parseInt(strPageNum);

	// 시작(첫)행번호 구하기

	int startRow = (pageNum-1)*pageSize+1;

	// 마지막(끝)행번호 구하기

	int endRow = pageNum * pageSize;



	List<BoardBean> list = null;

	list = boardDao.getBoards(startRow, endRow);

%>

<h1>글목록(전체글:<%=count %>)</h1>

<hr>

<h3><a href="writeForm.jsp?pageNum=<%=pageNum%>">글쓰기</a></h3>

<table border="1">

<tr>

	<th>번호</th><th>제목</th><th>작성  자</th>
	<th>작성일</th><th>조회수</th><th>IP</th>

</tr>

<%

	if (list != null) {

		for (int i = 0; i < list.size(); i++) {
			BoardBean boardBean = list.get(i);

			%>

			<tr>

				<td><%=boardBean.getNum() %></td>

				<td>

				<%

				int wid = 0;

				if (boardBean.getRe_lev() > 0) {

					wid = boardBean.getRe_lev() * 10;

				%>	

			    <img src="level.gif" style="width: <%=wid %>px; height: 16px;">

			    <img src="re.gif">

				<%

				}

				%>

					<a href="content.jsp?num=<%=boardBean.getNum() %>&pageNum=<%=pageNum %>"><%=boardBean.getSubject() %></a>

				</td>

				<td><%=boardBean.getName() %></td>

				<td><%=boardBean.getReg_date() %></td>

				<td><%=boardBean.getReadcount() %></td>

				<td><%=boardBean.getIp() %></td>

			</tr>

			<%

		}

	} else { // list.size() == 0

		%>

		<tr>

			<td colspan="6">게시판 글 없음</td>

		</tr>

		<%

	}

%>

</table>

<%

	if (count > 0) {

		// 전체 페이지 개수 구하기

		// 글50개  한화면당 보여줄글 10개 => 50/10 = 몫5 + 나머지X(0페이지) => 5페이지

		// 글55개  한화면당 보여줄글 10개 => 55/10 = 몫5 + 나머지O(1페이지) => 6페이지

		int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);

		

		// 화면에 보여줄 페이지블록 개수 설정

		int pageBlock = 3;

		

		// 화면에 보여줄 시작페이지블록 구하기

		// 1~10  11~20  21~30

		// 1~10 => 1    11~20 => 11

		//int startPage = (pageNum-1) * pageBlock + 1;

		// 페이지블록   [1][2][3]  페이블록개수 3설정

		int startPage = ((pageNum/pageBlock) - (pageNum%pageBlock==0 ? 1: 0)) * pageBlock + 1;

		

		//  끝페이지블록 번호 구하기

		int endPage = startPage + pageBlock - 1;

		if (endPage > pageCount) {

			endPage = pageCount;

		}

		%>

		<div id="PageBlock">

		<%

		// [이전]

		if (startPage > pageBlock) {

			%><a href="list.jsp?pageNum=<%=startPage-1 %>">[이전]</a><%

		}

		

		// 1~10

		for (int i=startPage; i<=endPage; i++) {

		    if (i == pageNum) {

		        %>

		         <a href="list.jsp?pageNum=<%=i %>"><b>[<%=i %>]</b></a> 

		        <%

		    } else {

		        %>

		         <a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a> 

		        <%

		    }

		}

		

		// [다음]

		if (endPage < pageCount) {

			%><a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a><%

		}

		%>

		</div>

		<%

	}

%>

</body>

</html>