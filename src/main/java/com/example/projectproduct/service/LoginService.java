package com.example.projectproduct.service;


import com.example.projectproduct.repository.ILoginRepository;
import com.example.projectproduct.repository.LoginRepository;

public class LoginService implements ILoginService{
    private ILoginRepository loginRepository = new LoginRepository();
    @Override
    public boolean findByUser(String username, String password) {
        return loginRepository.findByUser(username,password);
    }

    @Override
    public String getRole(String username, String password) {
        return loginRepository.getRole(username,password);
    }
}
