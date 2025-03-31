<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>
<%@ page import="dbconn.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD LIST</title>
</head>
<body>
<h1>BOARD LIST</h1>
<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
BoardDAO boardDAO = new BoardDAO();
int totalRowCount = boardDAO.selectTotalBoardCount();
int pagePerRow = 10; 
int beginRow = (currentPage-1)*pagePerRow;
List<BoardObject> list = boardDAO.selectBoardListPerPage(beginRow, pagePerRow);
%>

    <div>전체목록의 수 : <%=totalRowCount%>/<%=list.size()%></div>
    <table border="1">
        <thead>
            <tr>
                <th>글번호</th>
                <th>기업명</th>
                <th>제목</th>
                <th>최종수정날짜</th>
                <th>마감일자</th>
            </tr>
        </thead>
        <tbody>
<%
            for(BoardObject b : list) {
%>
                <tr>
                    <td><%=b.getNo()%></td>
                    <td><%=b.getName()%></td>
                    <td><a href="<%=request.getContextPath()%>/Board/boardView.jsp?no=<%=b.getNo()%>"><%=b.getTitle()%></a></td>
                    <td><%=b.getLastupdatedate()%></td>
                    <td><%=b.getEnddate()%></td>
                </tr>
<%        
            }
%>
        </tbody>
    </table>

    <div>
        <a href="<%=request.getContextPath()%>/Board/boardAddForm.jsp">게시글 입력</a>
    </div>
<%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>
    <div>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/Board/boardList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
        }
        if(currentPage < lastPage) {
%>

            <a href="<%=request.getContextPath()%>/Board/boardList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
        }
%>
    </div>
</body>
</html>
