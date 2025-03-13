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
    <input type="text" name="username" required><br>
    <label>Mật khẩu</label>
    <input type="password" name="password" required><br>
    <label>Họ và tên</label>
    <input type="text" name="name" required><br>
    <label>Địa chỉ</label>
    <input type="text" name="address" required><br>
    <label>Số điện thoại</label>
    <input type="tel" name="phone" required><br>
    <input type="submit" value="Đăng ký">
    <a href="/view/product/login.jsp">Đăng nhập</a>
    <p>${mess}</p>
</form>
</body>
</html>
