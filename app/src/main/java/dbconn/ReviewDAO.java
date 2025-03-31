package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO { // CRUD 추가, 삭제, 조회
    
    private final String driverClassName = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://34.64.249.77:3306/cap2?serverTimezone=UTC";
    private final String username = "cap2";
    private final String password = "cap2";
    
    // 테이블 : board , 기능 : 데이터 삭제 
    public int deleteBoard(ReviewObject reviewObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "DELETE FROM cap2.Review WHERE Review_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1,reviewObject.getNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 하나의 데이터 가져오기
    public ReviewObject selectBoardByKey(int no) {
        ReviewObject reviewObject = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT Review_title, Review_content, Review_ratings, Review_business, Review_User_id, Review_date FROM cap2.Review WHERE Review_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, no);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                reviewObject = new ReviewObject();
                reviewObject.setNo(no);
                reviewObject.setTitle(resultset.getString("Review_title"));
                reviewObject.setContent(resultset.getString("Review_content"));
                reviewObject.setCompany(resultset.getString("Review_business"));
                reviewObject.setRatings(resultset.getString("Review_ratings"));
                reviewObject.setUser_id(resultset.getString("Review_User_id"));
                reviewObject.setDate(resultset.getString("Review_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return reviewObject;
    }
    
    // 테이블 : board , 기능 : 한 페이지의 데이터 가져오기 
    public List<ReviewObject> selectBoardListPerPage(int beginRow, int pagePerRow) {
        List<ReviewObject> list = new ArrayList<ReviewObject>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT Review_no, Review_title, Review_User_id, Review_date, Review_business, Review_Ratings FROM cap2.Review ORDER BY Review_date DESC LIMIT ?, ?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, beginRow);
            statement.setInt(2, pagePerRow);
            resultset = statement.executeQuery();
            while(resultset.next()) {
                ReviewObject reviewObject = new ReviewObject();
                reviewObject.setNo(resultset.getInt("Review_no"));
                reviewObject.setTitle(resultset.getString("Review_title"));
                reviewObject.setUser_id(resultset.getString("Review_User_id"));
                reviewObject.setDate(resultset.getString("Review_date"));
                reviewObject.setCompany(resultset.getString("Review_business"));
                reviewObject.setRatings(resultset.getString("Review_Ratings"));
                list.add(reviewObject);
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
        String sql = "SELECT COUNT(*) FROM cap2.Review";
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
    public int insertBoard(ReviewObject reviewObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO cap2.Review(Review_title, Review_content, Review_ratings, Review_business, Review_User_id, Review_date) values(?,?,?,?,?,now())";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,reviewObject.getTitle());
            statement.setString(2,reviewObject.getContent());
            statement.setString(3,reviewObject.getRatings());
            statement.setString(4,reviewObject.getCompany());
            statement.setString(5,reviewObject.getUser_id());
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
