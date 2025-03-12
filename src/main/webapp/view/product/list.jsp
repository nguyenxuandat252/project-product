<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<nav class="navbar navbar-expand-lg navbar-primary  mb-3">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                </li>
                <li class="nav-item">
                </li>
            </ul>
        </div>
        <form action="/admin?action=search" method="post" class="mx-0 my-0 d-flex align-items-center ">
            <input class="form-control form-control-sm w-75  me-2" name="name" placeholder="Tên sản phẩm cần tìm" value="${param.name}">
            <button class="btn btn-primary btn-sm justify-content-between " style="font-size: 8px">Tìm kiếm</button>
        </form>
    </div>
</nav>
<body class="bg-light">
<div class="container mt-4">
    <div class="d-flex justify-content-between mb-3">
        <a href="/order" class="btn btn-primary">Xem danh sách order</a>
        <a href="/admin?action=create" class="btn btn-success">Thêm sản phẩm</a>
    </div>
    <h1 class="text-center text-primary">Danh Sách Sản Phẩm</h1>
    <div class="table-responsive">
        <table id="tableProduct" class="table table-striped table-hover table-bordered">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Mô Tả</th>
                <th>Số Lượng</th>
                <th>Danh Mục</th>
                <th>Cập Nhật</th>
                <th>Xóa</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="product">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td><fmt:formatNumber value="${product.getPrice()}" pattern="#,###VND"/></td>
                    <td>${product.getDescription()}</td>
                    <td>${product.getQuantity()}</td>
                    <td>${product.getNameCategory()}</td>
                    <td>
                        <a href="/admin?action=update&id=${product.getId()}" class="btn btn-warning btn-sm">Cập Nhật</a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger btn-sm" onclick="deleteId('${product.getId()}')" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal Xác Nhận Xóa -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/admin" method="get">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="confirmDeleteLabel">Xác Nhận Xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="deleteId">
                    <input type="hidden" name="action" value="delete">
                    <p>Bạn có chắc chắn muốn xóa sản phẩm này không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableProduct').DataTable({
            "lengthChange": false,
            "pageLength": 5,
            "searching": false,
            "language": {
                "paginate": {
                    "previous": "Trước",
                    "next": "Tiếp"
                },
            }
        });
    });

    function deleteId(id) {
        document.getElementById("deleteId").value = id;
    }
</script>
</body>
</html>
