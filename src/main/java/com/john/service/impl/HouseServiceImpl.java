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
    public List<House> findAll(String city, String domain, int minPrice, int maxPrice, int minArea, int maxArea) {
        return houseRepository.findAll(city, domain, minPrice, maxPrice, minArea, maxArea);
    }

    @Override
    public List<House> findAllInAreaOrder(String city, String domain, int minPrice, int maxPrice, int minArea, int maxArea) {
        return houseRepository.findAllInAreaOrder(city, domain, minPrice, maxPrice, minArea, maxArea);
    }

    @Override
    public List<House> findAllInPriceOrder(String city, String domain, int minPrice, int maxPrice, int minArea, int maxArea) {
        return houseRepository.findAllInPriceOrder(city, domain, minPrice, maxPrice, minArea, maxArea);
    }
}
