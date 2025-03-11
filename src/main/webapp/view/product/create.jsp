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
    </style>
</head>
<body>
<c:import url="/navbar.jsp"></c:import>
<div class="container d-flex justify-content-center align-items-start mt-5" style="height: 90vh;">
    <div class="card p-4 shadow-lg" style="width: 400px;">
        <form action="/admin?action=create" method="post">
            <input class="form-control mb-2" hidden="hidden" name="id" placeholder="Nhập id">
            <input class="form-control mb-2" name="name" id="name" onblur="checkName()" placeholder="Nhập tên">
            <small id="errorName"></small>
            <input class="form-control mb-2" name="price" id="price" onblur="checkPrice()" placeholder="Nhập giá">
            <small id="errorPrice"></small>
            <input class="form-control mb-2" name="description" onblur="checkDescription()" placeholder="Nhập mô tả">
            <small id="errorDescription"></small>
            <input class="form-control mb-2" name="quantity" id="quality" onblur="checkQuality()"
                   placeholder="Nhập số lượng">
            <small id="errorQuality"></small>
            <input class="form-control mb-2" name="id_category" id="idCategory" onblur="checkCategory()"
                   placeholder="Nhập id phụ kiện">
            <small id="errorIdCategory"></small>
            <button class="btn btn-primary w-100">Lưu</button>
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
        let quality = document.getElementById("quality").value;
        if (quality <= 0 || quality === "") {
            document.getElementById("errorQuality").innerText = "Vui lòng nhập lại"
        } else {
            document.getElementById("errorQuality").innerText = ""
        }
    }

    function checkCategory() {
        let category = document.getElementById("idCategory").value;
        if (category <= 0 || category === "" || category > 4) {
            document.getElementById("errorIdCategory").innerText = "Vui lòng nhập lại"
        } else {
            document.getElementById("errorIdCategory").innerText = ""
        }
    }
</script>
</body>
</html>
