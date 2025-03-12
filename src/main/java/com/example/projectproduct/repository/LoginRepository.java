package com.example.projectproduct.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginRepository implements ILoginRepository{
    @Override
    public boolean findByUser(String username, String password) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select id from user where username = ? and password = ?;");
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return true;
            }
        } catch (SQLException e) {
            System.out.println("lỗi login");
        }
        return false;
    }

    @Override
    public String getRole(String username, String password) {
        Connection connection = BaseRepository.getConnectDB();
        String role = null;
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select role from user where username = ? and password = ?;");
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                role = resultSet.getString("role");
                return role;
            }
        } catch (SQLException e) {
            System.out.println("lỗi");
        }
        return role;
    }
}
