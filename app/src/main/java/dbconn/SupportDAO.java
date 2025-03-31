package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SupportDAO {

    DBConnectInfo DBinfo = new DBConnectInfo();

    private final String driverClassName = "com.mysql.cj.jdbc.Driver";
    private final String url = DBinfo.getJdbcDriver();
    private final String username = DBinfo.getDbUser();
    private final String password = DBinfo.getDbPass();

    // 테이블 : Support , 기능 : 데이터 수정
    public int updateSupport(SupportObject supportObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = String.format("UPDATE cap2.Support SET %s=?, %s=?, %s=?, %s=?,%s=?, %s=now(), %s=? WHERE Support_no=?"
        , "Support_title", "Support_content", "Support_file_name", "Support_file_root", 
         "Support_file_servername", "Support_date", "Support_check");
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, supportObject.getTitle());
            statement.setString(2, supportObject.getContent());
            statement.setString(3, supportObject.getFilename());
            statement.setString(4, supportObject.getFileroot());
            statement.setString(5, supportObject.getFileservername());
            statement.setString(6, supportObject.getOpencheck());
            statement.setInt(7, supportObject.getNo());
            
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }

    // 테이블 : Support , 기능 : 데이터 삭제
    public int deleteSupport(SupportObject supportObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "DELETE FROM cap2.Support WHERE Support_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, supportObject.getNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }

    // 테이블 : Support , 기능 : 하나의 데이터 가져오기
    public SupportObject selectSupportByKey(int no) {
        SupportObject supportObject = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT * FROM cap2.Support WHERE Support_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, no);
            resultset = statement.executeQuery();
            if (resultset.next()) {
                supportObject = new SupportObject();

                supportObject.setNo(no);
                supportObject.setSendid(resultset.getString("Support_send_id"));
                supportObject.setReceiveid(resultset.getString("Support_receive_id"));
                supportObject.setTitle(resultset.getString("Support_title"));
                supportObject.setContent(resultset.getString("Support_content"));
                supportObject.setFilename(resultset.getString("Support_file_name"));
                supportObject.setFileroot(resultset.getString("Support_file_root"));
                supportObject.setFileservername(resultset.getString("Support_file_servername"));
                supportObject.setDate(resultset.getString("Support_date"));
                supportObject.setOpencheck(resultset.getString("Support_check"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return supportObject;
    }

    // 테이블 : Support , 기능 : 한 페이지의 데이터 가져오기
    public List<SupportObject> selectSupportListPerPage(int beginRow, int pagePerRow) {
        List<SupportObject> list = new ArrayList<SupportObject>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT * FROM cap2.Support ORDER BY Support_date DESC LIMIT ?, ?";
        
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, beginRow);
            statement.setInt(2, pagePerRow);

            resultset = statement.executeQuery();
            while (resultset.next()) {
                SupportObject supportObject = new SupportObject();
                supportObject.setNo(resultset.getInt("Support_no"));
                supportObject.setTitle(resultset.getString("Support_title"));
                supportObject.setContent(resultset.getString("Support_content"));
                supportObject.setReceiveid(resultset.getString("Support_receive_id"));
                supportObject.setSendid(resultset.getString("Support_send_id"));
                supportObject.setDate(resultset.getString("Support_date"));
                supportObject.setOpencheck(resultset.getString("Support_check"));
                list.add(supportObject);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return list;
    }

    public List<SupportObject> selectSupportListPerPageSearch(int beginRow, int pagePerRow, String keyword) {
        List<SupportObject> list = new ArrayList<SupportObject>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT * FROM cap2.Support WHERE Support_title LIKE ? OR Support_send_id LIKE ? OR Support_receive_id LIKE ? ORDER BY Support_date DESC LIMIT ?, ?;";
        
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+keyword+"%");
            statement.setString(2, "%"+keyword+"%");
            statement.setString(3, "%"+keyword+"%");
            statement.setInt(4, beginRow);
            statement.setInt(5, pagePerRow);

            resultset = statement.executeQuery();
            while (resultset.next()) {
                SupportObject supportObject = new SupportObject();
                supportObject.setNo(resultset.getInt("Support_no"));
                supportObject.setTitle(resultset.getString("Support_title"));
                supportObject.setContent(resultset.getString("Support_content"));
                supportObject.setReceiveid(resultset.getString("Support_receive_id"));
                supportObject.setSendid(resultset.getString("Support_send_id"));
                supportObject.setDate(resultset.getString("Support_date"));
                supportObject.setOpencheck(resultset.getString("Support_check"));
                list.add(supportObject);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return list;
    }

    

    // 테이블 : Support , 기능 : 전체 로우 카운터 가져오기
    public int selectTotalSupportCount() {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT COUNT(*) FROM cap2.Support";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            resultset = statement.executeQuery();
            if (resultset.next()) {
                rowCount = resultset.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return rowCount;
    }

    public int selecttypeSupportCount(String type,String id) {

        String select;
        if(type.equals("business")){
            select = "Support_receive_id";
        }
        else{
            select ="Support_send_id";
        }
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = String.format("SELECT COUNT(%s) FROM cap2.Support where %s = ?", select, select);
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            resultset = statement.executeQuery();
            if (resultset.next()) {
                rowCount = resultset.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return rowCount;
    }

    // 테이블 : Support , 기능 : 지원서 작성(데이터 추가)
    public int insertSupport(SupportObject supportObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = String.format(
                "INSERT INTO cap2.Support(%s, %s, %s, %s, %s, %s, %s, %s) values(?,?,?,?,?,?,?,now())",
                "Support_send_id", "Support_receive_id", "Support_title", "Support_content", "Support_file_name",
                "Support_file_root", "Support_file_servername", "Support_date");

        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);

            statement.setString(1, supportObject.getSendid());
            statement.setString(2, supportObject.getReceiveid());
            statement.setString(3, supportObject.getTitle());
            statement.setString(4, supportObject.getContent());
            statement.setString(5, supportObject.getFilename());
            statement.setString(6, supportObject.getFileroot());
            statement.setString(7, supportObject.getFileservername());
            
            rowCount = statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName(this.driverClassName);
            connection = DriverManager.getConnection(this.url, this.username, this.password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    private void close(Connection connection, Statement statement, ResultSet resultset) {
        if (resultset != null) {
            try {
                resultset.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
