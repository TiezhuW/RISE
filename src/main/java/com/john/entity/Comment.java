package com.john.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Comment {
    private User user;
    private House house;
    private String time;
    private String comment;
}
