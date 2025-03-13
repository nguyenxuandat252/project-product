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

</head>
<body>
<c:import url="/navbarAdmin.jsp"></c:import>

<table id="tableOrder" class="table table-striped table-hover align-middle text-center">
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên khách hàng</th>
        <th>Số điện thoại</th>
        <th>Địa chỉ</th>
        <th>Ngày đặt</th>
<%--        <th>Tên sản phẩm</th>--%>
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
<%--            <th>${order.nameProduct}</th>--%>
            <td><fmt:formatNumber value="${order.price}" pattern="#,###VND"/></td>
            <td>${order.status}</td>
            <td>
                <a class="btn btn-primary btn-sm" href="/order?action=detail&id=${order.id}">Chi tiết</a>
            </td>
            <td>
                <c:if test="${order.status ne 'Đã xuất hàng'}">
                    <button type="button" class="btn btn-primary btn-sm"
                            onclick="deleteId('${order.id}')"
                            data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                        Xuất hàng
                    </button>
                </c:if>
                <c:if test="${order.status eq 'Đã xuất hàng'}">
                <button class="btn btn-primary btn-sm">Đã xuất hàng</button>
                </c:if>
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
                    <button type="submit" class="btn btn-danger">Xác Nhận</button>
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
