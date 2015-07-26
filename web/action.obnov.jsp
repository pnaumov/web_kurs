<%-- 
    Document   : action.save
    Created on : 11.07.2015, 14:40:26
    Author     : Pavel
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
            request.setCharacterEncoding("UTF-8");
            String id = request.getParameter("id");
            String surname = request.getParameter("surname");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            int sex = Integer.parseInt(request.getParameter("sex"));
                        
            out.print(surname + "<br>");
            out.print(name + "<br>");
            out.print(email + "<br>");
            out.print(sex + "<br>");
        %>
        <%
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
                out.print("Удачное подключение<br>");
//              String query = "insert into users(surname, name, email, sex) values(?, ?, ?, ?)";
                String query = "update users set surname = ?, name = ?, email = ?, sex = ? where id_user=" +id;
                pstmt = conn.prepareStatement(query); // create a statement
                out.print(query+"<br>");
                pstmt.setString(1, surname); // set input parameter 1
                pstmt.setString(2, name); // set input parameter 2
                pstmt.setString(3, email); // set input parameter 3
                pstmt.setInt(4, sex); // set input parameter 2
                pstmt.executeUpdate(); // execute insert statement
            } catch (Exception e) {
                out.print("Нет соединения с базой данных<br>");
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                        //out.print("Соединение завершено<br>");
                    } catch (Exception e) {
                    }
                }
            }

        %>
    </body>
</html>
