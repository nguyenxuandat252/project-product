package com.example.projectproduct.service;



import com.example.projectproduct.dto.ProductDto;
import com.example.projectproduct.repository.HomeRepository;
import com.example.projectproduct.repository.IHomeRepository;

import java.util.List;

public class HomeService implements IHomeService{
    private IHomeRepository homeRepository= new HomeRepository();
    @Override
    public List<ProductDto> getAll() {
        return homeRepository.getAll();
    }
}
