package com.example.projectproduct.model;

public class User {
    private int id;
    private String username;
    private String password;
    private String role;
    private String phoneNumber;
    private String address;

    public User() {
    }

    public User(int id, String username, String password, String role, String phoneNumber, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.phoneNumber = phoneNumber;
        this.address = address;

    }
    public User(String username, String password, String phoneNumber, String address) {
        this.username = username;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.address = address;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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
}
