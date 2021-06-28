<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/9/2021
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Discount Calculator</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
  <h2>Discount Calculator</h2>
  <form action="/display-discount" method="post">
    <label>Product Description: </label><br/>
    <input type="text" name="Description" placeholder="Description" value="Description"/><br/>
    <label>List Price: </label><br/>
    <input type="text" name="Price" placeholder="Price" value="0"/><br/>
    <label>Discount Percent: </label><br/>
    <input type="text" name="Percent" placeholder="Percent" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Discount"/>
  </form>
  </body>
</html>
