package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ResumeDAO {
    private final String driverClassName = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://34.64.249.77:3306/cap2?serverTimezone=UTC";
    private final String username = "cap2";
    private final String password = "cap2";
    
    // 테이블 : board , 기능 : 데이터 수정 
    public int updateBoard(ResumeObject resumeObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "UPDATE cap2.Resume SET Resume_name=?, Resume_en_name=?, Resume_resident_no=?, Resume_age=?, Resume_sex=?, Resume_address=?, Resume_phone=?, Resume_email=?, Resume_edu_school_name=?, Resume_edu_major=?, Resume_edu_enroll_period=?, Resume_edu_credit=?, Resume_edu_graudate_check=?, Resume_act_period=?, Resume_act_content=?, Resume_act_check=?, Resume_act_place=?, Resume_cert_date=?, Resume_cert_name=?, Resume_cert_place=?, Resume_career_period=?, Resume_career_company=?, Resume_career_department=?, Resume_career_position=?, Resume_career_duty=?, Support_file_name=?, Support_file_root=?, Support_file_servername=?, Resume_date=now() WHERE Resume_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,resumeObject.getName());
            statement.setString(2,resumeObject.getEname());
            statement.setString(3,resumeObject.getRno());
            statement.setString(4,resumeObject.getAge());
            statement.setString(5,resumeObject.getSex());
            statement.setString(6,resumeObject.getAd());
            statement.setString(7,resumeObject.getPhone());
            statement.setString(8,resumeObject.getEmail());
            statement.setString(9,resumeObject.getSname());
            statement.setString(10,resumeObject.getMajor());
            statement.setString(11,resumeObject.getEperiod());
            statement.setString(12,resumeObject.getCredit());
            statement.setString(13,resumeObject.getGraudate());
            statement.setString(14,resumeObject.getAperiod());
            statement.setString(15,resumeObject.getContent());
            statement.setString(16,resumeObject.getActc());
            statement.setString(17,resumeObject.getActp());
            statement.setString(18,resumeObject.getCdate());
            statement.setString(19,resumeObject.getCname());
            statement.setString(20,resumeObject.getCplace());
            statement.setString(21,resumeObject.getCperiod());
            statement.setString(22,resumeObject.getCompany());
            statement.setString(23,resumeObject.getDepartment());
            statement.setString(24,resumeObject.getPosition());
            statement.setString(25,resumeObject.getDuty());
            statement.setString(26,resumeObject.getFilename());
            statement.setString(27,resumeObject.getFileroot());
            statement.setString(28,resumeObject.getFileservername());
            statement.setInt(29,resumeObject.getNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 데이터 삭제 
    public int deleteBoard(ResumeObject resumeObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "DELETE FROM cap2.Resume WHERE Resume_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1,resumeObject.getNo());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 하나의 데이터 가져오기
    public ResumeObject selectBoardByKey(int no) {
        ResumeObject resumeObject = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT * FROM cap2.Resume WHERE Resume_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, no);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                resumeObject = new ResumeObject();
                
                resumeObject.setNo(no);
                resumeObject.setName(resultset.getString("Resume_name"));
                resumeObject.setEname(resultset.getString("Resume_en_name"));
                resumeObject.setRno(resultset.getString("Resume_resident_no"));
                resumeObject.setAge(resultset.getString("Resume_age"));
                resumeObject.setSex(resultset.getString("Resume_sex"));
                resumeObject.setAd(resultset.getString("Resume_address"));
                resumeObject.setPhone(resultset.getString("Resume_phone"));
                resumeObject.setEmail(resultset.getString("Resume_email"));
                resumeObject.setSname(resultset.getString("Resume_edu_school_name"));
                resumeObject.setMajor(resultset.getString("Resume_edu_major"));
                resumeObject.setEperiod(resultset.getString("Resume_edu_enroll_period"));
                resumeObject.setCredit(resultset.getString("Resume_edu_credit"));
                resumeObject.setGraudate(resultset.getString("Resume_edu_graudate_check"));
                resumeObject.setAperiod(resultset.getString("Resume_act_period"));
                resumeObject.setContent(resultset.getString("Resume_act_content"));
                resumeObject.setActc(resultset.getString("Resume_act_check"));
                resumeObject.setActp(resultset.getString("Resume_act_place"));
                resumeObject.setCdate(resultset.getString("Resume_cert_date"));
                resumeObject.setCname(resultset.getString("Resume_cert_name"));
                resumeObject.setCplace(resultset.getString("Resume_cert_place"));
                resumeObject.setCperiod(resultset.getString("Resume_career_period"));
                resumeObject.setCompany(resultset.getString("Resume_career_company"));
                resumeObject.setDepartment(resultset.getString("Resume_career_department"));
                resumeObject.setPosition(resultset.getString("Resume_career_position"));
                resumeObject.setDuty(resultset.getString("Resume_career_duty"));
                resumeObject.setFileservername(resultset.getString("Resume_file_servername"));
                resumeObject.setDate(resultset.getString("Resume_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return resumeObject;
    }
    
    // 테이블 : board , 기능 : 한 페이지의 데이터 가져오기 
    public List<ResumeObject> selectBoardListPerPage(int beginRow, int pagePerRow) {
        List<ResumeObject> list = new ArrayList<ResumeObject>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT Resume_no, Resume_name, Resume_age, Resume_sex, Resume_edu_major, Resume_date FROM cap2.Resume ORDER BY Resume_date DESC LIMIT ?, ?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, beginRow);
            statement.setInt(2, pagePerRow);
            resultset = statement.executeQuery();
            while(resultset.next()) {
                ResumeObject resumeObject = new ResumeObject();
                resumeObject.setNo(resultset.getInt("Resume_no"));
                resumeObject.setName(resultset.getString("Resume_name"));
                resumeObject.setAge(resultset.getString("Resume_age"));
                resumeObject.setSex(resultset.getString("Resume_sex"));
                resumeObject.setMajor(resultset.getString("Resume_edu_major"));
                resumeObject.setDate(resultset.getString("Resume_date"));
                list.add(resumeObject);
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
        String sql = "SELECT COUNT(*) FROM cap2.Resume";
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
    public int insertBoard(ResumeObject resumeObject) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO "
        + "cap2.Resume(Resume_name, Resume_en_name, Resume_resident_no, Resume_age, Resume_sex, Resume_address, Resume_phone, Resume_email, Resume_edu_school_name, Resume_edu_major, Resume_edu_enroll_period, Resume_edu_credit, Resume_edu_graudate_check, Resume_act_period, Resume_act_content, Resume_act_check, Resume_act_place, Resume_cert_date, Resume_cert_name, Resume_cert_place, Resume_career_period, Resume_career_company, Resume_career_department, Resume_career_position, Resume_career_duty, Resume_file_name, Resume_file_root, Resume_file_servername, Resume_date)"
        + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
        
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);

            statement.setString(1,resumeObject.getName());
            statement.setString(2,resumeObject.getEname());
            statement.setString(3,resumeObject.getRno());
            statement.setString(4,resumeObject.getAge());
            statement.setString(5,resumeObject.getSex());
            statement.setString(6,resumeObject.getAd());
            statement.setString(7,resumeObject.getPhone());
            statement.setString(8,resumeObject.getEmail());
            statement.setString(9,resumeObject.getSname());
            statement.setString(10,resumeObject.getMajor());
            statement.setString(11,resumeObject.getEperiod());
            statement.setString(12,resumeObject.getCredit());
            statement.setString(13,resumeObject.getGraudate());
            statement.setString(14,resumeObject.getAperiod());
            statement.setString(15,resumeObject.getContent());
            statement.setString(16,resumeObject.getActc());
            statement.setString(17,resumeObject.getActp());
            statement.setString(18,resumeObject.getCdate());
            statement.setString(19,resumeObject.getCname());
            statement.setString(20,resumeObject.getCplace());
            statement.setString(21,resumeObject.getCperiod());
            statement.setString(22,resumeObject.getCompany());
            statement.setString(23,resumeObject.getDepartment());
            statement.setString(24,resumeObject.getPosition());
            statement.setString(25,resumeObject.getDuty());
            statement.setString(26,resumeObject.getFilename());
            statement.setString(27,resumeObject.getFileroot());
            statement.setString(28,resumeObject.getFileservername());
            // statement.setString(29,resumeObject.getUser_id());

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
