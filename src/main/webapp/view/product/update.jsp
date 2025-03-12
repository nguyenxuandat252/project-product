<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2025
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/admin?action=update" method="post">
    <input name="id" hidden="hidden" value="${findId.getId()}">
    <input name="name" placeholder="Nhập tên" value="${findId.getName()}">
    <input name="price" placeholder="Nhập giá" value="${findId.getPrice()}">
    <input name="description" placeholder="Nhập mô tả" value="${findId.getDescription()}">
    <input name="quantity" placeholder="Nhập số lượng" value="${findId.getQuantity()}">
    <input name="id_category" placeholder="Nhập id phụ kiện" value="${findId.getIdCategory()}">
    <button>Lưu</button>
</form>
</body>
</html>
