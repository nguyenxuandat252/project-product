package com.example.projectproduct.repository;

public interface ILoginRepository {
    boolean findByUser(String username, String password);
    String getRole(String username,String password);
}
