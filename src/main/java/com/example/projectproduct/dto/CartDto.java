package com.example.projectproduct.dto;



import com.example.projectproduct.model.Product;

import java.util.HashMap;
import java.util.Map;

public class CartDto {
    private Map<Product,Integer> productMap =new HashMap<>();

    public Map<Product, Integer> getProductMap() {
        return productMap;
    }

    public void addProduct(Product product) {
      if(productMap.containsKey(product)){
          productMap.put(product,productMap.get(product)+1);
      }else {
          productMap.put(product,1);
      }
    }
}
