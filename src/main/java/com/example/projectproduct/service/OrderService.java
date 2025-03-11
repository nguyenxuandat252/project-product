package com.example.projectproduct.service;

import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.model.Order;
import com.example.projectproduct.repository.IOrderRepository;
import com.example.projectproduct.repository.OrderRepository;

import java.util.List;

public class OrderService implements IOrderService {
    IOrderRepository orderRepository = new OrderRepository();
    @Override
    public List<OrderDto> getOrder() {
        return orderRepository.getOrder();
    }

    @Override
    public boolean updateOrder(int id) {
        return orderRepository.updateOrder(id);
    }

    @Override
    public boolean deleteOrder(int id) {
        return orderRepository.deleteOrder(id);
    }
}
