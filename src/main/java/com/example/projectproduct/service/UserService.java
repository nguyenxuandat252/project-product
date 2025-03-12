package com.example.projectproduct.service;


import com.example.projectproduct.model.User;
import com.example.projectproduct.repository.IUserRepository;
import com.example.projectproduct.repository.UserRepository;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }
}
