package com.example.projectproduct.controller;

import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.service.HomeService;
import com.example.projectproduct.service.IHomeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewOrdersController", value = "/viewOrders")
public class ViewOrdersController extends HttpServlet {
    private IHomeService homeService=new HomeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        List<OrderDto> orderDtoList  = homeService.getYourorder();
        switch (action) {
            case "customerOrder":
                req.setAttribute("orderDtoList",orderDtoList);
                req.getRequestDispatcher("/view/order/customerOrder.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("orderDtoList",orderDtoList);
                req.getRequestDispatcher("/view/order/customerOrder.jsp").forward(req,resp);
                break;
        }
    }
}
