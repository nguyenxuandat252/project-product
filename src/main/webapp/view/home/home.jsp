<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 11/03/2025
  Time: 11:22 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Menu Navigation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* Định dạng chung cho navbar */
        .navbar {
            font-size: 16px;
            font-weight: 500;
        }

        /* Căn chỉnh menu dropdown */
        .nav-item.dropdown:hover .dropdown-menu {
            display: block;
            margin-top: 0;
            animation: fadeIn 0.3s ease-in-out;
        }

        /* Định dạng dropdown menu */
        .dropdown-menu {
            background-color: #343a40;
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .dropdown-item {
            color: white;
            padding: 10px 20px;
        }

        .dropdown-item:hover {
            background-color: #495057;
        }

        .dropdown-submenu .dropdown-menu {
            top: 0;
            left: 100%;
            margin-left: 0.5rem;
            display: none;
            position: absolute;
        }

        .dropdown-submenu:hover > .dropdown-menu {
            display: block;
        }

        /* Hiệu ứng fade-in cho dropdown */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(5px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .product-container {
            display: flex;
            flex-wrap: wrap; /* Cho phép xuống dòng khi vượt quá chiều rộng */
            /*justify-content: space-between; !* Căn đều khoảng cách giữa các sản phẩm *!*/
            gap: 20px; /* Khoảng cách giữa các sản phẩm */
            padding: 10px;
            list-style: none;
            justify-content: center;
        }

        .product-card {
            min-width: 270px;
            flex: 1 1 calc(25% - 20px); /* 4 sản phẩm mỗi hàng */
            max-width: calc(110% - 20px);
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            transition: transform 0.3s;
            padding: 5px 25px 55px 5px;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-card img {
            width: 100px;
            height: auto;
            border-radius: 8px;
        }

        .btn {
            margin: 5px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            padding: 10px 15px;
            margin: 5px;
            border: 1px solid #ddd;
            text-decoration: none;
            color: black;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #f0f0f0;
        }

        .product-card p:first-child {
            height: 130px;
        }

        h2 {
            text-align: center;
        }

        .row {
            justify-content: space-around;
        }

        /*@media (min-width: 768px) {*/
        /*    .row > div:nth-child(2):nth-last-child(1) {*/
        /*        flex: 0 0 50%; !* Nếu có 2 sản phẩm, mỗi cái chiếm 50% *!*/
        /*    }*/
        /*    .row > div:nth-child(1):nth-last-child(0) {*/
        /*        flex: 0 0 33%; !* Nếu chỉ có 1 sản phẩm, chiếm 33% *!*/
        /*    }}*/
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
            <img src="https://img.favpng.com/22/12/19/web-page-world-wide-web-website-internet-logo-png-favpng-56JhDBu1frEDMakzkv63TuQKM.jpg"
                 alt="Logo" width="40" height="40" class="d-inline-block align-top">
            MyShop
        </a>

        <!-- Nút thu gọn khi trên màn hình nhỏ -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">

                <c:if test="${role eq 'admin'}">
                    <li class="nav-item">
                        <a class="nav-link active" href="/home">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin">Quản lý sản phẩm</a>
                    </li>
                </c:if>

                <c:if test="${role ne 'admin'}">
                    <li class="nav-item">
                        <a class="nav-link active" href="/home">Trang chủ</a>
                    </li>

                    <!-- Dropdown Sản phẩm -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="productsDropdown" role="button"
                           data-bs-toggle="dropdown">
                            Sản phẩm
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/home?action=phone">Điện thoại</a></li>
                            <li><a class="dropdown-item" href="/home?action=laptop">Laptop</a></li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <form action="/cart" method="post">
                            <a class="nav-link" href="/orderuser">Giỏ hàng</a>
                        </form>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/viewOrders?action=customerOrder">Đơn hàng</a>
                    </li>
                </c:if>

            </ul>

            <!-- Tên đăng nhập và Đăng xuất -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">${sessionScope.greeting} <strong>${sessionScope.username}</strong></a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light btn-sm" href="/logout">${sessionScope.status}</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<h2>Danh sách sản phẩm</h2>
<div class="container">

    <div class="row"> <!-- Đưa row ra ngoài vòng lặp -->
        <c:forEach var="product" items="${productList}">
            <div class="col-12 col-md-6 col-lg-3 d-flex">
                <div class="product-card">
                    <p>
                        <img src="${product.getImageUrl()}" title="${product.getDescription()}">
                    </p>
                    <p>${product.getName()}</p>
                    <p>
                        <fmt:formatNumber value="${product.getPrice()}" type="currency"
                                          currencySymbol="₫"/>
                    </p>
                    <p>
                        <a href="/home/cart?id=${product.getId()}" class="btn btn-primary btn-sm">
                            Thêm giỏ hàng
                        </a>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div> <!-- Kết thúc row -->
</div>
<!-- Hiển thị phân trang -->
<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="?page=${currentPage - 1}" class="btn btn-secondary">Trang trước</a>
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPages}">
        <a href="?page=${i}" class="btn ${i == currentPage ? 'btn-primary' : 'btn-outline-primary'}">${i}</a>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="?page=${currentPage + 1}" class="btn btn-secondary">Trang sau</a>
    </c:if>
</div>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var toastElement = document.getElementById("cartToast");
        var toast = new bootstrap.Toast(toastElement);
        toast.show();
    });
</script>
<%
        session.removeAttribute("message"); // Xóa thông báo sau khi hiển thị
    }
%>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="cartToast" class="toast align-items-center text-white bg-success border-0" role="alert"
         aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                Sản phẩm đã được thêm vào giỏ hàng thành công!
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
                    aria-label="Close"></button>
        </div>
    </div>
</div>
</body>
</html>
