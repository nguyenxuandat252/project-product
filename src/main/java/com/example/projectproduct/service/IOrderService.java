package com.example.projectproduct.service;

import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.model.Order;

import java.util.List;

public interface IOrderService {
    List<OrderDto> getOrder();
    boolean updateOrder(int id);
    boolean deleteOrder(int id);

}
