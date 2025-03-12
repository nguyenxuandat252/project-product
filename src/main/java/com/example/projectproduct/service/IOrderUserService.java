package com.example.projectproduct.service;


import com.example.projectproduct.model.Product;

public interface IOrderUserService {
    Product getById(int id);
    boolean delete(int id);
}
