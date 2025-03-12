package com.example.projectproduct.repository;

import com.example.projectproduct.dto.OrderDetailDto;
import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderRepository implements IOrderRepository{

    private final static String SELECT_ALL = "select\n" +
            " ou.id AS order_id,u.`name`,u.phone_number,u.address,ou.`date`, \n" +
            " group_concat(p.`name`) as name_product,sum(p.price*od.quantity) as tong_tien, ou.`status`\n" +
            " from user u\n" +
            " left join order_user ou on u.id=ou.id_user\n" +
            " left join  order_detail od ON ou.id = od.id_order_user \n" +
            " left join product p ON od.id_product = p.id  \n" +
            " where ou.status!='' \n" +
            " group by ou.id order by ou.id;";
    private final static String UPDATE="update order_user set status =? where id=?";
    private final static String DELETE="delete from order_user where id=?";
    private final static String UPDATE_ORDER_DETAIL="";

    @Override
    public List<OrderDto> getOrder() {
        Connection connection = BaseRepository.getConnectDB();
        List<OrderDto> orderDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("order_id");
                String userName =resultSet.getString("name");
                String phoneNumber =resultSet.getString("phone_number");
                String address =resultSet.getString("address");
                String date = resultSet.getString("date");
                String nameProduct=resultSet.getString("name_product");
                String status =resultSet.getString("status");
                double price = resultSet.getDouble("tong_tien");
                OrderDto orderDto = new OrderDto(id,userName,phoneNumber,address,date, nameProduct,price,status);
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

    @Override
    public List<OrderDetailDto> getOrderDetail(int id) {
        String detail="select od.id_product, od.id_order_user, ou.`date`, p.`name`as product_name , od.quantity ,  p.price, p.`description` ,  ou.`status` from user u left join order_user ou on u.id=ou.id_user left join  order_detail od ON ou.id = od.id_order_user  left join product p ON od.id_product = p.id   where ou.id=?";
        Connection connection = BaseRepository.getConnectDB();
        List<OrderDetailDto> orderDetailDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(detail);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idProduct = resultSet.getInt("id_product");
                int idOrderUser = resultSet.getInt("id_order_user");
                String date = resultSet.getString("date");
                String nameProduct= resultSet.getString("product_name");
                int quantity= resultSet.getInt("quantity");
                double price=resultSet.getDouble("price");
                String description =resultSet.getString("description");
                String status =resultSet.getString("status");
                OrderDetailDto orderDetailDto = new OrderDetailDto(idProduct,idOrderUser,date,nameProduct,quantity,price,description,status);
                orderDetailDtoList.add(orderDetailDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderDetailDtoList;
    }
}
