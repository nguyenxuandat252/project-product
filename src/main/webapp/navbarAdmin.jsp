<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    .product-card img {
        width: 100px;
        height: auto;
        border-radius: 8px;
    }

    .btn {
        margin: 5px;
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

</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
            <img src="https://img.favpng.com/22/12/19/web-page-world-wide-web-website-internet-logo-png-favpng-56JhDBu1frEDMakzkv63TuQKM.jpg" alt="Logo" width="40" height="40" class="d-inline-block align-top">
            MyShop
        </a>

        <!-- Nút thu gọn khi trên màn hình nhỏ -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/home">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/admin">Quản lý sản phẩm</a>
                </li>
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