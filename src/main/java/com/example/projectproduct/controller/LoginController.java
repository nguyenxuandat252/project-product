package com.example.projectproduct.controller;



import com.example.projectproduct.service.ILoginService;
import com.example.projectproduct.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet (name = "LoginController",value = "/login")
public class LoginController extends HttpServlet {
    private ILoginService loginService = new LoginService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get");
        resp.sendRedirect("view/user/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        boolean check = loginService.findByUser(username,password);
        String mess="";
        if(check){
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            session.setAttribute("id", loginService.getId(username,password));
            session.setAttribute("role", loginService.getRole(username,password));
            String role = (String) session.getAttribute("role");
            if(role.equals("admin")){
                resp.sendRedirect("/admin");
            }else {
                resp.sendRedirect("/home");
            }

        }else {
            mess="Đăng nhập thất bại kiểm tra lại thông tin đăng nhập!";
            req.setAttribute("mess",mess);
            req.getRequestDispatcher("view/user/login.jsp").forward(req, resp);
        }
    }
}
