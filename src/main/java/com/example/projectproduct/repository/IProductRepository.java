package com.example.projectproduct.repository;

import com.example.projectproduct.dto.ProductDto;
import com.example.projectproduct.model.Product;

import java.util.List;

public interface IProductRepository {
    List<ProductDto> getProduct();
    boolean addProduct(Product product);
    boolean updateProduct(int id,Product product);
    boolean deleteProduct(int id);
    List<ProductDto> searchProduct(String name);
}
