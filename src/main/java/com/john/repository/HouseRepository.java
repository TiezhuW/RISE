package com.john.repository;

import com.john.entity.House;

import java.util.List;

public interface HouseRepository {
    List<House> findAll(String city, String domain, int minPrice, int maxPrice, int minArea, int maxArea);
    List<House> findAllInAreaOrder(String city, String domain, int minPrice, int maxPrice, int minArea, int maxArea);
    List<House> findAllInPriceOrder(String city, String domain, int minPrice, int maxPrice, int minArea, int maxArea);
}
