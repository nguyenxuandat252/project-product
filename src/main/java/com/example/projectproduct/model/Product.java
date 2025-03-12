package com.example.projectproduct.model;

import java.util.Objects;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private int quantity;
    private int idCategory;

    public Product() {
    }

    public Product(int id, String name, double price, String description, int quality, int idCategory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quality;
        this.idCategory = idCategory;
    }

    public Product(String name, double price, String description, int quality, int idCategory) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quality;
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

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return id == product.id;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
