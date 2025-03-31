package dbconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import java.lang.Integer;
import java.util.ArrayList;

public class UserDAO { // 유저 정보 CRUD 하는 클래스

    public int insert(String User_id, String User_passwd, String User_name, String User_birth, String User_sex,
            String User_type, String User_email, String User_phone, String User_address)
            throws NamingException, SQLException, ClassNotFoundException { // 유저 회원 가입시 정보 삽입하면 insert 하는 함수

        int result = 0;

        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        // ResultSet rs = null;


        String sql = String.format("insert into User (%s,%s,%s,%s,%s,%s,%s,%s,%s) values(?,?,?,?,?,?,?,?,?)",
                "User_id", "User_passwd", "User_name", "User_birth", "User_sex", "User_type", "User_email",
                "User_phone", "User_address");

        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, User_id);
        pstmt.setString(2, User_passwd);
        pstmt.setString(3, User_name);
        pstmt.setInt(4, Integer.parseInt(User_birth));
        pstmt.setString(5, User_sex);
        pstmt.setString(6, User_type);
        pstmt.setString(7, User_email);
        pstmt.setString(8, User_phone);
        pstmt.setString(9, User_address);

        result = pstmt.executeUpdate();

        // rs.close();
        pstmt.close();
        DBConn.close();
        
        return result;
    }

    //로그인 조건별 설정 함수
    public String login(String User_id, String User_passwd, String User_type)
            throws NamingException, SQLException, ClassNotFoundException {

        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String logincheck = "값 없음";
        String sql = "SELECT * FROM User WHERE User_id = ? and User_type = ?";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, User_id);
        pstmt.setString(2, User_type);
        // pstmt.setString(2, User_passwd);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String storedPassword = rs.getString("User_passwd");

            if (User_passwd.equals(storedPassword)) {
                // System.out.println("로그인 성공!");
                
                if(rs.getString("User_cert").equals("yes")){
                    logincheck = "로그인성공";
                }
                else{
                    logincheck = "이메일미인증";
                }

            } else {
                // System.out.println("비밀번호가 일치하지 않습니다.");
                logincheck = "비밀번호 불일치";
            }
        } else {
            // System.out.println("해당하는 아이디가 없습니다.");
            logincheck = "아이디 없음";
        }

        rs.close();
        pstmt.close();
        DBConn.close();

        return logincheck;
    }

    // 유저 회원 탈퇴시 delete 하는 함수
    public void delete(String User_id)
            throws NamingException, SQLException, ClassNotFoundException { 

        int result = 0;

        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        // ResultSet rs = null;

        String sql = String.format("delete from User where %s = ?",
                "User_id");

        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, User_id);

        result = pstmt.executeUpdate();

        // rs.close();
        pstmt.close();
        DBConn.close();

    }


    public void update(String User_id, String User_passwd, String User_email, String User_phone, String User_address)
            throws NamingException, SQLException, ClassNotFoundException { // 개인 정보 수정 update

        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        int result = 0;

        String sql = "update User set User_passwd = ? , User_email = ?, User_phone = ?, User_address = ? where User_id = ?";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, User_passwd);
        pstmt.setString(2, User_email);
        pstmt.setString(3, User_phone);
        pstmt.setString(4, User_address);
        pstmt.setString(5, User_id);

        result = pstmt.executeUpdate();

        pstmt.close();
        DBConn.close();

    }


    // 이메일 인증 개인정보수정 시 사용
    public void emailcert(String User_id, String User_email)
            throws NamingException, SQLException, ClassNotFoundException { 

        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        int result = 0;
        String cert = "yes";

        String sql = "update User set User_email = ?, User_cert = ? where User_id = ?";

        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, User_email);
        pstmt.setString(2, cert);
        pstmt.setString(3, User_id);
        
        result = pstmt.executeUpdate();

        pstmt.close();
        DBConn.close();
        
    }

    // 아이디를 통한 한줄 출력
    public UserObject selectUserByID(String User_id) { 
        UserObject userobj = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM User where User_id = ?";

        try {
        conn = DBConn.getConnection();

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, User_id);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            userobj = new UserObject();

            userobj.setUser_id(rs.getString("User_id"));
            userobj.setUser_passwd(rs.getString("User_passwd"));
            userobj.setUser_name(rs.getString("User_name"));
            userobj.setUser_birth(rs.getString("User_birth"));
            userobj.setUser_sex(rs.getString("User_sex"));
            userobj.setUser_type(rs.getString("User_type"));
            userobj.setUser_email(rs.getString("User_email"));
            userobj.setUser_phone(rs.getString("User_phone"));
            userobj.setUser_cert(rs.getString("User_cert"));
            userobj.setUser_address(rs.getString("User_address"));
            userobj.setUser_resume_check(rs.getString("User_resume_check"));
        }
        
            rs.close();
            pstmt.close();
            DBConn.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return userobj;
    }

    public ArrayList<UserObject>select() { 
        
        ArrayList<UserObject> users = new ArrayList<UserObject>();
        UserObject userobj = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM User;";

        try {
        conn = DBConn.getConnection();

        pstmt = conn.prepareStatement(sql);

        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            userobj = new UserObject();

            userobj.setUser_id(rs.getString("User_id"));
            userobj.setUser_passwd(rs.getString("User_passwd"));
            userobj.setUser_name(rs.getString("User_name"));
            userobj.setUser_birth(rs.getString("User_birth"));
            userobj.setUser_sex(rs.getString("User_sex"));
            userobj.setUser_type(rs.getString("User_type"));
            userobj.setUser_email(rs.getString("User_email"));
            userobj.setUser_phone(rs.getString("User_phone"));
            userobj.setUser_cert(rs.getString("User_cert"));
            userobj.setUser_address(rs.getString("User_address"));
            userobj.setUser_resume_check(rs.getString("User_resume_check"));

            users.add(userobj);
        }
        
            rs.close();
            pstmt.close();
            DBConn.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return users;
    }
}
