package com.example.projectproduct.repository;


import com.example.projectproduct.dto.CartDto;
import com.example.projectproduct.model.Product;

public interface IOrderUserRepository {
    Product getById(int id);
    boolean delete(int id);
    void placeOrder(int userId, CartDto cartDto);
    int getIdUser(String username);

}
