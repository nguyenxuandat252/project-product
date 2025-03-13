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
    <input type="text" name="username" id="username" oninput="validateName()"><br>
    <p id="message"></p>
    <label>Mật khẩu</label>
    <input type="password" name="password" id="password" oninput="validatePassword()"><br>
    <p id="message1"></p>
    <a href="/register">Đăng ký ngay</a>
    <input type="submit" value="Đăng nhập">
</form>
<script>
        function validateName() {
            const username = document.getElementById("username").value;
            const messageElement = document.getElementById("message");

            if (username.length === 0) {
                messageElement.textContent = "Tên đăng nhập không được để trống!";
                messageElement.style.color = "red";
                return false;
            }

            if (!/^[a-zA-Z]/.test(username)) {
                messageElement.textContent = "Tên đăng nhập phải bắt đầu bằng chữ cái!";
                messageElement.style.color = "red";
                return false;
            }

            if (/\s/.test(username)) {
                messageElement.textContent = "Tên đăng nhập không được chứa khoảng trắng!";
                messageElement.style.color = "red";
                return false;
            }

            if (!/^[a-zA-Z0-9]+$/.test(username)) {
                messageElement.textContent = "Tên đăng nhập chỉ được chứa chữ cái và số, không có ký tự đặc biệt!";
                messageElement.style.color = "red";
                return false;
            }

            if (username.length < 5) {
                messageElement.textContent = "Tên đăng nhập phải có ít nhất 5 ký tự!";
                messageElement.style.color = "red";
                return false;
            }

            messageElement.textContent = "Tên đăng nhập hợp lệ!";
            messageElement.style.color = "green";
            return true;
        }
        function validatePassword() {
            const password = document.getElementById("password").value;
            const messageElement = document.getElementById("message1");

            if (password.length === 0) {
                messageElement.textContent = "Mật khẩu không được để trống!";
                messageElement.style.color = "red";
                return false;
            }


            if (/\s/.test(password)) {
                messageElement.textContent = "Mật khẩu không được chứa khoảng trắng!";
                messageElement.style.color = "red";
                return false;
            }

            if (!/^[a-zA-Z0-9]+$/.test(password)) {
                messageElement.textContent = "Mật khẩu chỉ được chứa chữ cái và số, không có ký tự đặc biệt!";
                messageElement.style.color = "red";
                return false;
            }

            if (username.length < 5) {
                messageElement.textContent = "Mật khẩu phải có ít nhất 5 ký tự!";
                messageElement.style.color = "red";
                return false;
            }

            messageElement.textContent = "Mật khẩu hợp lệ!";
            messageElement.style.color = "green";
            return true;
        }
        document.getElementById("username").addEventListener("input", validateName);
</script>
</body>
</html>
