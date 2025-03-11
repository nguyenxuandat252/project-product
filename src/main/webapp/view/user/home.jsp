<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 11/03/2025
  Time: 4:38 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Menu Navigation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <style>
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
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <!-- Logo -->
    <a class="navbar-brand" href="#">
      <img src="logo.png" alt="Logo" width="40" height="40" class="d-inline-block align-top">
      MyShop
    </a>

    <!-- Nút thu gọn khi trên màn hình nhỏ -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home</a>
        </li>

        <!-- Dropdown Sản phẩm -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="productsDropdown" role="button"
             data-bs-toggle="dropdown">
            Sản phẩm
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Điện thoại</a></li>
            <li><a class="dropdown-item" href="#">Laptop</a></li>
          </ul>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Giỏ hàng(${sessionScope.cart})</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Đơn hàng</a>
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
<h2>Danh sách sản phẩm</h2>
<form action="/home" method="post">
  <div class="product-container">

    <c:forEach var="product" items="${productList}">
      <div class="product-card">
        <p>
          <img src="" alt="Hình ảnh">
        </p>
        <p>${product.getName()}</p>
        <p>Giá: ${product.getPrice()} VND</p>
        <p>
          <button class="btn btn-success">Thêm giỏ hàng</button>
            <%--                <button class="btn btn-primary">Đặt hàng</button>--%>
        </p>
      </div>
    </c:forEach>
  </div>
</form>
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
</body>
</html>
