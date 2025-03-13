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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column; /* Căn theo chiều dọc */
            align-items: center; /* Căn giữa theo chiều ngang */
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 28px;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        p {
            color: red;
            font-weight: bold;
        }

        label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            margin: 10px 0;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }


    </style>
</head>
<body>
<h1>Login</h1>
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
