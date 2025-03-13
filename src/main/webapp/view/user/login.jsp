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
    <c:import url="../../layout.jsp"></c:import>
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        /* Đảm bảo khoảng cách giữa navbar và nội dung */
        h1 {
            margin-top: 100px; /* Điều chỉnh khoảng cách từ navbar */
            text-align: center;
        }

        /* Định dạng form */
        #login  {
            width: 300px;
            margin: 0 auto; /* Căn giữa form */
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        /* Định dạng nhãn và input */
        #login  label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        #login  input[type="text"],
        #login  input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Định dạng nút đăng nhập */
        #login  input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        #login input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Định dạng link đăng ký */
        #login a {
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
        }

        #login a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<c:import url="../../navbar.jsp"></c:import>
<h1>Đăng nhập</h1>
<form id="login" action="/login" method="post">
    <p>${mess}</p>
    <label>Tên đăng nhập</label>
    <input type="text" name="username"><br>
    <label>Mật khẩu</label>
    <input type="password" name="password"><br>
    <a href="/register">Đăng ký ngay</a>
    <input type="submit" value="Đăng nhập">
</form>
</body>
</html>
