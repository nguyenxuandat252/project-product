<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 12/03/2025
  Time: 11:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
        }

        h2 {
            color: #007bff;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4c5156;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #218838;
        }

        a {
            color: #dc3545;
            text-decoration: none;
            padding: 8px 12px;
            border: 1px solid #dc3545;
            border-radius: 5px;
            transition: 0.3s;
        }

        a:hover {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
<h2>${message}</h2>
<table>
    <tr>
        <th>NAME</th>
        <th>QUANTITY</th>
        <th>PRICE</th>
        <th>FUNCTION</th>
    </tr>
<%--    <c:set var="cart" value="${(CartDto)(sessionScope.cart)}"/>--%>
    <c:forEach var="product" items="${cart.getProductMap().keySet()}">
        <tr>
            <td>${product.name}</td>
            <td>${cart.getProductMap().get(product)}</td>
            <td><fmt:formatNumber value="${product.getPrice()}" type="currency" currencySymbol="₫"/></td>
<%--            <td>${product.getPrice()}</td>--%>
            <td>
                <form action="/orderuser?action=order&id=${product.id}" method="post">
                    <button>Đặt hàng</button>
                </form>
                <a href="/orderuser?action=delete&id=${product.id}" onclick="return confirm('Delete order?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
