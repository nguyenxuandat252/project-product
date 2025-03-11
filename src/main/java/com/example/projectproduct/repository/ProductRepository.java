package com.example.projectproduct.repository;

import com.example.projectproduct.model.Product;

import java.util.List;

public class ProductRepository implements IProductRepository {
    private final static String SELECT_ALL = "select product.id,product.`name`,product.price,product.description,product.quality,product.id_category,category.`name` from product left join category on product.id_category=category.id";
    private final static String ADD_NEW = "insert into product (`name`,price,description,quality,id_category) value(?,?,?,?,?)";
    private final static String EDIT = "update product set  `name`=?, price=?,description=?,quality=?,id_category=? WHERE id=?";
    private final static String DELETE = "delete from product where id=?";
    private final static String SEARCH = "SELECT p.*, a.name FROM product p LEFT JOIN accessory a ON p.id_accessory = a.id WHERE p.model LIKE ?";

    @Override
    public List<Product> getProduct() {
        return List.of();
    }

    @Override
    public boolean addProduct(Product product) {
        return false;
    }

    @Override
    public boolean updateProduct(int id, Product product) {
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return false;
    }

    @Override
    public List<Product> searchProduct(String name) {
        return List.of();
    }
}
