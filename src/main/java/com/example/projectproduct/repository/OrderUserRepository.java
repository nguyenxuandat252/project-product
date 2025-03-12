package com.example.projectproduct.repository;

import com.example.projectproduct.dto.CartDto;
import com.example.projectproduct.model.Product;

import java.sql.*;
import java.util.Map;

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

    @Override
    public void placeOrder(int userId, CartDto cartDto) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // 1️⃣ Tạo đơn hàng mới trong bảng `order_user`
            String orderQuery = "INSERT INTO order_user (id_user) VALUES (?)";
            PreparedStatement orderStmt = connection.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userId);
            orderStmt.executeUpdate();

            // Lấy ID của đơn hàng vừa tạo
            ResultSet rs = orderStmt.getGeneratedKeys();
            int orderId = -1;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // 2️⃣ Lưu chi tiết đơn hàng vào bảng `order_detail`
            String orderDetailQuery = "INSERT INTO order_detail (id_product, id_order_user, quantity) VALUES (?, ?, ?)";
            PreparedStatement orderDetailStmt = connection.prepareStatement(orderDetailQuery);

            for (Map.Entry<Product, Integer> entry : cartDto.getProductMap().entrySet()) {
                orderDetailStmt.setInt(1, entry.getKey().getId());
                orderDetailStmt.setInt(2, orderId);
                orderDetailStmt.setInt(3, entry.getValue());
                orderDetailStmt.executeUpdate();
            }

            connection.commit(); // Xác nhận transaction
        } catch (SQLException e) {
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true); // Bật lại chế độ auto commit
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public int getIdUser(String username) {
        Connection connection = BaseRepository.getConnectDB();
        int id = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select id from user where username = ? ;");
            preparedStatement.setString(1,username);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                id = resultSet.getInt("id");
                return id;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }
}
