package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {
    private final String driverClassName = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://34.64.249.77:3306/cap2?serverTimezone=UTC";
    private final String username = "cap2";
    private final String password = "cap2";
    
    // 테이블 : board , 기능 : 데이터 수정 
    public int updateBoard(BoardObject boardObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "UPDATE cap2.Board SET Board_name=?, Board_title=?, Board_sal_type=?, Board_sal=?, Board_region=?, Board_work_type=?, Board_min_ability=?, Board_max_ability=?, Board_career=?, Board_post_address=?, Board_road_address=?, Board_detail_address=?, Board_employ_code=?, Board_job_type_code=?, Board_prefer=?, Board_last_update_date=now() WHERE Board_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,boardObject.getName());
            statement.setString(2,boardObject.getTitle());
            statement.setString(3,boardObject.getSaltype());
            statement.setString(4,boardObject.getSal());
            statement.setString(5,boardObject.getRegion());
            statement.setString(6,boardObject.getWorktype());
            statement.setString(7,boardObject.getMinability());
            statement.setString(8,boardObject.getMaxability());
            statement.setString(9,boardObject.getCareer());
            statement.setString(10,boardObject.getPostad());
            statement.setString(11,boardObject.getRoadad());
            statement.setString(12,boardObject.getDetailad());
            statement.setString(13,boardObject.getEmploycode());
            statement.setString(14,boardObject.getJobtypecode());
            statement.setString(15,boardObject.getPrefer());
            statement.setInt(16,boardObject.getNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 데이터 삭제 
    public int deleteBoard(BoardObject boardObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "DELETE FROM cap2.Board WHERE Board_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1,boardObject.getNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 하나의 데이터 가져오기
    public BoardObject selectBoardByKey(int no) {
        BoardObject boardObject = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT Board_name, Board_title, Board_sal_type, Board_sal, Board_region, Board_work_type, Board_min_ability, Board_max_ability, Board_career, Board_end_date, Board_post_address, Board_road_address, Board_detail_address, Board_employ_code, Board_job_type_code, Board_prefer, Board_date, Board_last_update_date FROM cap2.Board WHERE Board_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, no);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                boardObject = new BoardObject();
                boardObject.setNo(no);
                boardObject.setName(resultset.getString("Board_name"));
                boardObject.setTitle(resultset.getString("Board_title"));
                boardObject.setSaltype(resultset.getString("Board_sal_type"));
                boardObject.setSal(resultset.getString("Board_sal"));
                boardObject.setRegion(resultset.getString("Board_region"));
                boardObject.setWorktype(resultset.getString("Board_work_type"));
                boardObject.setMinability(resultset.getString("Board_min_ability"));
                boardObject.setMaxability(resultset.getString("Board_max_ability"));
                boardObject.setCareer(resultset.getString("Board_career"));
                boardObject.setEnddate(resultset.getString("Board_end_date"));
                boardObject.setPostad(resultset.getString("Board_post_address"));
                boardObject.setRoadad(resultset.getString("Board_road_address"));
                boardObject.setDetailad(resultset.getString("Board_detail_address"));
                boardObject.setEmploycode(resultset.getString("Board_employ_code"));
                boardObject.setJobtypecode(resultset.getString("Board_job_type_code"));
                boardObject.setPrefer(resultset.getString("Board_prefer"));
                boardObject.setDate(resultset.getString("Board_date"));
                boardObject.setLastupdatedate(resultset.getString("Board_last_update_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return boardObject;
    }
    
    // 테이블 : board , 기능 : 한 페이지의 데이터 가져오기 
    public List<BoardObject> selectBoardListPerPage(int beginRow, int pagePerRow) {
        List<BoardObject> list = new ArrayList<BoardObject>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT Board_no, Board_name, Board_title, Board_last_update_date, Board_end_date FROM cap2.Board ORDER BY Board_date DESC LIMIT ?, ?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, beginRow);
            statement.setInt(2, pagePerRow);
            resultset = statement.executeQuery();
            while(resultset.next()) {
                BoardObject boardObject = new BoardObject();
                boardObject.setNo(resultset.getInt("Board_no"));
                boardObject.setName(resultset.getString("Board_name"));
                boardObject.setTitle(resultset.getString("Board_title"));
                boardObject.setLastupdatedate(resultset.getString("Board_last_update_date"));
                boardObject.setEnddate(resultset.getString("Board_end_date"));
                list.add(boardObject);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return list;
    }
    
    // 테이블 : board , 기능 : 전체 로우 카운터 가져오기
    public int selectTotalBoardCount() {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT COUNT(*) FROM cap2.Board";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                rowCount = resultset.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 데이터 입력하기
    public int insertBoard(BoardObject boardObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO cap2.Board(Board_name, Board_title, Board_sal_type, Board_sal, Board_region, Board_work_type, Board_min_ability, Board_max_ability, Board_career, Board_end_date, Board_post_address, Board_road_address, Board_detail_address, Board_employ_code, Board_job_type_code, Board_prefer, Board_date, Board_last_update_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),now())";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,boardObject.getName());
            statement.setString(2,boardObject.getTitle());
            statement.setString(3,boardObject.getSaltype());
            statement.setString(4,boardObject.getSal());
            statement.setString(5,boardObject.getRegion());
            statement.setString(6,boardObject.getWorktype());
            statement.setString(7,boardObject.getMinability());
            statement.setString(8,boardObject.getMaxability());
            statement.setString(9,boardObject.getCareer());
            statement.setString(10,boardObject.getEnddate());
            statement.setString(11,boardObject.getPostad());
            statement.setString(12,boardObject.getRoadad());
            statement.setString(13,boardObject.getDetailad());
            statement.setString(14,boardObject.getEmploycode());
            statement.setString(15,boardObject.getJobtypecode());
            statement.setString(16,boardObject.getPrefer());
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
        } catch(Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    private void close(Connection connection, Statement statement, ResultSet resultset) {
        if(resultset != null) {
            try {
                resultset.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
