package com.example.projectproduct.repository;

import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderRepository implements IOrderRepository{

    private final static String SELECT_ALL = "select user.id,user.username,user.phone_number,user.address,order_user.`date`,order_user.`status` from user left join order_user on user.id=order_user.id_user where status='pending'";
    private final static String UPDATE="update order_user set status =? where id=?";
    private final static String DELETE="delete from order_user where id=?";
    @Override
    public List<OrderDto> getOrder() {
        Connection connection = BaseRepository.getConnectDB();
        List<OrderDto> orderDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String userName =resultSet.getString("username");
                String phoneNumber =resultSet.getString("phone_number");
                String address =resultSet.getString("address");
                String date = resultSet.getString("date");
                String status =resultSet.getString("status");
                OrderDto orderDto = new OrderDto(id,userName,phoneNumber,address,date,status);
                orderDtoList.add(orderDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderDtoList;
    }

    @Override
    public boolean updateOrder(int id) {
        Connection connection =BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,"Đã xuất hàng");
            preparedStatement.setInt(2,id);
            int row = preparedStatement.executeUpdate();
            return  row==1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public boolean deleteOrder(int id) {
        Connection connection =BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            int row =preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }
}
