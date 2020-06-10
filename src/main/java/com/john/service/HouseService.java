package com.john.service;

import com.john.entity.Comment;
import com.john.entity.House;

import java.util.List;

public interface HouseService {
    List<House> findAll(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInAreaOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInAreaOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInPriceOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInPriceOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);

    int moreInfo(String url);

    int collect(String username, String url);
    int cancelCollect(String username, String url);

    House findByUrl(String url);
    int addHouse(House house);
    int deleteHouse(String url);

    List<Comment> findCommentByUrl(String url);
    int addComment(String username, String url, String time, String comment);
    int deleteComment(String username, String url);
}
