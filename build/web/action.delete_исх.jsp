<%-- 
    Document   : action.delete
    Created on : 11.07.2015, 16:00:36
    Author     : Pavel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
        %>
        <%
            Connection conn = null;
            Statement stmt = null;
            try {
                String userName = "root";
                String password = "12345";
                /* имя пользователя в СУБД MySQL и его пароль*/
                String url = "jdbc:mysql://localhost:3306/kurs";
                /*Строка, подключения к бд, тут указывается что у нас локальный сервер MySQL (localhost) и база данных называется kurs.*/
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, userName, password);
                out.print("Удачное подключение<br>");
                stmt = conn.createStatement();
                stmt.executeUpdate("DELETE FROM users WHERE id_user >= 13");
            } catch (Exception e) {
                out.print("Нет соединения с базой данных<br>");
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        stmt.close();
                        conn.close();
                        out.print("Соединение завершено<br>");
                    } catch (Exception e) {
                    }
                }
            }
        %>
    </body>
</html>
