package com.example.projectproduct.controller;



import com.example.projectproduct.model.User;
import com.example.projectproduct.service.IUserService;
import com.example.projectproduct.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
    private IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get");
        resp.sendRedirect("/view/user/register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        User user = new User(username,password,name,phone,address);
        boolean check = userService.add(user);
        String mess="";
        if(!check){
            mess = "Username đã tồn tại, vui lòng chọn username khác!";
            HttpSession session = req.getSession();
            session.setAttribute("mess",mess);
            resp.sendRedirect("/register");
        }else {
            mess="Đăng ký thành công!";
            HttpSession session = req.getSession();
            session.setAttribute("mess",mess);
            resp.sendRedirect("/login");
        }
    }
}
