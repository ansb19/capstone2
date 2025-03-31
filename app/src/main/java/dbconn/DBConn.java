/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author dhkdw
 */
public class DBConn { // DB 접속 제어하는 클래스

    private static Connection dbConn;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (dbConn == null) {
            DBConnectInfo DBinfo = new DBConnectInfo();
            
            String url = DBinfo.getJdbcDriver();
            String user = DBinfo.getDbUser();
            String pwd = DBinfo.getDbPass();

            Class.forName("com.mysql.cj.jdbc.Driver");
            dbConn = DriverManager.getConnection(url, user, pwd);
        }
        return dbConn;
    }

    public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException {
        if (dbConn == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            dbConn = DriverManager.getConnection(url, user, pwd);
        }

        return dbConn;
    }

    public static void close() throws SQLException {
        if (dbConn != null) {
            if (!dbConn.isClosed()) {
                dbConn.close();
            }
        }

        dbConn = null;

    }
}
