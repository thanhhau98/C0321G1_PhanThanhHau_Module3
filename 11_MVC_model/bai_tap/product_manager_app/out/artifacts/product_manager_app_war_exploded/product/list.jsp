<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/13/2021
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Customers</h1>
<c:if test="${message!=null}">
    <p>${message}</p>
</c:if>
<form action="/products" method="get">
    <input type="text" name="action" value="search" hidden>
    <input type="text" name="search">
    <button type="submit" >Search</button>
</form>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>productionDate</td>
        <td>expiryDate</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getProductionDate()}</td>
            <td>${product.getExpiryDate()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
