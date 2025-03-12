package com.example.projectproduct.service;


import com.example.projectproduct.dto.ProductDto;

import java.util.List;

public interface IHomeService {
    List<ProductDto> getAll();
}
