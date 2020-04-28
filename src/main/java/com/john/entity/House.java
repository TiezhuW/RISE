package com.john.entity;

import lombok.Data;

@Data
public class House {
    private long id;
    private String city;
    private String domain;
    private String direction;
    private String type; //整租or合租
    private String name;
    private String area;
    private String floor;
    private String layout;
    private String lift;
    private String location; //具体位置
    private String price;
    private String url;
}
