package com.john.entity;

import lombok.Data;

@Data
public class Comment {
    private User user;
    private House house;
    private String comment;
}
