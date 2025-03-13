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

    /* Hiệu ứng khi hover menu cấp 2 */
    .dropdown-submenu {
        position: relative;
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
        flex: 1 1 calc(25% - 20px); /* 4 sản phẩm mỗi hàng */
        max-width: calc(25% - 20px);
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
                    <a class="nav-link active" href="/home">Home</a>
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
                    <form action="/orderuser" method="get">
                        <a class="nav-link" href="/orderuser">Giỏ hàng</a>
                    </form>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/viewOrders?action=customerOrder">Đơn hàng</a>
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

