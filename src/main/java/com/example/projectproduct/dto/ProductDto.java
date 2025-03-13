package com.example.projectproduct.dto;

public class ProductDto {
    private int id;
    private String name;
    private double price;
    private String description;
    private int quantity;
    private int idCategory;
    private String nameCategory;
    private String imageUrl;

    public ProductDto() {
    }

    public ProductDto(int id, String name, double price, String description, int quality, int idCategory, String nameCategory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quality;
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
    }
    public ProductDto(int id, String name, double price, String description, int quality, String nameCategory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quality;
        this.nameCategory = nameCategory;
    }

    public ProductDto(String name, double price, String description, int quantity, int idCategory, String imageUrl) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.idCategory = idCategory;
        this.imageUrl = imageUrl;
    }
    public ProductDto(int id, String name, double price, String description, int quantity,String imageUrl, int idCategory ) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.idCategory = idCategory;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }
}
