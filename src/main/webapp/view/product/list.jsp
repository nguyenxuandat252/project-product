<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/layout.jsp"></c:import>
    <style>
        /* Container */
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        /* Tiêu đề */
        h1 {
            text-align: center;
            color: #007bff;
            font-weight: bold;
            text-transform: uppercase;
        }

        /* Bảng */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Tiêu đề bảng */
        thead {
            background-color: #343a40; /* Màu xám đậm */
            color: white;
            font-weight: bold;
        }

        /* Ô tiêu đề */
        th {
            padding: 15px;
            text-align: center;
            font-size: 16px;
        }

        /* Ô dữ liệu */
        td {
            padding: 12px;
            text-align: center;
            font-size: 15px;
        }

        /* Hàng xen kẽ */
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        /* Hiệu ứng hover */
        tr:hover {
            background-color: #e3f2fd;
            transform: scale(1.01);
            transition: 0.3s;
        }

        /* Nút bấm */
        .btn {
            border-radius: 8px;
            font-weight: bold;
            padding: 8px 16px;
            transition: 0.3s;
        }

        /* Chỉnh màu nút */
        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #b52a37;
            transform: scale(1.05);
        }

        /* Thanh điều hướng */
        .navbar {
            background-color: #007bff !important;
            padding: 12px;
        }
        /* Đảm bảo container chiếm toàn bộ màn hình */
        .container {
            width: 100vw; /* Chiếm toàn bộ chiều rộng màn hình */
            max-width: 100vw;
            padding: 0;
            margin: 0;
        }

        /* Định dạng bảng */
        .table-responsive {
            width: 100vw; /* Chiếm toàn bộ chiều rộng */
            max-width: 100vw;
            overflow-x: auto;
        }

        /* Định dạng bảng */
        table {
            width: 100%; /* Đảm bảo bảng mở rộng hết chiều ngang */
            border-collapse: collapse;
        }

        /* Định dạng tiêu đề */
        thead {
            background-color: #343a40;
            color: white;
        }

        /* Căn chỉnh cột */
        th, td {
            padding: 12px;
            text-align: center;
            white-space: nowrap; /* Giữ nội dung không xuống dòng */
        }

        /* Bỏ viền bo tròn, hiệu ứng bóng */
        .table-responsive {
            border-radius: 0;
            box-shadow: none;
            padding: 0;
        }
        .navbar {
            margin-bottom: 0; /* Loại bỏ khoảng cách dưới navbar */
        }

        /* Căn chỉnh bảng gần hơn */
        .table-container {
            margin-top: 0; /* Giảm khoảng cách trên bảng */
            padding-top: 0;
        }

        /* Đảm bảo bảng bám sát navbar */
        .table-responsive {
            margin-top: 0;
        }
    </style>
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Quản Lý Sản Phẩm</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                </li>
            </ul>
        </div>
    </div>
</nav>
<body class="bg-light">
<div class="container mt-4">
    <div class="d-flex justify-content-between mb-3">
        <a href="/order" class="btn btn-primary">Xem danh sách order</a>
        <a href="/admin?action=create" class="btn btn-success">Thêm sản phẩm</a>
    </div>
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
                        <a href="/admin?action=update&id=${product.getId()}"   class="btn btn-primary btn-sm">Cập Nhật</a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary btn-sm" onclick="deleteId('${product.getId()}')" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Xóa</button>
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
