<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 11/03/2025
  Time: 9:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../../layout.jsp"></c:import>
    <title>Register</title>
<%--    <style>--%>
<%--        #register {--%>
<%--            width: 300px;--%>
<%--            margin: 50px auto;--%>
<%--            padding: 20px;--%>
<%--            border: 1px solid #ddd;--%>
<%--            border-radius: 8px;--%>
<%--            background-color: #f8f9fa;--%>
<%--            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        /* Định dạng nhãn */--%>
<%--        #register label {--%>
<%--            display: block;--%>
<%--            margin-top: 10px;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        /* Định dạng input */--%>
<%--        #register input[type="text"],--%>
<%--        #register input[type="password"],--%>
<%--        #register input[type="tel"] {--%>
<%--            width: 100%;--%>
<%--            padding: 8px;--%>
<%--            margin-top: 5px;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 5px;--%>
<%--            font-size: 14px;--%>
<%--        }--%>

<%--        /* Định dạng nút submit */--%>
<%--        #register input[type="submit"] {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            margin-top: 15px;--%>
<%--            background-color: #007bff;--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--            font-size: 16px;--%>
<%--        }--%>

<%--        #register input[type="submit"]:hover {--%>
<%--            background-color: #0056b3;--%>
<%--        }--%>

<%--        /* Định dạng link đăng nhập */--%>
<%--        #register a {--%>
<%--            display: inline-block;--%>
<%--            margin-top: 10px;--%>
<%--            color: #007bff;--%>
<%--            text-decoration: none;--%>
<%--        }--%>

<%--        #register a:hover {--%>
<%--            text-decoration: underline;--%>
<%--        }--%>

<%--        /* Định dạng thông báo lỗi */--%>
<%--        #register p {--%>
<%--            color: red;--%>
<%--            font-weight: bold;--%>
<%--        }</style>--%>
    <style>
        #register {
            width: 350px;
            margin: 50px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        /* Tiêu đề form */
        #register h2 {
            margin-bottom: 15px;
            font-size: 22px;
            color: #333;
        }

        /* Định dạng nhãn */
        #register label {
            display: block;
            font-weight: 600;
            margin-top: 10px;
            color: #555;
            text-align: left;
        }

        /* Định dạng input */
        #register input[type="text"],
        #register input[type="password"],
        #register input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: all 0.3s ease-in-out;
        }

        /* Hiệu ứng khi focus vào input */
        #register input:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            outline: none;
        }

        /* Định dạng nút đăng ký */
        #register input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
        }

        #register input[type="submit"]:hover {
            background: linear-gradient(135deg, #0056b3, #004494);
            transform: scale(1.05);
        }

        /* Định dạng link đăng nhập */
        #register a {
            display: inline-block;
            margin-top: 10px;
            color: #007bff;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
        }

        #register a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        /* Định dạng thông báo lỗi */
        #register p {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }

        /* Responsive: Nếu màn hình nhỏ hơn 400px */
        @media (max-width: 400px) {
            #register {
                width: 90%;
                padding: 20px;
            }
        }

    </style>
</head>

<body>
<c:import url="../../navbar.jsp"></c:import>
<form id="register" action="/register" method="post">
    <label>Tên đăng nhập</label>
    <input type="text" name="username" required id="username"><br>
    <p id="message"></p>
    <label>Mật khẩu</label>
    <input type="password" name="password" required id="password"><br>
    <p id="message1"></p>
    <label>Họ và tên</label>
    <input type="text" name="name" required id="fullName"><br>
    <p id="message2"></p>
    <label>Địa chỉ</label>
    <input type="text" name="address" required id="address"><br>
    <p id="message4"></p>
    <label>Số điện thoại</label>
    <input type="tel" name="phone" required id="phoneNumber"><br>
    <p id="message3"></p>
    <input type="submit" value="Đăng ký">
    <a href="/login">Đăng nhập</a>
    <p>${mess}</p>
</form>
<script>
    function validateFullName() {
        const fullName = document.getElementById("fullName").value.trim();
        const messageElement = document.getElementById("message2");

        if (fullName.length === 0) {
            messageElement.textContent = "Họ và tên không được để trống!";
            messageElement.style.color = "red";
            return false;
        }

        if (fullName.split(" ").length < 2) {
            messageElement.textContent = "Họ và tên phải có ít nhất 2 từ!";
            messageElement.style.color = "red";
            return false;
        }

        if (!/^[a-zA-ZÀ-ỹ\s]+$/.test(fullName)) {
            messageElement.textContent = "Họ và tên chỉ được chứa chữ cái và khoảng trắng!";
            messageElement.style.color = "red";
            return false;
        }

        if (fullName.length < 3) {
            messageElement.textContent = "Họ và tên phải có ít nhất 3 ký tự!";
            messageElement.style.color = "red";
            return false;
        }

        messageElement.textContent = "Họ và tên hợp lệ!";
        messageElement.style.color = "green";
        return true;
    }
    function validatePhoneNumber() {
        const phone = document.getElementById("phoneNumber").value.trim();
        const messageElement = document.getElementById("message3");

        // Kiểm tra rỗng
        if (phone.length === 0) {
            messageElement.textContent = "Số điện thoại không được để trống!";
            messageElement.style.color = "red";
            return false;
        }

        // Kiểm tra số điện thoại Việt Nam hợp lệ (bắt đầu bằng 0, có 10 chữ số)
        if (!/^0\d{9}$/.test(phone)) {
            messageElement.textContent = "Số điện thoại phải bắt đầu bằng 0 và có 10 chữ số!";
            messageElement.style.color = "red";
            return false;
        }

        messageElement.textContent = "Số điện thoại hợp lệ!";
        messageElement.style.color = "green";
        return true;
    }
    function validateAddress() {
        const address = document.getElementById("address").value.trim();
        const messageElement = document.getElementById("message4");

        // Kiểm tra rỗng
        if (address.length === 0) {
            messageElement.textContent = "Địa chỉ không được để trống!";
            messageElement.style.color = "red";
            return false;
        }

        // Kiểm tra địa chỉ chỉ chứa chữ cái, số, dấu phẩy và khoảng trắng
        if (!/^[a-zA-ZÀ-ỹ0-9\s,.-]+$/.test(address)) {
            messageElement.textContent = "Địa chỉ chỉ được chứa chữ cái, số, dấu phẩy, dấu chấm và khoảng trắng!";
            messageElement.style.color = "red";
            return false;
        }

        // Kiểm tra độ dài tối thiểu
        if (address.length < 5) {
            messageElement.textContent = "Địa chỉ phải có ít nhất 5 ký tự!";
            messageElement.style.color = "red";
            return false;
        }

        messageElement.textContent = "Địa chỉ hợp lệ!";
        messageElement.style.color = "green";
        return true;
    }
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

        if (password.length < 5) {
            messageElement.textContent = "Mật khẩu phải có ít nhất 5 ký tự!";
            messageElement.style.color = "red";
            return false;
        }

        messageElement.textContent = "Mật khẩu hợp lệ!";
        messageElement.style.color = "green";
        return true;
    }
    document.getElementById("username").addEventListener("input", validateName);

    // Gắn sự kiện kiểm tra khi nhập
    document.getElementById("address").addEventListener("input", validateAddress);


    // Gắn sự kiện kiểm tra khi nhập
    document.getElementById("phoneNumber").addEventListener("input", validatePhoneNumber);

    // Gắn sự kiện kiểm tra khi nhập
    document.getElementById("fullName").addEventListener("input", validateFullName);
    document.getElementById("password").addEventListener("input", validatePassword);
</script>
</body>
</html>
