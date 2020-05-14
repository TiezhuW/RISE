package com.john.service.impl;

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
    public void clickTimesInc(String url) {
        houseRepository.clickTimesInc(url);
    }
}
