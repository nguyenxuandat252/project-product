package com.example.projectproduct.controller;

import com.example.projectproduct.dto.ProductDto;
import com.example.projectproduct.model.Category;
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
              List<Category> category = productService.getCategory();
                req.setAttribute("category",category);
                req.getRequestDispatcher("/view/product/create.jsp").forward(req, resp);
                break;
            case "update":
                List<Category> listCategory = productService.getCategory();
                req.setAttribute("listCategory",listCategory);
                String findId = req.getParameter("id");
                if (findId != null) {
                    int id = Integer.parseInt(findId);
                    Product product = productService.findById(id);
                    req.setAttribute("findId", product);
                }
                req.getRequestDispatcher("/view/product/update.jsp").forward(req, resp);
                break;
            case "delete":
                String checkId = req.getParameter("id");
                if (checkId != null) {
                    int id = Integer.parseInt(checkId);
                    productService.deleteProduct(id);
                }
                req.setAttribute("list",productService.getProduct());
                req.getRequestDispatcher("/view/product/list.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("list",productService.getProduct());
                req.getRequestDispatcher("/view/product/list.jsp").forward(req,resp);
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
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));
                String description = req.getParameter("description");
                int  quality = Integer.parseInt(req.getParameter("quantity"));
                int idCategory = Integer.parseInt(req.getParameter("id_category"));
                Product product = new Product(name,price,description,quality,idCategory);
                productService.addProduct(product);
                resp.sendRedirect("/admin");
                break;
            case "update":
                int idUpdate = Integer.parseInt(req.getParameter("id"));
                String nameUpdate = req.getParameter("name");
                double priceUpdate = Double.parseDouble(req.getParameter("price"));
                String descriptionUpdate = req.getParameter("description");
                int  qualityUpdate = Integer.parseInt(req.getParameter("quantity"));
                int idCategoryUpdate = Integer.parseInt(req.getParameter("id_category"));
                Product product1 = new Product(idUpdate,nameUpdate,priceUpdate,descriptionUpdate,qualityUpdate,idCategoryUpdate);
                productService.updateProduct(idUpdate,product1);
                req.setAttribute("list",productService.getProduct());
                req.getRequestDispatcher("/view/product/list.jsp").forward(req,resp);
                break;
            case "search":
                String nameSearch =req.getParameter("name");
                List<ProductDto> productDtoList = productService.searchProduct(nameSearch);
                req.setAttribute("list",productDtoList);
                req.getRequestDispatcher("/view/product/list.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("list",productService.getProduct());
                req.getRequestDispatcher("/view/product/list.jsp").forward(req,resp);
        }
    }
}
