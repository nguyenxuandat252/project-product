package com.example.projectproduct.repository;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin") // Lọc tất cả các request
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI(); // Lấy đường dẫn request

        // Kiểm tra session
        if (session == null || session.getAttribute("username") == null) {
            res.sendRedirect("/home"); // Chưa đăng nhập, chuyển hướng về login
            return;
        }

        // Lấy role từ session
        String role = (String) session.getAttribute("role");

        // Phân quyền
        if (uri.startsWith("/admin") && !"admin".equals(role)) {
            res.sendRedirect("/home"); // Nếu không phải ADMIN mà vào trang admin thì cấm
            return;
        }

        // Nếu hợp lệ, tiếp tục request
        chain.doFilter(request, response);
    }
}
