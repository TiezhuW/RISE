package com.john.service;

import com.john.entity.House;

import java.util.List;

public interface HouseService {
    List<House> findAll(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);

    List<House> findAllInAreaOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInAreaOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);

    List<House> findAllInPriceOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInPriceOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);

    void clickTimesInc(String url);
}
