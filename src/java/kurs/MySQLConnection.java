package kurs;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class MySQLConnection {

    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            String userName = "root";
            String password = "12345";
            /* имя пользователя в СУБД MySQL и его пароль*/
            String url = "jdbc:mysql://localhost:3306/kurs";
            /*Строка, подключения к бд, тут указывается что у нас локальный сервер MySQL (localhost) и база данных называется kurs.*/
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, userName, password);
            System.out.println("Удачное подключение");
            String query = "insert into users(surname, name, email, sex) values(?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query); // create a statement
            pstmt.setString(1, "Сидорова"); // set input parameter 1
            pstmt.setString(2, "Прасковья"); // set input parameter 2
            pstmt.setString(3, "25@ua.ru"); // set input parameter 3
            pstmt.setInt(4, 2); // set input parameter 2
            pstmt.executeUpdate(); // execute insert statement
        } catch (Exception e) {
            System.err.println("Нет соединения с базой данных");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("Соединение завершено");
                } catch (Exception e) {
                }
            }
        }
    }
}
