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
<c:import url="/navbarAdmin.jsp"></c:import>

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
