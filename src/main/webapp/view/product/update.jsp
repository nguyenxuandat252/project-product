<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2025
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/layout.jsp"></c:import>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #0d6efd;
            font-weight: bold;
        }

        .btn {
            border-radius: 20px;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        table {
            width: 100%;
            border-radius: 10px;
            overflow: hidden;
            border-collapse: collapse;
        }

        th {
            background-color: #0d6efd;
            color: white;
            text-align: center;
            padding: 10px;
        }

        td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .modal-header {
            background-color: #dc3545;
            color: white;
        }

        .card {
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            text-align: center;
            color: #0d6efd;
        }

        .card form input,
        .card form select {
            margin-bottom: 10px;
        }
    </style>
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Chỉnh Sửa Đơn Hàng</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/admin">Trang Chủ</a>
                </li>
            </ul>
            <form class="d-flex" action="/admin" method="post">
                <button class="btn btn-outline-dark" type="submit">Quay lại</button>
            </form>
        </div>
    </div>
</nav>
<body>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="card p-4 shadow-lg" style="width: 400px; border-radius: 15px;">
        <h3 class="text-center text-primary mb-3">Cập Nhật Sản Phẩm</h3>
        <form action="/admin?action=update" method="post">
            <input class="form-control mb-3" type="hidden" name="id" value="${findId.getId()}">

            <div class="mb-3">
                <label for="name" class="form-label">Tên sản phẩm</label>
                <input class="form-control" name="name" id="name" placeholder="Nhập tên" value="${findId.getName()}">
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Giá</label>
                <input class="form-control" name="price" id="price" placeholder="Nhập giá" value="${findId.getPrice()}">
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Mô tả</label>
                <input class="form-control" name="description" id="description" placeholder="Nhập mô tả" value="${findId.getDescription()}">
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Số lượng</label>
                <input class="form-control" name="quantity" id="quantity" placeholder="Nhập số lượng" value="${findId.getQuantity()}">
            </div>

            <div class="mb-3">
                <label for="idCategory" class="form-label"> Danh Mục</label>
                <select class="form-control" name="id_category" id="idCategory">
                    <option value="">-- Chọn danh mục --</option>
                    <c:forEach var="category" items="${listCategory}">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>

            <button class="btn btn-primary w-100 fw-bold shadow-sm" style="border-radius: 8px; transition: 0.3s;">
                Lưu
            </button>
        </form>
    </div>
</div>
</body>
</html>
