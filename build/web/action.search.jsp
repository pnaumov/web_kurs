<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
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
            String surnameQuery = request.getParameter("surname");
            surnameQuery = "\"%" + surnameQuery + "%\"";
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
//              out.print("Удачное подключение<br>");
//              String query = "SELECT id_user, surname, name FROM users WHERE surname like ?";
                String query = "SELECT id_user, surname, name FROM users WHERE surname like "+ surnameQuery;
//                out.print(query +"<br>");
                pstmt = conn.prepareStatement(query);
                pstmt = conn.createStatement();
                
//                pstmt.setString(1, surnameQuery);
//                ResultSet rs=pstmt.executeQuery();
                ResultSet rs=pstmt.executeQuery(query);
        %>        
        <form method="POST" action="action.delete.jsp"> 
            <table border="1">                
                <tr> 
                    <th></th>
                    <th>ID</th>
                    <th>Фамилия</th>
                    <th>Имя</th>
                </tr>
                <%while (rs.next()) {
                    int id_user=rs.getInt(1);
                    String surname=rs.getString(2);
                    String name=rs.getString(3);
                %>
                <tr>
                    <td><input type="checkbox" name="id" value="<%= id_user%>"></td>
                    <td> <%= id_user%></td>
                    <td> <%= surname%></td>
                    <td> <%= name%></td>
                </tr>
                <%}%>
            </table> 
            <input value="Удалить запись" type="submit"> <br>
            <input value="Назад" type="button" onclick="window.location.href = 'search.jsp'"> <br>
        </form>     
        <%
                
            } catch (Exception e) {
//              out.print("Нет соединения с базой данных<br>");
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
//                      out.print("Соединение завершено<br>");
                    } catch (Exception e) {
                    }
                }
            }

        %>
    </body>
</html>
