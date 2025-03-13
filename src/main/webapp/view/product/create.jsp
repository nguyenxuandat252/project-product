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

</head>
<body>
<c:import url="/navbarAdmin.jsp"></c:import>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card p-4 shadow-lg" style="width: 400px; border-radius: 15px;">
        <h3 class="text-center text-primary mb-3">Thêm Sản Phẩm</h3>
        <form action="/admin?action=create" method="post">
            <input class="form-control mb-3" type="hidden" name="id">

            <div class="mb-3">
                <label for="name" class="form-label">Tên sản phẩm(*)</label>
                <input class="form-control" name="name" id="name" onblur="checkName()" placeholder="Nhập tên">
                <small id="errorName" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Giá(*)</label>
                <input class="form-control" name="price" id="price" onblur="checkPrice()" placeholder="Nhập giá">
                <small id="errorPrice" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Mô tả(*)</label>
                <input class="form-control" name="description" id="description" onblur="checkDescription()" placeholder="Nhập mô tả">
                <small id="errorDescription" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Số lượng(*)</label>
                <input class="form-control" name="quantity" id="quantity" onblur="checkQuality()" placeholder="Nhập số lượng">
                <small id="errorQuality" class="text-danger"></small>
            </div>

            <div class="mb-3">
                <label for="idCategory" class="form-label"> Danh Mục(*)</label>
                <select class="form-control" onchange="checkCategory()" name="id_category" id="idCategory">
                    <option  value="">-- Chọn danh mục --</option>
                    <c:forEach var="category" items="${category}">
                        <option  value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
                <small id="errorIdCategory" class="text-danger"></small>
            </div>
            <div class="mb-3">
                <label for="url" class="form-label">Url hình ảnh(*)</label>
                <input class="form-control" name="url" id="url" onblur="checkUrl()" placeholder="Nhập url hình ảnh">
                <small id="errorUrl" class="text-danger"></small>
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
        let regex = /^\d+000$/
        if (!regex.test(price) || price === "" ) {
            document.getElementById("errorPrice").innerText = "Vui lòng nhập giá hợp lý";
        } else {
            document.getElementById("errorPrice").innerText = "";
        }
    }

    function checkDescription() {
        let description = document.getElementById("description").value;
        if (description === "") {
            document.getElementById("errorDescription").innerText = "Không được để trống"
        } else {
            document.getElementById("errorDescription").innerText = ""
        }
    }

    function checkQuality() {
        let quality = document.getElementById("quantity").value;
        let regex=/^\d+$/
        if (!regex.test(quality) || quality === "") {
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
    function checkUrl() {
        let category = document.getElementById("url").value;
        if ( category === "") {
            document.getElementById("errorUrl").innerText = "Vui lòng nhập lại"
        } else {
            document.getElementById("errorUrl").innerText = ""
        }
    }
</script>
</body>
</html>
