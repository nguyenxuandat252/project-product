<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/layout.jsp"></c:import>

</head>
<c:import url="/navbarAdmin.jsp"></c:import>

<body class="bg-light">
<div class="container mt-4">
    <div class="d-flex justify-content-between mb-3">
        <a href="/order" class="btn btn-primary btn-sm">Xem danh sách order</a>
        <a href="/admin?action=create" class="btn btn-primary btn-sm " >Thêm sản phẩm</a>
    </div>
    <div class="table-responsive">
        <table id="tableProduct" class="table table-striped table-hover table-bordered">
            <thead>
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
