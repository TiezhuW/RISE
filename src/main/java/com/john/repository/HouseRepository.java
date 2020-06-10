package com.john.repository;

import com.john.entity.Comment;
import com.john.entity.House;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseRepository {
    List<House> findAll(String city, String domain, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice, @Param("minArea") String minArea, @Param("maxArea") String maxArea);
    List<House> findAllInAreaOrderAsc(String city, String domain, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice, @Param("minArea") String minArea, @Param("maxArea") String maxArea);
    List<House> findAllInAreaOrderDesc(String city, String domain, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice, @Param("minArea") String minArea, @Param("maxArea") String maxArea);
    List<House> findAllInPriceOrderAsc(String city, String domain, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice, @Param("minArea") String minArea, @Param("maxArea") String maxArea);
    List<House> findAllInPriceOrderDesc(String city, String domain, @Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice, @Param("minArea") String minArea, @Param("maxArea") String maxArea);

    int clickTimesInc(String url);

    House findByUrl(String url);
    int addHouse(House house);
    int deleteHouse(String url);

    int addCollection(String username, String url);
    int deleteCollection(String username, String url);

    List<Comment> findCommentByUrl(String url);
    int addComment(String username, String url, String time, String comment);
    int deleteComment(String username, String url);
}
