<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/13/2021
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Products details</h1>
<p>
    <a href="/products">Back to customer list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>Production Date: </td>
        <td>${requestScope["product"].getProductionDate()}</td>
    </tr>
    <tr>
        <td>Expiry Date: </td>
        <td>${requestScope["product"].getExpiryDate()}</td>
    </tr>
</table>

</body>
</html>
