<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 11/03/2025
  Time: 8:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="/login" method="post">
    <p>${mess}</p>
    <label>username</label>
    <input type="text" name="username"><br>
    <label>username</label>
    <input type="password" name="password"><br>
    <a href="/register">register now</a>
    <input type="submit" value="Login">
</form>
</body>
</html>
