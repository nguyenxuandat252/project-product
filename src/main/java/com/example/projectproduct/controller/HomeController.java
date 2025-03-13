package com.example.projectproduct.controller;



import com.example.projectproduct.dto.CartDto;
import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.dto.ProductDto;
import com.example.projectproduct.model.Product;
import com.example.projectproduct.service.HomeService;
import com.example.projectproduct.service.IHomeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name= "HomeController" , value = "/home")
public class HomeController extends HttpServlet {
    private IHomeService homeService = new HomeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = "Đăng nhập";
        String logout = "Đăng xuất";
        String greeting = "";
        HttpSession session = req.getSession();
        if (session.getAttribute("username") == null) {
            session.setAttribute("status", login);
            session.setAttribute("greeting", greeting);

        } else {
            greeting = "Xin chào," ;
            session.setAttribute("status", logout);
            session.setAttribute("greeting", greeting);
        }

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        List<ProductDto> productDtos = homeService.getAll();
        switch (action) {
            case "laptop":
                productDtos = homeService.getLaptop();
                break;
            case "phone":
                productDtos = homeService.getPhone();
                break;
            case "customerOrder":
                List<OrderDto> orderDtoList = new ArrayList<>();
                orderDtoList = homeService.getYourorder();
                req.setAttribute("orderDtoList",orderDtoList);
                req.getRequestDispatcher("/view/order/customerOrder").forward(req,resp);
                break;
            default:
                productDtos = homeService.getAll();
                break;
        }

        int page = 1; // Mặc định trang đầu tiên
        int itemsPerPage = 8; // Số sản phẩm mỗi trang

        // Lấy số trang từ request (nếu có)
        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        // Tính toán vị trí bắt đầu & kết thúc
        int start = (page - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, productDtos.size());

        // Lấy danh sách sản phẩm cho trang hiện tại
        List<ProductDto> pageProducts = productDtos.subList(start, end);

        // Gửi dữ liệu đến JSP
        req.setAttribute("productList", pageProducts);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", (int) Math.ceil((double) productDtos.size() / itemsPerPage));

        req.getRequestDispatcher("/view/home/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
