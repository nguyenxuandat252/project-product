package com.example.projectproduct.service;

public interface ILoginService {
    boolean findByUser(String username, String password);
    String getRole(String username,String password);
    int getId(String username, String password);
}
