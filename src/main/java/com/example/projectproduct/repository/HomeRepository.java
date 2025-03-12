package com.example.projectproduct.repository;


import com.example.projectproduct.dto.ProductDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HomeRepository implements IHomeRepository{

    @Override
    public List<ProductDto> getAll() {
        List<ProductDto> productDtos = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select p.id,p.name,p.price,p.description,p.quantity,c.name from product p left join category c on p.id_category = c.id;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int quantity = resultSet.getInt("quantity");
                String nameCategory = resultSet.getString("name");
                ProductDto productDto = new ProductDto(id,name,price,description,quantity,nameCategory);
                productDtos.add(productDto);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi");
        }
        return productDtos;
    }
}
