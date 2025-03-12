package com.example.projectproduct.controller;



import com.example.projectproduct.dto.CartDto;
import com.example.projectproduct.service.IOrderUserService;
import com.example.projectproduct.service.OrderUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = " CartUserController" , value = "/orderuser")
public class OrderUserController extends HttpServlet {
    private IOrderUserService orderUserService = new OrderUserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "order":

                break;
            case "delete":
                int id = Integer.parseInt( req.getParameter("id"));
                orderUserService.delete(id);
                resp.sendRedirect("/orderuser");
                break;
            default:
                HttpSession session = req.getSession();
                CartDto cartDto= (CartDto) session.getAttribute("cart");
                req.setAttribute("cart", cartDto);
                req.getRequestDispatcher("/view/order/orderuser.jsp").forward(req,resp);
                break;
        }

    }
}
