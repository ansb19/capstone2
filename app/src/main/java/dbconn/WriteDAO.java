
package dbconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author dhkdw
 */
public class WriteDAO { // write 데이터 액세스 오브젝트 제어 클래스
    
    //글쓰기 조회
    public ArrayList<WriteObject> getListWrite() throws NamingException, SQLException, ClassNotFoundException {
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        if (conn == null) {
            System.out.println("데이터베이스 연결 실패 에러입니다.");
            System.exit(0);
        }

        ArrayList<WriteObject> writes = new ArrayList<WriteObject>();
        WriteObject write = null;
        String sql = "SELECT * "
                + "FROM cap2.board";

        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            write = new WriteObject();
            write.setUser(rs.getString("USERNAME"));
            write.setTitle(rs.getString("TITLE"));
            write.setContent(rs.getString("MEMO"));
          
            
            writes.add(write);
        }

        rs.close();
        pstmt.close();
        DBConn.close();
        return writes;
    }
    //글쓰기 수정
    
    //글쓰기 삭제
    
    //글쓰기 생성
    
}
