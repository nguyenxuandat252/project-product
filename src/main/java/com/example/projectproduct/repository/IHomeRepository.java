package com.example.projectproduct.repository;


import com.example.projectproduct.dto.OrderDto;
import com.example.projectproduct.dto.ProductDto;

import java.util.List;

public interface IHomeRepository {
    List<ProductDto> getAll();
    List<ProductDto> getLaptop();
    List<ProductDto> getPhone();
    List<OrderDto> getYourorder(int id);
}
