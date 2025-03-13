package com.example.projectproduct.controller;


import com.example.projectproduct.dto.CartDto;
import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.dto.ProductDto;
import com.example.projectproduct.model.Product;
import com.example.projectproduct.service.HomeService;
import com.example.projectproduct.service.IHomeService;
import com.example.projectproduct.service.IOrderUserService;
import com.example.projectproduct.service.OrderUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name ="CartController", value = "/home/cart")
public class CartController extends HttpServlet {
    private IOrderUserService orderUserService = new OrderUserService();
    private IHomeService homeService = new HomeService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int id =  Integer.parseInt(req.getParameter("id"));
        Product product = orderUserService.getById(id);
        if (session.getAttribute("cart")==null){
            CartDto cartDto = new CartDto();
            cartDto.addProduct(product);
            session.setAttribute("cart",cartDto);
        }else {
            CartDto cartDto  = (CartDto) session.getAttribute("cart");
            cartDto.addProduct(product);
            session.setAttribute("cart",cartDto);
        }

        // Đặt thông báo trong session
        session.setAttribute("message", "Thêm giỏ hàng thành công!");

        try {
            resp.sendRedirect("/home");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }
}
