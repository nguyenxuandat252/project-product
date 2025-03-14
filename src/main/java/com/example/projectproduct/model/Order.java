package com.example.projectproduct.model;

public class Order {
    private  int id;
    private String date;
    private String status;
    private int userId;

    public Order() {
    }

    public Order(int id, String date, String status, int userId) {
        this.id = id;
        this.date = date;
        this.status = status;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
