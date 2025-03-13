<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 13/03/2025
  Time: 10:05 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 20px;
        }

        h1 {
            color: #007bff;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: black;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<h1>Danh sách đơn hàng</h1>
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
                <td>${order.getNameProduct()}</td>
                <td><fmt:formatNumber value="${order.getPrice()}" pattern="#,### VND"/></td>
                <td>${order.getQuantity()}</td>
                <td><fmt:formatNumber value="${order.getPrice() * order.getQuantity()}" pattern="#,### VND"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
