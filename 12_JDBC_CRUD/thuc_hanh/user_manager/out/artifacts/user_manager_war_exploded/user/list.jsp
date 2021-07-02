<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/13/2021
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
<h1>Users</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<form action="/users" method="get">
    <input type="text" name="action" value="search" hidden>
    <input type="text" name="search">
    <button type="submit" >Search</button>
</form>
<p>
    <a href="/users?action=create">Create new user</a>
</p>
<table border="1">
    <tr>
        <td>id</td>
        <td>name</td>
        <td>email</td>
        <td>country</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["users"]}' var="user">
        <tr>
            <td>${user.getId()}</td>
            <td><a href="/users?action=view&id=${user.getId()}">${user.getName()}</a></td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a href="/users?action=edit&id=${user.getId()}">edit</a></td>
            <td><a href="/users?action=delete&id=${user.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<form action="/users" method="get">
    <input type="hidden" name="action" value="orderUser" >
    <button type="submit" >Oder</button>
</form>
</body>
</html>
