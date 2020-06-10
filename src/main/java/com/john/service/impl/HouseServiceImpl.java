package com.john.service.impl;

import com.john.entity.Comment;
import com.john.entity.House;
import com.john.repository.HouseRepository;
import com.john.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    private HouseRepository houseRepository;

    @Override
    public List<House> findAll(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea) {
        return houseRepository.findAll(city, domain, minPrice, maxPrice, minArea, maxArea);
    }

    @Override
    public List<House> findAllInAreaOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea) {
        return houseRepository.findAllInAreaOrderAsc(city, domain, minPrice, maxPrice, minArea, maxArea);
    }

    @Override
    public List<House> findAllInAreaOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea) {
        return houseRepository.findAllInAreaOrderDesc(city, domain, minPrice, maxPrice, minArea, maxArea);
    }

    @Override
    public List<House> findAllInPriceOrderAsc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea) {
        return houseRepository.findAllInPriceOrderAsc(city, domain, minPrice, maxPrice, minArea, maxArea);
    }

    @Override
    public List<House> findAllInPriceOrderDesc(String city, String domain, String minPrice, String maxPrice, String minArea, String maxArea) {
        return houseRepository.findAllInPriceOrderDesc(city, domain, minPrice, maxPrice, minArea, maxArea);
    }

    @Override
    public int moreInfo(String url) {
        return houseRepository.clickTimesInc(url);
    }

    @Override
    public int collect(String username, String url) {
        return houseRepository.addCollection(username, url);
    }

    @Override
    public int cancelCollect(String username, String url) {
        return houseRepository.deleteCollection(username, url);
    }

    @Override
    public House findByUrl(String url) {
        return houseRepository.findByUrl(url);
    }

    @Override
    public int addHouse(House house) {
        return houseRepository.addHouse(house);
    }

    @Override
    public int deleteHouse(String url) {
        return houseRepository.deleteHouse(url);
    }

    @Override
    public List<Comment> findCommentByUrl(String url) {
        return houseRepository.findCommentByUrl(url);
    }

    @Override
    public int addComment(String username, String url, String time, String comment) {
        return houseRepository.addComment(username, url, time, comment);
    }

    @Override
    public int deleteComment(String username, String url) {
        return houseRepository.deleteComment(username, url);
    }
}
