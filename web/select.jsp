<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager" %>


<%--<%@ page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = null;
            //PreparedStatement pstmt = null;
            Statement pstmt = null;
            try {
                String userName = "root";
                String password = "12345";
                /* имя пользователя в СУБД MySQL и его пароль*/
                String url = "jdbc:mysql://localhost:3306/kurs";
                /*Строка, подключения к бд, тут указывается что у нас локальный сервер MySQL (localhost) и база данных называется kurs.*/
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, userName, password);
                //    String query = "SELECT id_user, surname, name FROM users WHERE surname like ?";
                String query = "SELECT u.id_user, u.surname, u.name, u.email, s.sex FROM users as u, sex as s WHERE u.sex=s.id";
                //    pstmt = conn.prepareStatement(query);
                pstmt = conn.createStatement();
                String surnameQuery = request.getParameter("surname");
                surnameQuery = "%" + surnameQuery + "%";
//                pstmt.setString(1, surnameQuery);
//                ResultSet rs=pstmt.executeQuery();
                ResultSet rs = pstmt.executeQuery(query);
        %>        
            <table border="1">                
                <tr> 
                    <th>ID</th>
                    <th>Фамилия</th>
                    <th>Имя</th>
                    <th>E-mail</th>
                    <th>Пол</th>
                </tr>
                <%while (rs.next()) {
                        int id_user = rs.getInt(1);
                        String surname = rs.getString(2);
                        String name = rs.getString(3);
                        String email = rs.getString(4);
                        String sex = rs.getString(5);
                %>
                <tr>
                    <td> <%= id_user%></td>
                    <td> <%= surname%></td>
                    <td> <%= name%></td>
                    <td> <%= email%></td>
                    <td> <%= sex%></td>
                </tr>
                <%}%>
            </table> 
            <input value="Назад" type="button" onclick="window.location.href = 'index.jsp'"> <br>
        <%

            } catch (Exception e) {
                //out.print("Нет соединения с базой данных<br>");
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                //        out.print("Соединение завершено<br>");
                    } catch (Exception e) {
                    }
                }
            }

        %>
    </body>
</html>