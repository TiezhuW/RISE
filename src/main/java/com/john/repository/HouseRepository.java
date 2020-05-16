package com.john.repository;

import com.john.entity.House;

import java.util.Collection;
import java.util.List;

public interface HouseRepository {
    List<House> findAll(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInAreaOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInAreaOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInPriceOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);
    List<House> findAllInPriceOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea);

    void clickTimesInc(String url);

    House findByUrl(String url);

    void addCollection(String username, String url);
    void deleteCollection(String username, String url);
}
