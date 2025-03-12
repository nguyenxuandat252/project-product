package com.example.projectproduct.dto;

public class OrderDetailDto {
    private int idProduct;
    private  int idOrder;
    private String dateOrder;
    private String  nameProduct;
    private int quantity;
    private double price;
    private String description;
    private String status;

    public OrderDetailDto() {
    }

    public OrderDetailDto(int idOrderDetail, int idProduct, String dateOrder, String nameProduct, int quantity, double price, String description, String status) {
        this.idProduct = idOrderDetail;
        this.idOrder = idProduct;
        this.dateOrder = dateOrder;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.status = status;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
