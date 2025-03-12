package com.example.projectproduct.repository;


import com.example.projectproduct.model.Product;

public interface IOrderUserRepository {
    Product getById(int id);
    boolean delete(int id);

}
