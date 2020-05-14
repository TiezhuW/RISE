package com.john.entity;

import lombok.Data;

import java.util.List;

@Data
public class User {
    private String username;
    private String password;
    private String email;
    private String phone;
    private List<House> collection;
}
