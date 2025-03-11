package com.example.projectproduct.model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private int quality;
    private int idCategory;

    public Product() {
    }

    public Product(int id, String name, double price, String description, int quality, int idCategory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quality = quality;
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

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }
}
