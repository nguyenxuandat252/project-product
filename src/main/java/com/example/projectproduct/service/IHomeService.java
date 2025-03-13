package com.example.projectproduct.service;


import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.dto.ProductDto;

import java.util.List;

public interface IHomeService {
    List<ProductDto> getAll();
    List<ProductDto> getLaptop();
    List<ProductDto> getPhone();
    List<OrderDto> getYourorder();
}
