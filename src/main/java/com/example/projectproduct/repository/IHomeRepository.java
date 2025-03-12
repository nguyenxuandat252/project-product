package com.example.projectproduct.repository;


import com.example.projectproduct.dto.ProductDto;

import java.util.List;

public interface IHomeRepository {
    List<ProductDto> getAll();
}
