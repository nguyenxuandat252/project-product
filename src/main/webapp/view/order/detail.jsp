
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
<table class="table table-striped table-hover align-middle text-center">
    <thead>
    <tr>
        <th>ID Order</th>
        <th>ID sản phẩm</th>
        <th>Ngày đặt hàng</th>
        <th>Tên sản phẩm</th>
        <th>Số lượng sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Trạng thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderDetail}" var="order">
        <tr>
            <td>${order.idOrder}</td>
            <td>${order.idProduct}</td>
            <td>${order.dateOrder}</td>
            <td>${order.nameProduct}</td>
            <td>${order.quantity}</td>
            <td><fmt:formatNumber value="${order.price}" pattern="#,###VND"/></td>
            <td>${order.description}</td>
            <td>${order.status}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="text-center mt-3">
<c:if test="${orderDetail.get(0).status ne 'Đã xuất hàng'}">
    <button type="button"class="btn btn-primary btn-sm"
            onclick="deleteId('${orderDetail.get(0).idOrder}')"
            data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
        Xuất hàng
    </button>
</c:if>
<c:if test="${orderDetail.get(0).status eq 'Đã xuất hàng'}">
    <button class="btn btn-primary btn-sm">Đã xuất hàng</button>
</c:if>
</div>

<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/order" method="get">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="confirmDeleteLabel">Xuất hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id"  id="updateId">
                    <input type="hidden" name="action" value="update">
                    <p>Bạn có chắc chắn muốn xuất đơn hàng này không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xác nhận</button>
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
</body>
</html>
