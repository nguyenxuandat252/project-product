<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 11/03/2025
  Time: 4:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/register" method="post">
    <label>username</label>
    <input type="text" name="username" required><br>
    <label>password</label>
    <input type="password" name="password" required><br>
    <label>name</label>
    <input type="text" name="name" required><br>
    <label>address</label>
    <input type="text" name="address" required><br>
    <label>phone</label>
    <input type="tel" name="phone" required><br>
    <input type="submit" value="Register">
    <a href="/view/user/login.jsp">Login</a>
    <p>${mess}</p>
</form>
</body>
</html>
