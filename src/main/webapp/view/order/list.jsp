<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2025
  Time: 5:00 PM
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
<table class="table table-primary">
    <tr>
        <th>ID</th>
        <th>Ngày đặt</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="order" items="${order}">
        <tr>
            <td>${order.id}</td>
            <td>${order.date}</td>
            <td>${order.status}</td>
            <td>
                <form action="/order?action=update&id=${order.id}" method="post">
                    <button class="btn btn-primary">Xuất hàng</button>
                </form>
                <button type="button" onclick="deleteId('${order.getId()}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    DELETE
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/order" method="get">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác Nhận Xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="id" id="deleteId">
                    <input hidden="hidden" name="action" value="delete">
                    <p>Bạn có muốn xóa sản phẩm này không</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">DELETE</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function deleteId(id){
        document.getElementById("deleteId").value=id;
    }
</script>
</body>
</html>
