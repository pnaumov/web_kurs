<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 06.07.2015, 12:28:08
    Author     : Pavel
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String id = request.getParameter("id");
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
                String query = "SELECT id_user, surname, name, email, sex FROM users WHERE id_user=" + request.getParameter("id");
//                out.print(query +"<br>");
                pstmt = conn.prepareStatement(query);
                pstmt = conn.createStatement();
//                pstmt.setString(1, surnameQuery);
//                ResultSet rs=pstmt.executeQuery();
                ResultSet rs = pstmt.executeQuery(query);
                String surname = "";
                String name = "";
                String email = "";
                String sex = "";
                if (rs.next()) {
                    surname = rs.getString(2);
                    name = rs.getString(3);
                    email = rs.getString(4);
                    sex=rs.getString(5);
                }
        %>
        <h1>Адресная книга</h1>   

        <form method="POST" action="action.obnov.jsp"> 
            <%-- здесь указываем метод передачи post и сам обработчик файл action.save--%>
            <input type=hidden name="id" value="<%=id%>">
            <%out.print(request.getParameter("id")+"<br>");%>
            Введите фамилию: <input size="30" name="surname" type="text" value="<%= surname%>"> <br>
            Введите имя: <input size="30" name="name" type="text" value="<%= name%>"> <br>
            Введите E-mail: <input size="45" name="email" type="text" value="<%= email%>"> <br>
            Введите пол:
            <select name="sex">
                <option value="1">male</option>
                <option <%out.print ("2".equals(sex)? "selected": "");%> value="2">female</option>
            </select> <br>
            <input value="Обновить запись" type="submit"> <br>
            <input value="Назад" type="button" onclick="window.location.href = 'index.jsp'"> <br>
        </form>
        <%

            } catch (Exception e) {
                out.print("Нет соединения с базой данных<br>");
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

