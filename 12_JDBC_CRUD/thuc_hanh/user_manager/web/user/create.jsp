<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/15/2021
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new user</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new user</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/users">Back to user list</a>
</p>
<form method="post">
    <fieldset>
        <legend>User information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td><input type="text" name="country" id="country"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create user"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
