package com.example.projectproduct.repository;

import com.example.projectproduct.dto.ProductDto;
import com.example.projectproduct.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final static String SELECT_ALL = "select product.id,product.name,product.price,product.description,product.quantity,product.id_category,category.name as category_name  from product left join category on product.id_category=category.id";
    private final static String ADD_NEW = "insert into product (`name`,price,description,quantity,id_category,image_Url) value(?,?,?,?,?,?)";
    private final static String EDIT = "update product set  `name`=?, price=?,description=?,quantity=?,image_Url,id_category=? WHERE id=?";
    private final static String DELETE = "delete from product where id=?";
    private final static String SEARCH = "SELECT p.*, c.name FROM product p LEFT JOIN category c ON p.id_category = c.id WHERE p.name LIKE ?";

    @Override
    public List<ProductDto> getProduct() {
        Connection connection = BaseRepository.getConnectDB();
        List<ProductDto> productDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int quality = resultSet.getInt("quantity");
                int idCategory = resultSet.getInt("id_category");
                String nameCategory = resultSet.getString("category_name");
                ProductDto productDto = new ProductDto(id,code,price,description,quality,idCategory,nameCategory);
                productDtoList.add(productDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDtoList;
    }

    @Override
    public boolean addProduct(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setInt(4,product.getQuantity());
            preparedStatement.setInt(5,product.getIdCategory());
            preparedStatement.setString(6,product.getImageUrl());
            int row = preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public boolean updateProduct(int id, Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(EDIT);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setString(3,product.getDescription());
            preparedStatement.setDouble(4,product.getQuantity());
            preparedStatement.setInt(5,product.getIdCategory());
            preparedStatement.setString(6, product.getImageUrl());
            preparedStatement.setInt(7,product.getId());
            int row=preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public boolean deleteProduct(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement =connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            int row =preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public List<ProductDto> searchProduct(String name) {
        List<ProductDto> newProduct = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement  =connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idSearch = resultSet.getInt("id");
                String nameSearch = resultSet.getString("name");
                double priceSearch = resultSet.getDouble("price");
                String descriptionSearch = resultSet.getString("description");
                int qualitySearch = resultSet.getInt("quantity");
                int idCategorySearch = resultSet.getInt("id_category");
                String nameCategorySearch = resultSet.getString("name");
                ProductDto productDto = new ProductDto(idSearch,nameSearch,priceSearch,descriptionSearch,qualitySearch, idCategorySearch,nameCategorySearch);
                newProduct.add(productDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newProduct;
    }
}
