package com.example.projectproduct.dto;

public class OrderDto {
    private int id;
    private String userName;
    private String phoneNumber;
    private String address;
    private String date;
    private String status;

    public OrderDto() {
    }

    public OrderDto(int id, String userName, String phoneNumber, String address, String date, String status) {
        this.id = id;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
