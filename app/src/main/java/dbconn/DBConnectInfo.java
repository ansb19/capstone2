/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbconn;

/**
 *
 * @author dhkdw
 */
public class DBConnectInfo { //DB 정보 담긴 클래스 (객체)

    private String jdbcDriver = "jdbc:mysql://34.64.249.77:3306/cap2?serverTimezone=UTC";
    private String dbUser = "cap2";
    private String dbPass = "cap2";

    public String getJdbcDriver() {
        return jdbcDriver;
    }

    public String getDbUser() {
        return dbUser;
    }

    public String getDbPass() {
        return dbPass;
    }

}
