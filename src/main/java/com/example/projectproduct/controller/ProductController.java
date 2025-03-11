package com.example.projectproduct.controller;

import com.example.projectproduct.model.Product;
import com.example.projectproduct.service.IProductService;
import com.example.projectproduct.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = ("Product"), value = {"/admin"})
public class ProductController extends HttpServlet {
    IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
                break;
            case "update":
                String findId = req.getParameter("id");
                if (findId != null) {
                    int id = Integer.parseInt(findId);
                    Product product = productService.findById(id);
                    req.setAttribute("findId", product);
                }
                req.getRequestDispatcher("/view/update.jsp").forward(req, resp);
                break;
            case "delete":
                String checkId = req.getParameter("id");
                if (checkId != null) {
                    int id = Integer.parseInt(checkId);
                    productService.deleteProduct(id);
                }
                req.setAttribute("list",productService.getProduct());
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
                break;
            default:

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                break;
            case "update":

            case "search":

                break;
            default:

        }

    }
}
