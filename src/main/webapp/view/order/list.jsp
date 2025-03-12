<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2025
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<table id="tableOrder" class="table table-striped table-hover align-middle text-center">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Tên khách hàng</th>
        <th>Số điện thoại</th>
        <th>Địa chỉ</th>
        <th>Ngày đặt</th>
        <th>Tên sản phẩm</th>
        <th>Giá Tiền</th>
        <th>Trạng thái</th>
        <th>Chi tiết</th>
        <th>Xuất Hàng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${order}">
        <tr>
            <td>${order.id}</td>
            <td>${order.name}</td>
            <td>${order.phoneNumber}</td>
            <td>${order.address}</td>
            <td>${order.date}</td>
            <th>${order.nameProduct}</th>
            <td><fmt:formatNumber value="${order.price}" pattern="#,###VND"/></td>
            <td>${order.status}</td>
            <td>
                <a class="btn btn-primary btn-sm" href="/order?action=detail&id=${order.id}">Chi tiết</a>
            </td>
            <td>
                <button type="button" class="btn btn-danger btn-sm" onclick="deleteId('${order.id}')" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Xuất hàng</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/order" method="get">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="confirmDeleteLabel">Xuất hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="updateId">
                    <input type="hidden" name="action" value="update">
                    <p>Bạn có chắc chắn muốn xuất đơn hàng này không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function deleteId(id) {
        document.getElementById("updateId").value = id;
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableOrder').DataTable({
            "lengthChange": false,
            "pageLength": 5,
            "searching": false,
            "language": {
                "paginate": {
                    "previous": "Trước",
                    "next": "Tiếp"
                }
            }
        });
    });
</script>
</body>
</html>
