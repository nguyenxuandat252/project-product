package com.example.projectproduct.service;


import com.example.projectproduct.dto.CartDto;
import com.example.projectproduct.model.Product;

public interface IOrderUserService {
    Product getById(int id);
    boolean delete(int id);
    void placeOrder(int userId, CartDto cartDto);
    int getIdUser(String username);
}
