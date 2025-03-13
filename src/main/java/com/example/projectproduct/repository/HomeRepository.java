package com.example.projectproduct.repository;


import com.example.projectproduct.dto.OrderDto;
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
            PreparedStatement preparedStatement = connection.prepareStatement("select p.id,p.name,p.price,p.description,p.quantity,p.image_Url,p.id_category from product p left join category c on p.id_category = c.id;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int quantity = resultSet.getInt("quantity");
                int id_category = resultSet.getInt("id_category");
                String imageUrl = resultSet.getString("image_Url");
                ProductDto productDto = new ProductDto(id,name,price,description,quantity,imageUrl,id_category);
                productDtos.add(productDto);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi");
        }
        return productDtos;
    }

    @Override
    public List<ProductDto> getLaptop() {
        List<ProductDto> productDtos = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select p.id,p.name,p.price,p.description,p.quantity,p.image_Url,p.id_category from product p left join category c on p.id_category = c.id WHERE LOWER(p.description) LIKE '%laptop%';");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int quantity = resultSet.getInt("quantity");
                int id_category = resultSet.getInt("id_category");
                String imageUrl = resultSet.getString("image_Url");
                ProductDto productDto = new ProductDto(id,name,price,description,quantity,imageUrl,id_category);
                productDtos.add(productDto);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi");
        }
        return productDtos;
    }

    @Override
    public List<ProductDto> getPhone() {
        List<ProductDto> productDtos = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select p.id,p.name,p.price,p.description,p.quantity,p.image_Url,p.id_category from product p left join category c on p.id_category = c.id WHERE LOWER(p.description) LIKE '%Điện thoại%';");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int quantity = resultSet.getInt("quantity");
                int id_category = resultSet.getInt("id_category");
                String imageUrl = resultSet.getString("image_Url");
                ProductDto productDto = new ProductDto(id,name,price,description,quantity,imageUrl,id_category);
                productDtos.add(productDto);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi");
        }
        return productDtos;
    }

    @Override
    public List<OrderDto> getYourorder(int id) {
        List<OrderDto> orderDtos = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT ou.date,ou.status,p.name AS product_name,p.price,od.quantity,(p.price * od.quantity) AS total_price,c.name AS category_name\n" +
                    "FROM order_user ou\n" +
                    "JOIN order_detail od ON ou.id = od.id_order_user\n" +
                    "JOIN product p ON od.id_product = p.id\n" +
                    "JOIN category c ON p.id_category = c.id\n" +
                    "WHERE ou.id_user = ?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String date = resultSet.getString("date");
                String status = resultSet.getString("status");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                double sumMoney = resultSet.getDouble("total_price");
                OrderDto orderDto = new OrderDto(date,status,name,price,quantity,sumMoney);
                orderDtos.add(orderDto);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi");
        }
        return orderDtos;
    }
}
