<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2025
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/layout.jsp"></c:import>
    <style>
        input.is-invalid, select.is-invalid {
            border: 2px solid red;
        }

        small {
            color: red;
        }
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
        }

        .table-responsive {
            overflow-x: auto;
        }

        .modal-header {
            background-color: #dc3545;
            color: white;
        }


    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản Lý Đơn Hàng</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/admin">Trang Chủ</a>
                </li>
                <li class="nav-item">
                </li>
            </ul>
            <form class="d-flex" action="/admin" method="post">
                <button class="btn btn-outline-light" type="submit">Quay lại</button>
            </form>
        </div>
    </div>
</nav>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="card p-4 shadow-lg" style="width: 400px; border-radius: 15px;">
        <h3 class="text-center text-primary mb-3">Thêm Sản Phẩm</h3>
        <form action="/admin?action=create" method="post">
            <input class="form-control mb-3" type="hidden" name="id">

            <div class="mb-3">
                <label for="name" class="form-label">Tên sản phẩm</label>
                <input class="form-control" name="name" id="name" onblur="checkName()" placeholder="Nhập tên">
                <small id="errorName" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Giá</label>
                <input class="form-control" name="price" id="price" onblur="checkPrice()" placeholder="Nhập giá">
                <small id="errorPrice" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Mô tả</label>
                <input class="form-control" name="description" id="description" onblur="checkDescription()" placeholder="Nhập mô tả">
                <small id="errorDescription" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Số lượng</label>
                <input class="form-control" name="quantity" id="quantity" onblur="checkQuality()" placeholder="Nhập số lượng">
                <small id="errorQuality" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="idCategory" class="form-label"> Danh Mục</label>
                <select class="form-control" name="id_category" id="idCategory">
                    <option value="">-- Chọn danh mục --</option>
                    <c:forEach var="category" items="${category}">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
                <small id="errorIdCategory" class="text-danger"></small>
            </div>

            <button class="btn btn-primary w-100 fw-bold">Lưu</button>
        </form>
    </div>
</div>
<script>
    function checkName() {
        let name = document.getElementById("name").value;
        if (name === "") {
            document.getElementById("errorName").innerText = "Không được để trống"
        } else {
            document.getElementById("errorName").innerText = ""
        }
    }

    function checkPrice() {
        let price = document.getElementById("price").value;
        if (price < 0 || price === "") {
            document.getElementById("errorPrice").innerText = "Vui lòng nhập giá hợp lý";
        } else {
            document.getElementById("errorPrice").innerText = "";
        }
    }

    function checkDescription() {
        let description = document.getElementById("name").value;
        if (description === "") {
            document.getElementById("errorDescription").innerText = "Không được để trống"
        } else {
            document.getElementById("errorDescription").innerText = ""
        }
    }

    function checkQuality() {
        let quality = document.getElementById("quantity").value;
        if (quality <= 0 || quality === "") {
            document.getElementById("errorQuality").innerText = "Vui lòng nhập lại"
        } else {
            document.getElementById("errorQuality").innerText = ""
        }
    }

    function checkCategory() {
        let category = document.getElementById("idCategory").value;
        if ( category === "") {
            document.getElementById("errorIdCategory").innerText = "Vui lòng nhập lại"
        } else {
            document.getElementById("errorIdCategory").innerText = ""
        }
    }
</script>
</body>
</html>
