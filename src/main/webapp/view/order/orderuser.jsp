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
    <c:import url="../../layout.jsp"></c:import>
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
<c:import url="../../navbar.jsp"></c:import>
<h2>${message}</h2>
<c:choose>
    <c:when test="${not empty cart.getProductMap()}">
        <table>
            <tr>
                <th>NAME</th>
                <th>QUANTITY</th>
                <th>PRICE</th>
                <th>FUNCTION</th>
            </tr>
            <c:forEach var="product" items="${cart.getProductMap().keySet()}">
                <tr>
                    <td>${product.name}</td>
                    <td>${cart.getProductMap().get(product)}</td>
                    <td><fmt:formatNumber value="${product.getPrice()}" type="currency" currencySymbol="₫"/></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                            Delete
                        </button>
                        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <!-- Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="modalLabel">Thông báo</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <!-- Body -->
                                    <div class="modal-body">
                                        Bạn có muốn xóa sản phẩm trong giỏ hàng ?
                                    </div>

                                    <!-- Footer -->
                                    <div class="modal-footer">
                                        <form action="/orderuser" method="get">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="${product.id}">
                                            <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">Xóa</button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
<%--                        <a href="/orderuser?action=delete&id=${product.id}" onclick="return confirm('Delete order?')">Delete</a>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form action="/orderuser?action=order&id=${product.id}" method="post">
            <button>Đặt hàng</button>
        </form>
    </c:when>
    <c:otherwise>
        <p style="color: red; font-weight: bold;">Không có sản phẩm nào trong giỏ hàng.</p>
    </c:otherwise>
</c:choose>
</body>
</html>
