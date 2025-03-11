package com.example.projectproduct.repository;

import com.example.projectproduct.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getProduct();
    boolean addProduct(Product product);
    boolean updateProduct(int id,Product product);
    boolean deleteProduct(int id);
    List<Product> searchProduct(String name);
}
