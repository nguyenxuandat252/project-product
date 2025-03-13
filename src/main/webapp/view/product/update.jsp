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
<%--    <style>--%>
<%--        input.is-invalid, select.is-invalid {--%>
<%--            border: 2px solid red;--%>
<%--        }--%>

<%--        small {--%>
<%--            color: red;--%>
<%--        }--%>
<%--        body {--%>
<%--            background-color: #f8f9fa;--%>
<%--            font-family: Arial, sans-serif;--%>
<%--        }--%>

<%--        .container {--%>
<%--            background-color: white;--%>
<%--            padding: 30px;--%>
<%--            border-radius: 10px;--%>
<%--            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>

<%--        h1 {--%>
<%--            text-align: center;--%>
<%--            color: #0d6efd;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        .btn {--%>
<%--            border-radius: 20px;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        .btn-primary {--%>
<%--            background-color: #0d6efd;--%>
<%--            border: none;--%>
<%--        }--%>

<%--        .btn-success {--%>
<%--            background-color: #28a745;--%>
<%--            border: none;--%>
<%--        }--%>

<%--        .btn-warning {--%>
<%--            background-color: #ffc107;--%>
<%--            border: none;--%>
<%--        }--%>

<%--        .btn-danger {--%>
<%--            background-color: #dc3545;--%>
<%--            border: none;--%>
<%--        }--%>

<%--        table {--%>
<%--            width: 100%;--%>
<%--            border-radius: 10px;--%>
<%--            overflow: hidden;--%>
<%--            border-collapse: collapse;--%>
<%--        }--%>

<%--        th {--%>
<%--            background-color: #0d6efd;--%>
<%--            color: white;--%>
<%--            text-align: center;--%>
<%--            padding: 10px;--%>
<%--        }--%>

<%--        td {--%>
<%--            text-align: center;--%>
<%--            padding: 10px;--%>
<%--            border: 1px solid #ddd;--%>
<%--        }--%>

<%--        .table-responsive {--%>
<%--            overflow-x: auto;--%>
<%--        }--%>

<%--        .modal-header {--%>
<%--            background-color: #dc3545;--%>
<%--            color: white;--%>
<%--        }--%>

<%--        .card {--%>
<%--            padding: 20px;--%>
<%--            border-radius: 15px;--%>
<%--            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>

<%--        .card h3 {--%>
<%--            text-align: center;--%>
<%--            color: #0d6efd;--%>
<%--        }--%>

<%--        .card form input,--%>
<%--        .card form select {--%>
<%--            margin-bottom: 10px;--%>
<%--        }--%>

<%--    </style>--%>
</head>
<c:import url="../../navbar.jsp"></c:import>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-primary">--%>
<%--    <div class="container-fluid">--%>

<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
<%--                data-bs-target="#navbarNav"--%>
<%--                aria-controls="navbarNav" aria-expanded="false"--%>
<%--                aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--            <ul class="navbar-nav me-auto">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="/admin"><img width="50" height="50" src="https://img.icons8.com/ios/50/home--v1.png" alt="home--v1"></a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <a class="navbar-brand w-100 text-center text-white"  href="#" >Chỉnh Sửa Đơn Hàng</a>--%>
<%--            <form class="d-flex" action="/admin" method="post">--%>
<%--                <button class="btn btn-outline-dark btn-sm px-3 py-1" type="submit">Quay lại</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>
<body>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="card p-4 shadow-lg" style="width: 400px; border-radius: 15px;">
        <h3 class="text-center text-primary mb-3">Cập Nhật Sản Phẩm</h3>
        <form action="/admin?action=update" method="post">
            <input class="form-control mb-3" type="hidden" name="id" value="${findId.getId()}">

            <div class="mb-3">
                <label for="name" class="form-label">Tên sản phẩm</label>
                <input class="form-control" onblur="checkName()" name="name" id="name" placeholder="Nhập tên" value="${findId.getName()}">
                <small id="errorName"></small>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Giá</label>
                <input class="form-control" onblur="checkPrice()" name="price" id="price" placeholder="Nhập giá" value="${findId.getPrice()}">
                <small id="errorPrice"></small>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Mô tả</label>
                <input class="form-control" name="description" id="description" placeholder="Nhập mô tả" value="${findId.getDescription()}">
                <small id="errorDescription"></small>
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Số lượng</label>
                <input class="form-control" name="quantity" id="quantity" placeholder="Nhập số lượng" value="${findId.getQuantity()}">
                <small id="errorQuantity"></small>
            </div>
            <div class="mb-3">
                <label for="image_Url" class="form-label">Url hình ảnh</label>
                <input class="form-control" name="image_Url" id="image_Url" placeholder="Nhập url hình ảnh" value="${findId.imageUrl}">
                <small id="errorUrl" class="text-danger"></small>
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
        let name = document.getElementById("price").value;
        if (name === "") {
            document.getElementById("errorPrice").innerText = "Không được để trống"
        } else {
            document.getElementById("errorPrice").innerText = ""
        }
    }
    function checkDescription() {
        let name = document.getElementById("description").value;
        if (name === "") {
            document.getElementById("errorDescription").innerText = "Không được để trống"
        } else {
            document.getElementById("errorDescription").innerText = ""
        }
    }
    function checkQuantity() {
        let name = document.getElementById("quantity").value;
        if (name === "") {
            document.getElementById("errorQuantity").innerText = "Không được để trống"
        } else {
            document.getElementById("errorQuantity").innerText = ""
        }
    }
    function checkUrl() {
        let name = document.getElementById("image_Url").value;
        if (name === "") {
            document.getElementById("errorUrl").innerText = "Không được để trống"
        } else {
            document.getElementById("errorUrl").innerText = ""
        }
    }
    function checkCategory() {
        let name = document.getElementById("id_category").value;
        if (name === "") {
            document.getElementById("errorIdCategory").innerText = "Không được để trống"
        } else {
            document.getElementById("errorIdCategory").innerText = ""
        }
    }
</script>
</body>
</html>
