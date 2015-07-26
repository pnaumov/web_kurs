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
        <form method="search" action="action.search.jsp"> 
            Введите фамилию для поиска в базе данных: <input size="30" name="surname" type="text"> <br>
            <input value="найти" type="submit"> <br>
        <input value="Назад" type="button" onclick="window.location.href = 'index.jsp'"> <br>
        </form>    
    </body>
</html>

