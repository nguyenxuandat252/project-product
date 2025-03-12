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
</head>
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
