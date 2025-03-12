package com.example.projectproduct.controller;

import com.example.projectproduct.service.IOrderService;
import com.example.projectproduct.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Order", value = {"/order"})
public class OrderController extends HttpServlet {
    IOrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                String checkId = req.getParameter("id");
                if (checkId != null) {
                    int id = Integer.parseInt(checkId);
                    orderService.deleteOrder(id);
                    req.setAttribute("order", orderService.getOrder());
                }
                resp.sendRedirect("/order");
                break;
            default:
                req.setAttribute("order", orderService.getOrder());
                req.getRequestDispatcher("/view/order/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                orderService.updateOrder(id);
                req.setAttribute("order", orderService.getOrder());
                resp.sendRedirect("/order");
                break;
            default:
                req.setAttribute("order", orderService.getOrder());
                req.getRequestDispatcher("/view/order/list.jsp").forward(req, resp);
        }
    }
}
