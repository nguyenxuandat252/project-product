<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 12/03/2025
  Time: 11:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
</head>
<body>
<table>
    <tr>
        <th>NAME</th>
        <th>PRICE</th>
        <th>QUANTITY</th>
        <th>PRICE</th>
    </tr>
<%--    <c:set var="cart" value="${(CartDto)(sessionScope.cart)}"/>--%>
    <c:forEach var="product" items="${cart.getProductMap().keySet()}">
        <tr>
            <td>${product.name}</td>
            <td>${cart.getProductMap().get(product)}</td>
            <td>${product.getPrice()}</td>
            <td>
                <a href="/orderuser?action=order&id=${product.id}">Đặt hàng</a>
                <a href="/orderuser?action=delete&id=${product.id}" onclick="return confirm('Delete order?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
