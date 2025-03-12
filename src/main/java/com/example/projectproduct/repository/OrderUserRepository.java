package com.example.projectproduct.repository;

import com.example.projectproduct.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderUserRepository implements IOrderUserRepository {

    @Override
    public Product getById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from product where id= ?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idProduct = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int quantity = resultSet.getInt("quantity");
                int idCategory = resultSet.getInt("id_Category");
                Product product = new Product(idProduct,name, price,description,quantity,idCategory);
                return product;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public boolean delete(int id) {
        String query = "delete from order_user where id = ?";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);

            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (Exception e) {
            System.out.println("lỗi");
            return false;
        }

    }
}
