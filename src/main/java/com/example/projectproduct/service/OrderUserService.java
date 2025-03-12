package com.example.projectproduct.service;


import com.example.projectproduct.model.Product;
import com.example.projectproduct.repository.IOrderUserRepository;
import com.example.projectproduct.repository.OrderUserRepository;

public class OrderUserService implements IOrderUserService {
    private IOrderUserRepository orderUserRepository= new OrderUserRepository();


    @Override
    public Product getById(int id) {
        return orderUserRepository.getById(id);
    }

    @Override
    public boolean delete(int id) {
        return orderUserRepository.delete(id);
    }
}
