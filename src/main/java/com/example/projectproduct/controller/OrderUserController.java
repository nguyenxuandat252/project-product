package com.example.projectproduct.controller;



import com.example.projectproduct.dto.CartDto;
import com.example.projectproduct.model.Product;
import com.example.projectproduct.model.User;
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
        HttpSession session = req.getSession();
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                int productId = Integer.parseInt(req.getParameter("id"));

                CartDto cartDto = (CartDto) session.getAttribute("cart");
                if (cartDto != null) {
                    Product productToRemove = null;
                    for (Product p : cartDto.getProductMap().keySet()) {
                        if (p.getId() == productId) {
                            productToRemove = p;
                            break;
                        }
                    }

                    if (productToRemove != null) {
                        cartDto.removeProduct(productToRemove);
                    }

                    session.setAttribute("cart", cartDto);
                }

                // Đặt thông báo trong session
                session.setAttribute("message", "Xóa sản phẩm khỏi giỏ hàng thành công!");
                resp.sendRedirect("/orderuser"); // Điều hướng về trang giỏ hàng
                break;
            default:
                CartDto cartDto1= (CartDto) session.getAttribute("cart");
                req.setAttribute("cart", cartDto1);
                req.getRequestDispatcher("/view/order/orderuser.jsp").forward(req,resp);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        int idUser = orderUserService.getIdUser(username);
        // Lấy user từ session
        CartDto cartDto = (CartDto) session.getAttribute("cart"); // Lấy giỏ hàng từ session

        if (username == null) {
            resp.sendRedirect("/login"); // Yêu cầu đăng nhập nếu chưa đăng nhập
            return;
        }

        if (cartDto == null || cartDto.getProductMap().isEmpty()) {
            session.setAttribute("message", "Giỏ hàng của bạn đang trống!");
            resp.sendRedirect("/orderuser");
            return;
        }

        // 1️⃣ Lưu đơn hàng vào database
        orderUserService.placeOrder(idUser, cartDto);

        // 2️⃣ Xóa giỏ hàng sau khi đặt hàng thành công
        session.removeAttribute("cart");
        session.setAttribute("message", "Đặt hàng thành công!");

        // 3️⃣ Chuyển hướng về trang giỏ hàng hoặc trang chủ
        resp.sendRedirect("/orderuser");
    }

}
