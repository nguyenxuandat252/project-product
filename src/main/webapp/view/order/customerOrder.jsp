<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 13/03/2025
  Time: 10:05 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
        <tr>
            <th>Date</th>
            <th>Status</th>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>SumMoney</th>
        </tr>
        <c:forEach var="order" items="${orderDtoList}">
            <tr>
                <td>${order.getDate()}</td>
                <td>${order.getStatus()}</td>
                <td>${order.getName()}</td>
                <td>${order.getPrice()}</td>
                <td>${order.getQuantity()}</td>
                <td>(${order.getPrice()}*${order.getQuantity()})</td>

            </tr>
        </c:forEach>
    </table>
</body>
</html>
