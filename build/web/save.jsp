<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 06.07.2015, 12:28:08
    Author     : Pavel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Адресная книга</h1>   

        <form method="POST" action="action.save.jsp"> 
            <%-- здесь указываем метод передачи post и сам обработчик файл action.save--%>
            Введите фамилию: <input size="30" name="surname" type="text"> <br>
            Введите имя: <input size="30" name="name" type="text"> <br>
            Введите E-mail: <input size="45" name="email" type="text"> <br>
            Введите пол: 
            <select name="sex">
                <option value="1">male</option>
                <option value="2">female</option>
            </select> <br>
            <input value="Добавить запись" type="submit"> <br>
            <input value="Назад" type="button" onclick="window.location.href = 'index.jsp'"> <br>
        </form> 
    </body>
</html>

