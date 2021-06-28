<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/9/2021
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>List customer by JSTL</title>
    <style>
      #example3 {
        border: 1px solid;
        padding: 10px;
        box-shadow: 5px 10px red;
      }
      th , td {
        text-align: center;
        width: 150px;
        padding: 20px;
        border-bottom: 1px solid black ;
      }

      table{
        margin-left: 500px;
        border-collapse: collapse;
      }

      img{
        height: 50px;
        width: 50px;
      }
    </style>
  </head>
  <body>
  <h2 style="text-align: center">Danh sách khách hàng</h2>
  <table id="example3">
    <tr>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Địa chỉ</th>
      <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerListServlet}" >
      <tr>
        <td><c:out value="${customer.name}"/></td>
        <td><c:out value="${customer.dateOfBirth}"/></td>
        <td><c:out value="${customer.address}"/></td>
        <td><img src="${customer.image}"></td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
