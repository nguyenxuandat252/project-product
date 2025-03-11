package com.example.projectproduct.service;

import com.example.projectproduct.dto.ProductDto;
import com.example.projectproduct.model.Product;
import com.example.projectproduct.repository.BaseRepository;
import com.example.projectproduct.repository.IProductRepository;
import com.example.projectproduct.repository.ProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<ProductDto> getProduct() {
        return productRepository.getProduct();
    }

    @Override
    public boolean addProduct(Product product) {
        return productRepository.addProduct(product);
    }

    @Override
    public boolean updateProduct(int id, Product product) {
        Product product1 = findById(id);
        if (product1!=null){
            productRepository.updateProduct(id,product);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return productRepository.deleteProduct(id);
    }

    @Override
    public List<ProductDto> searchProduct(String name) {
        return productRepository.searchProduct(name);
    }

    @Override
    public Product findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Product product = null;
        String query  = "select * from product where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int findId = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int quality = resultSet.getInt("quality");
                int releaseDate = resultSet.getInt("id_category");
                product = new Product(findId,name,price,description,quality,releaseDate);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }
}
