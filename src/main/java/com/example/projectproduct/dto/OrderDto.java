package com.example.projectproduct.dto;

public class OrderDto {
    private int id;
    private String name;
    private String phoneNumber;
    private String address;
    private String date;
    private String nameProduct;
    private int quantity;
    private double price;
    private String status;
    private double sumMonney;

    public OrderDto() {
    }

    public OrderDto(int id, String name, String phoneNumber, String address, String date, String nameProduct, int quantity, double price, String status) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.date = date;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
    }

    public OrderDto(int id, String name, String phoneNumber, String address, String date, String nameProduct, double price, String status) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.date = date;
        this.nameProduct = nameProduct;
        this.price = price;
        this.status = status;
    }
    
    public OrderDto(int id, String nameProduct, double price, int quantity,double sumMonney) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.price = price;
        this.sumMonney = sumMonney;
    }

    public OrderDto( String date, String status, String nameProduct, double price,int quantity, double sumMonney) {
        this.date = date;
        this.nameProduct = nameProduct;
        this.price = price;
        this.status = status;
        this.quantity = quantity;
        this.sumMonney = sumMonney;
    }

    public double getSumMonney() {
        return sumMonney;
    }

    public void setSumMonney(double sumMonney) {
        this.sumMonney = sumMonney;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
