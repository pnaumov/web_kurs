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
        <input value="Добавить запись" type="button" onclick="window.location.href='save.jsp'"> <br>
        <input value="Найти и обновить запись" type="button" onclick="window.location.href='search_obn.jsp'"> <br>
        <input value="Найти и удалить запись" type="button" onclick="window.location.href='search.jsp'"> <br> 
        <input value="Показать всех" type="button" onclick="window.location.href='select.jsp'"> <br> 
    </body>
</html>

