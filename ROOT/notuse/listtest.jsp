 <%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://34.64.249.77:3306/user?serverTimezone=UTC";
	String id = "cap2";
	String pass = "cap2";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		PreparedStatement pstmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM board";
		ResultSet rs = pstmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT from board order by NUM DESC";
		rs = pstmt.executeQuery(sqlList);
		

	if(total==0) {

	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String name = rs.getString(2);
			String title = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
		
%>

<% 
		}
	} 
	rs.close();
	pstmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
