package com.example.projectproduct.repository;


import com.example.projectproduct.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepository implements IUserRepository {
    @Override
    public boolean add(User user) {
        Connection connection = BaseRepository.getConnectDB();
        String querySearchUsername = "select id from user where username = ?;";
        String queryAddUser = "insert into user(username, password, name, phone_number, address) values (?, ?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement(querySearchUsername);
            preparedStatement.setString(1, user.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next()) {
                PreparedStatement preparedStatement1 = connection.prepareStatement(queryAddUser);
                preparedStatement1.setString(1, user.getUsername());
                preparedStatement1.setString(2, user.getPassword());
                preparedStatement1.setString(3, user.getName());
                preparedStatement1.setString(4, user.getPhoneNumber());
                preparedStatement1.setString(5, user.getAddress());
                int row = preparedStatement1.executeUpdate();
                return row==1;
            }
        } catch (SQLException e) {
            System.out.println("lỗi thêm user");
        }
        return false;
    }

}
