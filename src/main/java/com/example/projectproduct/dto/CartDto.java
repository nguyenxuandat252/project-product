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
    public void removeProduct(Product product) {
        if (productMap.containsKey(product)) {
            int quantity = productMap.get(product);
            if (quantity > 1) {
                productMap.put(product, quantity - 1); // Giảm số lượng nếu > 1
            } else {
                productMap.remove(product); // Xóa khỏi giỏ nếu chỉ còn 1 sản phẩm
            }
        }
    }
}
